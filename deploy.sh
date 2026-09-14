#!/bin/bash
set -e

DOCKER_IMAGE="sahy1234/collective1:latest"

echo "1. Ensuring db.sqlite3 exists..."
touch db.sqlite3
chmod 666 db.sqlite3

echo "2. Pulling latest Docker image..."
docker pull "$DOCKER_IMAGE"

echo "3. Starting and updating Docker Compose stack..."
docker compose up -d --pull always

echo "4. Running Django database migrations..."
docker compose exec -T web python manage.py migrate --noinput

echo "5. Pruning unused Docker images..."
docker image prune -f

echo "✅ Deployment completed successfully!"