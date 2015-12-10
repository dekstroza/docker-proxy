#!/bin/bash

if [ -z "$CACHE_DIR" ]; then
   SQUID_CACHE="$HOME/Documents/Docker/VOLUMES/SQUID/"
else
   SQUID_CACHE=$CACHE_DIR
fi

docker run -it -d --privileged --net=host -e="insecure=true" -v $SQUID_CACHE:/var/cache/squid/ docker-proxy

