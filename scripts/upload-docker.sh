#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="mydocker49/udacity-capstone-app"


# Step 2:  
# Authenticate & tag

docker login --username "mydocker49" &&\
    docker image tag cloudDevops-capstone $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker image push $dockerpath