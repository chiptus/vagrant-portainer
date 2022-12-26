#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SWARM=$1

MANAGER_IP=192.168.56.10$SWARM
WORKER_IP=192.168.56.11$SWARM

echo "Destroying Swarm cluster..."
docker -H "$MANAGER_IP":2375 swarm leave --force
docker -H "$WORKER_IP":2375 swarm leave --force
