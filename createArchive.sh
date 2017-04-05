#!/bin/bash

set -e

<<<<<<< HEAD
DIR="target/config"
mkdir -p $DIR

cp src/main/resources/config/application.yml $DIR
cp src/main/resources/config/application-prod.yml $DIR
cp src/main/resources/config/application-dev.yml $DIR

cd target/

zip $(echo $NAME).zip $(echo $WAR_FILE) config/*
tar -czf $(echo $NAME).tar.gz $(echo $WAR_FILE) config/*

=======
cd target/

WAR_FILE="$(ls | egrep .*\.war$)"
NAME="$(echo $WAR_FILE | egrep -oh '(.*)[^\.war]')"

echo "$WAR_FILE"
echo "$NAME"



mkdir config

cp ../src/main/resources/config/application.yml config/
cp ../src/main/resources/config/application-prod.yml config/
cp ../src/main/resources/config/application-dev.yml config/

zip $(echo $NAME).zip $(echo $WAR_FILE) config/*
tar -czf $(echo $NAME).tar.gz $(echo $WAR_FILE) config/*
>>>>>>> 10ff92435b2c06c52dd0ea08b34878a4f0accbf5
