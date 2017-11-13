#!/bin/bash

set -e

cp target/$(echo $NAME).tar.gz .docker/
cd .docker/

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

# build securityRAT docker image and pushes it to the appropriate repository
docker build -t $SECRATDOCKERREPO:$TAG_NAME .
docker tag $SECRATDOCKERREPO:$TAG_NAME $SECRATDOCKERREPO:latest
docker push $SECRATDOCKERREPO
