#!/bin/sh

#docker build if it's the first time after revising Dockerfile
docker compose up -d --build

#check container
docker image ls
docker container ls

#access to the container through jupyternotebook in a local browser
#docker compose exec python3 bash
docker run -it --rm iris-python3 #-v "$(pwd)":/root/Iris -w /root/Iris
