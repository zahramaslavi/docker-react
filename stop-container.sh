#!/bin/bash

# Pass the image name as an argument to the script
IMAGE_NAME=$1

# Get the container ID of the running container based on the image name
CONTAINER_ID=$(docker ps --filter "ancestor=$IMAGE_NAME" --format "{{.ID}}")

# Check if the container ID was found
if [ -z "$CONTAINER_ID" ]; then
    echo "No running container found for image: $IMAGE_NAME"
else
    docker stop $CONTAINER_ID
fi
