#!/usr/bin/env bash

set -Eeuo pipefail #https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

trap "echo ERR trap fired!" ERR

ansible-playbook deploy-api.yml -i inventory/development/ -e "ansible_python_interpreter=`which python3`"
ansible-playbook deploy-db.yml -i inventory/development/ -e "ansible_python_interpreter=`which python3`"
