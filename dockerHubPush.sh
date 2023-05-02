#!/bin/bash

read -p "Enter release version: " VERSION

IMAGE_NAME="unforgivenwow/core:$VERSION"

read -p "Do you want to create and push the image \"$IMAGE_NAME\" ? (y/n): " answer; [[ $answer =~ ^(y|Y) ]] && \
    docker tag core-worldserver:latest $IMAGE_NAME && \
    docker tag core-authserver:latest $IMAGE_NAME && \
    docker push $IMAGE_NAME \
|| exit
