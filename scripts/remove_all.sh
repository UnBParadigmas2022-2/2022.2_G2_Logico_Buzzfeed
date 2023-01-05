
#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${SCRIPT_DIR}/..

docker stop g2_buzzfeed_api g2_buzzfeed_cli

docker rm g2_buzzfeed_api g2_buzzfeed_cli

docker network rm g2_buzzfeed

docker image rm buzzfeed_cli

docker image rm buzzfeed_api
