#!/bin/bash

# as we can see this works perfectly, but docker compose seems to think it
# needs to try and pull the images it's building.
docker build -t prj-build -f Dockerfile-build-base .
docker build -t prj-base -f Dockerfile-base .
docker build backend
docker build frontend

# remove images so that docker compose still doesn't work
docker rmi prj-build prj-base