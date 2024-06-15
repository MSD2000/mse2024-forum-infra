#!/bin/bash

IMAGES="msd2000/mse2024-forum-fe:latest"

echo "Removing specified Docker images..."
for IMAGE in $IMAGES; do
  docker rmi $IMAGE || echo "Failed to remove $IMAGE or image not found"
done

echo "Pulling latest images..."
docker-compose pull

echo "Starting services..."
docker-compose up -d
