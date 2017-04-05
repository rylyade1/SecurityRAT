#!/bin/bash

set -e

REPO="rylyade1/testsecrat"

ls target/
echo $NAME
cp target/$(echo $NAME).tar.gz .docker/
cd .docker/

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker build -t $REPO:$TAG_NAME .
docker tag $REPO:$TAG_NAME $REPO:latest
docker push $REPO