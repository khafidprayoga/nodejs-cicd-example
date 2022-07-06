# Develop your app

Create docker virtual network and persistent volume
```bash
docker volume create mongodb
docker volume create mongodb_config
docker network create mongodb
```

Running app as container with mongodb
```bash
docker run \
  -it --rm -d \
  --network mongodb \
  --name rest-server \
  -p 8000:8000 \
  -e CONNECTIONSTRING=mongodb://mongodb:27017/notes \
  node-docker
```