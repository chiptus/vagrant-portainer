#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SWARM=$1

MANAGER_IP=192.168.56.10$SWARM
WORKER_IP=192.168.56.11$SWARM

echo "Starting manager..."
docker -H tcp://"$MANAGER_IP":2375 swarm init --advertise-addr "$MANAGER_IP"

echo "Retrieve manager token..."
TOKEN=$(docker -H tcp://"$MANAGER_IP":2375 swarm join-token -q worker)

echo "Starting node..."
docker -H tcp://"$WORKER_IP":2375 swarm join --token "${TOKEN}" "$MANAGER_IP":2377

docker -H tcp://"$MANAGER_IP":2375 info
