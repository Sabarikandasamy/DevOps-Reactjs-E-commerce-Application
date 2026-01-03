#!/bin/bash

IMAGE_NAME="devops-react"
TAG="latest"

echo "🔹 Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

if [ $? -ne 0 ]; then
  echo "❌ Docker build failed"
  exit 1
fi

echo "✅ Docker image built successfully"

