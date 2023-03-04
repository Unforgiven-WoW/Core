#!/bin/bash

# docker build --no-cache -t core_image ./docker/core
# docker build --no-cache -t core_nginx ./docker/nginx

docker build -t core-base .
