#!/bin/bash
# Script to create the dependencies, compile them and execute the commands to create the database, migrations and seeds.

docker-compose build
alias mix="docker-compose run --rm phoenix mix"
docker-compose run --rm phoenix mix setup
docker-compose up
