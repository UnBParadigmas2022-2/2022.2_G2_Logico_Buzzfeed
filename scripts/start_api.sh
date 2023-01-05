#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${SCRIPT_DIR}/..

docker build -t buzzfeed_api ./api

docker run --name g2_buzzfeed_api --detach --rm -p "5000:5000" buzzfeed_api
