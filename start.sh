docker network create g2_buzzfeed || true

docker build -t buzzfeed_cli .

docker build -t buzzfeed_api ./api

docker run --name g2_buzzfeed_api --network g2_buzzfeed --detach --rm -p "5000:5000" buzzfeed_api

clear

docker run --name g2_buzzfeed_cli --network g2_buzzfeed --rm -it buzzfeed_cli

docker stop g2_buzzfeed_api g2_buzzfeed_cli
