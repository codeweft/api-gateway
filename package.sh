#!/usr/bin/env bash

set -Eeuo pipefail #https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

aws cloudformation package --template-file ./cloudformation/db.yml --s3-bucket coding-challenge-builds --s3-prefix lambda --output-template-file ./cloudformation/db-lambda.yml