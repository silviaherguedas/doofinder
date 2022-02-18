#!/bin/bash
# Script to create the dependencies, compile them and execute the commands to create the database, migrations and seeds.

docker-compose build
cd src/
docker-compose run --rm phoenix mix setup
cd ..
docker-compose up