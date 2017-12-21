# Create LXC VM for 12.04.5
# sudo lxc-create -t download -n myNode -d ubuntu -r precise -a amd64
sudo apt-get update --fix-missing
sudo apt-get upgrade --fix-missing
sudo bash install-openedx.sh "open-release/eucalyptus.1" | tee /tmp/openedx-install.log

