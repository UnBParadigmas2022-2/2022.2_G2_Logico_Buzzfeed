#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${SCRIPT_DIR}/..

docker stop g2_buzzfeed_api

docker rm g2_buzzfeed_api

docker image rm buzzfeed_api
