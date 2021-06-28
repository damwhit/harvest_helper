#!/bin/bash
if [ "$1" == "" ]; then
  docker rm cypress-headless
  docker run -it \
    --name cypress-headless \
    -v $PWD/e2e:/e2e \
    -w /e2e \
    -e CYPRESS_baseUrl=http://host.docker.internal:3000 \
    cypress/included:7.6.0 --browser firefox
elif [ "$1" == "-i" ]; then
  docker rm cypress-interactive
  IP=$(ipconfig getifaddr en0)
  /usr/X11/bin/xhost + $IP
  docker run -it \
    --name cypress-interactive \
    -v $PWD/e2e:/e2e \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -w /e2e \
    -e DISPLAY=$IP:0 \
    -e CYPRESS_baseUrl=http://host.docker.internal:3000 \
    --entrypoint cypress \
    cypress/included:7.6.0 open --project . --browser chrome
else
  echo "Cannot run cypress with those arguments"
fi