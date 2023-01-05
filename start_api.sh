docker build -t buzzfeed_api ./api

docker run --name g2_buzzfeed_api --detach --rm -p "5000:5000" buzzfeed_api
