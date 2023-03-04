#!/bin/bash

# Create Volumes
docker volume create mysql-data

# Build MySQL Image
docker build -t mysql-database -f Dockerfile.mysql .

# Create MySQL Container
docker run -itd --name=mysql-container -p 3306:3306 -v mysql-data:/var/lib/mysql mysql-database
