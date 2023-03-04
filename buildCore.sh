#!/bin/bash

BUILD_SERVICE=false
read -p "Which you want to build? (1: AuthServer, 2: WorldServer, 3: Both): " OPTION
case $OPTION in
    1)
        BUILD_SERVICE="authserver";
        ;;
    2)
        BUILD_SERVICE="worldserver";
        ;;
    3)
        BUILD_SERVICE="all";
        ;;
esac

read -p "Do you want to build with --no-cache? (Y/N) " OPTION

NO_CACHE=false

if ([ "$OPTION" == "Y" ] || [ "$OPTION" == "y" ]); then NO_CACHE=true; fi

docker build --no-cache=${NO_CACHE}  --build-arg BUILD_SERVICE=${BUILD_SERVICE} -t core-base .
