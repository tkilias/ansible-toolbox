#! /bin/bash
#
# Author:   Bert Van Vreckem <bert.vanvreckem@gmail.com>
#
# Initialise an Ansible project, based on
# https://github.com/bertvv/ansible-skeleton/

set -u # abort on unbound variable

#{{{ Variables

#}}}
#{{{ Functions

usage() {
cat << _EOF_
Usage: ${0} PROJECT_NAME
  Initialises a Vagrant+Ansible project based on
  https://github.com/tkilias/ansible-skeleton
  and optionally
_EOF_
}

#}}}
#{{{ Command line parsing

if [ "$#" -lt "1" ]; then
    echo "Expected at least 1 argument, got $#" >&2
    usage
    exit 2
fi

if [ "$1" = "-h" -o "$1" = "--help" ]; then
  usage
  exit 0
fi

project="$1"

if [ -d "${project}" ]; then
  echo "Project directory ${project} already exists. Bailing out." >&2
  exit 1
fi

shift

#}}}
# Script proper

wget https://github.com/tkilias/ansible-skeleton/archive/master.zip
unzip master.zip
rm master.zip

mv ansible-skeleton-master "${project}"
cd "${project}"
mkdir ansible/host_vars/
