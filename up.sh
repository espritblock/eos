#!/usr/bin/env bash
set -o errexit
set -o xtrace

# set hosts 
echo "127.0.0.1 nodeosd" >> /etc/hosts

# Reset the volumes
docker-compose down

# Update docker
#docker-compose pull

# Start the server for testing
docker-compose up -d --build
docker-compose logs -f | egrep -v 'Produced block 0' &