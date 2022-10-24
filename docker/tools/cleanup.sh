#!/bin/bash

docker kill $(docker ps -q)
docker rm $(docker ps -qa) -f
docker image rm $(docker image ls -q)
docker volume rm $(docker volume ls -q)
docker system prune -af

echo ""
echo "💥 Docker has been reset!"
echo "   All containers have been stopped."
echo "   Images and volumes have been removed."
echo ""