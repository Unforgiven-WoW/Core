#!/bin/bash

read -p "Are you sure you want to kill docker and com.docker.vmnetd? [y/n]" -n 1 -r

echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
  $(killall Docker)

  pid=$(ps aux | grep com.docker.vmnetd | grep -v grep | awk '{print $2}')
  echo "Killing $pid"

  $(sudo kill -9 $pid)
  $(open /Applications/Docker.app)
fi
