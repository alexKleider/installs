#!/usr/bin/env python3

# File: collect_and_tar.py

"""
Developed to collect dotfiles but can deal with any file containing
a listing of any file names.  Default is to read 'dotfiles2move'.
Reads the input file and places each file name it contains into a
temporary directory which is deleted after being 'tar'ed.
It can then be encrypted.
Can accept 0, 1 or 2 params.
With no params: input defaults to 'dotfiles2move'
and ouput file defaults to 'dotfiles.tar.gz' which can then be
encrypted using the encrype.sh script and then deleted.
"""

import os
import sys
import shutil
import tarfile
import datetime

VERSION = '0.0.1'

# assign default file names:
infile = 'dotfiles2move'
outfile = 'dir_of_dotfiles'


def get_timestamp():
    date_template = "%y-%m-%d_%H-%M"
    today = datetime.datetime.today()
    return today.strftime(date_template)


# consider params if any:
if len(sys.argv) > 1:
    infile = sys.argv[1]
    if len(sys.argv) > 2:
        if sys.argv[2] == 'timestamp': outfile = get_timestamp()
        else: outfile = sys.argv[2]


def useful_lines(stream, comment="#"):
    """
    A generator which accepts a stream of lines (strings.)
    Blank lines are ignored.
    If <comment> resolves to true, lines beginning with <comment>
    (after being stripped of leading spaces) are also ignored.
    <comment> can be set to <None> if don't want this functionality.
    Other lines are returned ("yield"ed) stripped of leading and
    trailing white space.
    """
    for line in stream:
        line = line.strip()
        if comment and line.startswith(comment):
            continue
        if line:
            yield line


def collect_file_names(infile):
    res = []
    with open(infile, 'r') as stream:
        for line in useful_lines(stream):
            res.append(line)
    return res

def archive(sources,
            destination_directory,  # the destination directory
            targz_base_name,
            quiet=False):
    """
    All files and directories listed in <sources> are archived into
    <targz_base_name>.tar.gz which is placed into <dest_dir>.
    Returns False if there are any irregularities, else returns True.
    A 'False' return does not necessarily mean that archiving failed.
    Returns 'True' if archiving is done.
    A temporary <targz_base_name> directory is created and may get
    left behind if irregularities occur or user aborts.
    If <quiet> is set to <True> no user interaction is done.
    """
    ret = True  # return value => "False" if irregularities occur
    copied = False  # nothing copied (yet)
    tar_file = "{}.tar.gz".format(targz_base_name)
    new_path = os.path.join(destination_directory,
                            tar_file)  # full path name of archive
    if os.path.exists(new_path):  # Unlikely if using defaults
        print("Specified tar file already exists...")
        print("... '{}'.".format(new_path))
        return False  # won't overwrite an existing tar file.
    try:   # base_name defaults to a time stamp
        os.mkdir(targz_base_name)  # create a temporary dir
    except FileExistsError:  # Unlikely if using defaults
        print("Temporary directory '{}' already exists."
              .format(targz_base_name))
        return False
    for source in sources:
#       print("source: '{}'".format(source))
#       print("targz_base_name: '{}'".format(targz_base_name))
        dest = os.path.join(targz_base_name,
                os.path.split(source)[1])
#       print("dest: '{}'".format(dest))
        if not quiet:
            response = input(
                "Copy '{}' into '{}'? (y/n) ".format(source, dest))
            if not (response and response[0] in {'y', 'Y'}):
                ret = False
                print("... failed to move '{}' into '{}'!"
                        .format(source, dest))
                continue
        if os.path.isfile(source):
            shutil.copy2(source, dest)
            copied = True
            if not quiet:
                print("... copied file '{}' into '{}'"
                        .format(source, dest))
        elif os.path.isdir(source):
            shutil.copytree(source, dest)
            copied = True
            if not quiet:
                print("... copied directory '{}' into '{}'"
                        .format(source, dest))
        else:
            if not quiet:
                ret = False
                print("... no file or directory named '{}' exists."
                  .format(source))
   
    if copied:  # something has been copied over so archive
        with tarfile.open(tar_file, "w:gz") as tar:
            tar.add(targz_base_name)
#       print("{} exists? {}".format(tar_file, os.path.isfile(tar_file)))
        REDACTED = '''
        if not quiet:
            print("Moving {} into {}..."
                .format(tar_file, destination_directory))
        move_res = shutil.move(tar_file, destination_directory)
#       if not quiet:
#           print("shutil.move({}, {}) returned {}"
#                   .format(tar_file, destination_directory, move_res))
'''    
    if not quiet:
        print("Removing temporary dirctory tree {}.".format(targz_base_name))
    shutil.rmtree(targz_base_name)
    return ret


def main():
    print(collect_file_names(infile))
    names = collect_file_names(infile)
    parent_dir = os.path.expanduser("~/")
    sources = [os.path.join(parent_dir, name) for name in names]
    archive(sources, './', outfile)



if __name__ == '__main__':
    main()
