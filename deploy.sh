#!/bin/bash

echo "🔹 Deploying application using docker-compose..."

docker-compose down
docker-compose up -d

if [ $? -ne 0 ]; then
  echo "❌ Deployment failed"
  exit 1
fi

echo "✅ Application deployed successfully"

