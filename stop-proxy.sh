#!/bin/bash

CONTAINER_ID=`docker ps -a | grep docker-proxy | grep "Up"  | awk '{print $1}'`
echo "Hit CTRL+C to exit...i"
docker attach $CONTAINER_ID
exit

