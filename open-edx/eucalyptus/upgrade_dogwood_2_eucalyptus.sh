#!/usr/bin/env bash

# Setting OPENEDX_DEBUG makes this more verbose.
if [[ $OPENEDX_DEBUG ]]; then
    set -x
fi

# Stop if any command fails.
set -e

# Logging: write all the output to a timestamped log file.
sudo mkdir -p /var/log/edx
exec > >(sudo tee /var/log/edx/upgrade-$(date +%Y%m%d-%H%M%S).log) 2>&1

# defaults
CONFIGURATION="none"
TARGET=${OPENEDX_RELEASE-none}
INTERACTIVE=true
OPENEDX_ROOT="/edx"

# Use this function to exit the script: it helps keep the output right with the
# exec-logging we started above.
exit_cleanly () {
  sleep .25
  echo
  exit $@
}

# check_pip succeeds if its first argument is found in the output of pip freeze.
PIP_EDXAPP="sudo -u edxapp -H $OPENEDX_ROOT/bin/pip.edxapp --disable-pip-version-check"
check_pip () {
  how_many=$($PIP_EDXAPP list 2>&- | grep -c "^$1 ")
  if (( $how_many > 0 )); then
    return 0
  else
    return 1
  fi
}

show_help () {
  cat << EOM

Upgrades your Open edX installation to a newer release.

-c CONFIGURATION
    Use the given configuration. Either "devstack" or "fullstack". You
    must specify this.

-t TARGET
    Upgrade to the given git ref. Open edX releases are called
    "open-release/eucalyptus.1", "open-release/eucalyptus.latest", and so on.
    Defaults to \$OPENEDX_RELEASE if it is defined.

-y
    Run in non-interactive mode (reply "yes" to all questions)

-r OPENEDX_ROOT
    The root directory under which all Open edX applications are installed.
    Defaults to "$OPENEDX_ROOT"

-h
    Show this help and exit.

EOM
}

# override defaults with options
while getopts "hc:t:y" opt; do
  case "$opt" in
    h)
      show_help
      exit_cleanly 0
      ;;
    c)
      CONFIGURATION=$OPTARG
      ;;
    t)
      TARGET=$OPTARG
      ;;
    y)
      INTERACTIVE=false
      ;;
    r)
      OPENEDX_ROOT=$OPTARG
      ;;
  esac
done

# Helper to ask to proceed.
confirm_proceed () {
  echo "Do you wish to proceed?"
  read input
  if [[ "$input" != "yes" && "$input" != "y" ]]; then
    echo "Quitting"
    exit_cleanly 1
  fi
}

# Check we are in the right place, and have the info we need.
if [[ ! -d ${OPENEDX_ROOT}/app/edxapp ]]; then
  echo "Run this on your Open edX machine."
  exit_cleanly 1
fi

if [[ $TARGET == none ]]; then
  cat <<"EOM"
You must specify a target. This should be the next Open edX release after the
one you are currently running.  This script can only move forward one release
at a time.
EOM
  show_help
  exit_cleanly 1
fi

if [[ $CONFIGURATION == none ]]; then
  echo "You must specify a configuration, either fullstack or devstack."
  exit_cleanly 1
fi

APPUSER=edxapp
if [[ $CONFIGURATION == fullstack ]] ; then
  APPUSER=www-data
fi



if [[ -f ${OPENEDX_ROOT}/app/edx_ansible/server-vars.yml ]]; then
  SERVER_VARS="--extra-vars=\"@${OPENEDX_ROOT}/app/edx_ansible/server-vars.yml\""
fi

# When tee'ing to a log, ansible (like many programs) buffers its output. This
# makes it hard to tell what is actually happening during the upgrade.
# "stdbuf -oL" will run ansible with line-buffered stdout, which makes the
# messages scroll in the way people expect.
ANSIBLE_PLAYBOOK="sudo stdbuf -oL ansible-playbook --inventory-file=localhost, --connection=local "

make_config_venv () {
  virtualenv venv
  source venv/bin/activate
  pip install -r configuration/pre-requirements.txt
  pip install -r configuration/requirements.txt
}

TEMPDIR=`mktemp -d`
echo "Working in $TEMPDIR"
chmod 777 $TEMPDIR
cd $TEMPDIR
# Set the CONFIGURATION_TARGET environment variable to use a different branch
# in the configuration repo, defaults to $TARGET.
git clone https://github.com/edx/configuration.git \
  --depth=1 --single-branch --branch=${CONFIGURATION_TARGET-$TARGET}
make_config_venv

# Eucalyptus details

if [[ $TARGET == *eucalyptus* ]] ; then
  if check_pip edx-oauth2-provider ; then
    echo "Uninstall edx-oauth2-provider"
    $PIP_EDXAPP uninstall -y edx-oauth2-provider
  fi
  if check_pip django-oauth2-provider ; then
    echo "Uninstall django-oauth2-provider"
    $PIP_EDXAPP uninstall -y django-oauth2-provider
  fi

  # edx-milestones changed how it was installed, so it is possible to have it
  # installed twice.  Try to uninstall it twice.
  if check_pip edx-milestones ; then
    echo "Uninstall edx-milestones"
    $PIP_EDXAPP uninstall -y edx-milestones
  fi
  if check_pip edx-milestones ; then
    echo "Uninstall edx-milestones again"
    $PIP_EDXAPP uninstall -y edx-milestones
  fi

  if [[ $CONFIGURATION == devstack ]] ; then
    echo "Remove old Firefox"
    sudo apt-get purge -y firefox
  fi

  echo "Upgrade the code"
  cd configuration/playbooks/vagrant
  $ANSIBLE_PLAYBOOK \
    $SERVER_VARS \
    --extra-vars="edx_platform_version=$TARGET" \
    --extra-vars="xqueue_version=$TARGET" \
    --extra-vars="migrate_db=no" \
    --skip-tags="edxapp-sandbox,gather_static_assets" \
    vagrant-$CONFIGURATION-delta.yml
  cd ../../..

  echo "Migrate to fix oauth2_provider"
  ${OPENEDX_ROOT}/bin/edxapp-migrate-lms --fake oauth2_provider zero
  ${OPENEDX_ROOT}/bin/edxapp-migrate-lms --fake-initial

  echo "Clean up forums Ruby detritus"
  sudo rm -rf ${OPENEDX_ROOT}/app/forum/.rbenv ${OPENEDX_ROOT}/app/forum/.gem
fi

# Update to target.

echo "Updating to final version of code"
cd configuration/playbooks
echo "edx_platform_version: $TARGET" > vars.yml
echo "certs_version: $TARGET" >> vars.yml
echo "forum_version: $TARGET" >> vars.yml
echo "xqueue_version: $TARGET" >> vars.yml
echo "demo_version: $TARGET" >> vars.yml
echo "NOTIFIER_VERSION: $TARGET" >> vars.yml
echo "ECOMMERCE_VERSION: $TARGET" >> vars.yml
echo "ECOMMERCE_WORKER_VERSION: $TARGET" >> vars.yml
echo "PROGRAMS_VERSION: $TARGET" >> vars.yml
$ANSIBLE_PLAYBOOK \
    --extra-vars="@vars.yml" \
    $SERVER_VARS \
    vagrant-$CONFIGURATION.yml
cd ../..

cd /
sudo rm -rf $TEMPDIR
echo "Upgrade complete. Please reboot your machine."