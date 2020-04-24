#!/usr/bin/env bash

set -Eeuo pipefail #https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

trap "echo ERR trap fired!" ERR

docker-compose build
docker-compose run --rm deploy ansible-playbook deploy-api.yml -i inventory/development/ --e "stage_name=v1 database_name=apigwx state=absent"
docker-compose run --rm deploy ansible-playbook deploy-db.yml -i inventory/development/ --e "database_name=apigwx state=absent"
docker-compose down