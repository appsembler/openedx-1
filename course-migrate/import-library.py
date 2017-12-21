import os

from opaque_keys.edx.keys import CourseKey
from django_comment_common.utils import (seed_permissions_roles,
                                         are_permissions_roles_seeded)
from xmodule.modulestore.xml_importer import import_library_from_xml
from xmodule.modulestore import ModuleStoreEnum
from xmodule.modulestore.django import modulestore
from xmodule.contentstore.django import contentstore


mstore = modulestore()
do_import_static = True
data_dir = '/edx/app/edxapp/data'

course_items = import_library_from_xml(
    mstore, ModuleStoreEnum.UserID.mgmt_command, data_dir, [library_dir], load_error_modules=False,
    static_content_store=contentstore(), verbose=True,
    do_import_static=do_import_static,
    target_id=# TODO: Do this Omar
    create_if_not_present=True,
)
