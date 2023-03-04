#!/bin/bash

read -p "Do you want to build with --no-cache? (Y/N) " choice

NO_CACHE=false

if ([ "$choice" == "Y" ] || [ "$choice" == "y" ]); then NO_CACHE=true; fi

docker build --no-cache=${NO_CACHE} -t core-base .
