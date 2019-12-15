#!/usr/bin/env bash

set -Eeuo pipefail #https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

trap "echo ERR trap fired!" ERR

ansible-playbook deploy-db.yml -i inventory/development/ --extra-vars "database_name=companyx" -e "ansible_python_interpreter=`which python3`"
ansible-playbook deploy-api.yml -i inventory/development/ --extra-vars "stage_name=v1 database_name=companyx" -e "ansible_python_interpreter=`which python3`"
