#!/bin/bash

#stop ALL containers
docker stop $(docker ps -aq)

#clear ALL containers
docker rm -f $(docker ps -aq)

#clear ALL images
docker rmi $(docker images -qa)

#clear ALL volumes
docker volume prune -f
