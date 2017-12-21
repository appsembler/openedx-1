#!/usr/bin/env python
# Copyright (c) NodeRabbit, Inc. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

import os
import subprocess
from os import path
from bs4 import BeautifulSoup

from shutil import move, rmtree

import tarfile

import re

DIR = path.realpath('.')
SCRIPT_DIR = path.realpath(path.dirname(__file__))
DRY_RUN = True


def system(shell_code):
    print '$', shell_code

    if not DRY_RUN:
        os.system(shell_code)


def read_file_in_tgz(filename, sub_filename):
    with tarfile.open(filename, 'r:gz') as tgz:
        file_obj = tgz.extractfile(sub_filename)

        if file_obj:
            return file_obj.read()


def process_course_tgz_file(filename):
    course_xml = read_file_in_tgz(filename, 'course/course.xml')

    print 'Course XML:', course_xml

    soup = BeautifulSoup(course_xml, 'lxml')
    course_xml_dom = soup.select_one('course')
    print course_xml_dom


def is_library_file(filename):
    try:
        return bool(read_file_in_tgz(filename, 'library/library.xml'))
    except KeyError:
        return False


def execfile_in_edxapp_env(filepath, exports):
    shell = 'sudo -u edxapp /edx/bin/python.edxapp /edx/bin/manage.edxapp lms --settings={env} shell'.format(
        env='devstack_appsembler' if os.path.exists('/edx/src') else 'aws_appsembler',
    )

    os.system('echo "{exports}; execfile(\'{filepath}\')" | {shell}'.format(
        filepath=filepath,
        exports='; '.join(['{key}=\'{val}\''.format(key=key, val=val) for key, val in exports.iteritems()]),
        shell=shell,
    ))


def process_library_tgz_file(filename):
    print read_file_in_tgz(filename, 'library/library.xml')

    lib_dir = '/tmp/library'

    rmtree(lib_dir, ignore_errors=True)
    os.makedirs(lib_dir)
    os.chmod(lib_dir, 0777)

    subprocess.call(['tar', '-zxvf', filename, '-C', lib_dir])
    os.unlink(filename)

    subprocess.call(['chmod', '-R', '0777', lib_dir])

    import_lib_script = path.join(SCRIPT_DIR, 'import-library.py')
    print 'Executing', import_lib_script
    execfile_in_edxapp_env(import_lib_script, exports={
        'library_dir': path.join(lib_dir, 'library'),
    })

    rmtree(lib_dir)


def process_file(filename):
    print 'Processing:', filename

    if is_library_file(filename):
        process_library_tgz_file(filename)
    else:
        process_course_tgz_file(filename)


def extract_zip_files():
    for filename in os.listdir(DIR):

        if filename.endswith('.zip'):
            print 'Found a zip file, extracting it: ', filename

            subprocess.call(['unzip', filename])

            os.unlink(filename)


def ensure_courses_files_only():
    has_non_course_files = False

    for parent, _dirnames, filenames in os.walk(DIR):
        for filename in filenames:
            if not (filename.endswith('.zip') or filename.endswith('.tar.gz')):
                has_non_course_files = True
                print 'Found non-course file', parent, filename

    if has_non_course_files:
        raise Exception('There are some non-course files, remove them first.')


def flatten_directories():
    for parent, _dirnames, filenames in os.walk(DIR, topdown=True):
        for filename in filenames:
            full_path = path.join(parent, filename)
            relative_path = path.relpath(full_path, DIR)

            if path.sep in relative_path:
                flattened = relative_path.replace(path.sep, '--')
                dest = path.join(DIR, re.sub(r'[^a-zA-Z0-9.\-]', '_', flattened))

                print 'Moving', full_path, 'to', dest
                move(full_path, dest)

    for parent, dirnames, _filenames in os.walk(DIR, topdown=False):
        for dirname in dirnames:
            dir_fullpath = path.join(parent, dirname)
            print 'Deleting empty dir', dir_fullpath
            try:
                os.rmdir(dir_fullpath)
            except OSError:
                if path.exists(dir_fullpath):
                    print 'Found a non-empty directory', dir_fullpath
                    print 'Contents:', os.listdir(dir_fullpath)
                raise


def process_files():
    for filename in os.listdir(DIR):
        if filename.endswith('.tar.gz'):
            process_file(filename)
        else:
            raise Exception('Found a non `tar.gz` file: {filename}'.format(filename=filename))


def main():
    ensure_courses_files_only()
    flatten_directories()
    extract_zip_files()
    process_files()


if __name__ == '__main__':
    main()
