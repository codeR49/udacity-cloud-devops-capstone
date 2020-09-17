#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="mydocker49/udacity-capstone-app"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-capstone-app --image=$dockerpath --port=80


# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
kubectl expose deployment udacity-capstone-app --type=LoadBalancer --port=80

# Open the service 
# minikube service udacity-capstone-app