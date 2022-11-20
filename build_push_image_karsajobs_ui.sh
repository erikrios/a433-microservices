#!/bin/bash

# Create a Docker image from Dockerfile
docker build -t karsajobs-ui:latest .

# Listing the local images
docker images

# Change the image name
docker tag karsajobs-ui:latest ghcr.io/erikrios/karsajobs-ui:latest

# Asking for Github username
read -p 'Github username: ' username

# Asking for  Github pesonal access token
read -p 'Please input your Github personal access token: ' token

echo "Authenticating Github credentials..."

# Login into Github container registry
echo $token | docker login ghcr.io -u $username --password-stdin

# Push the image into Github container registry
docker push ghcr.io/erikrios/karsajobs-ui:latest
