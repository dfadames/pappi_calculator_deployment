#!/bin/bash

# PAPPI Calculator - Startup Script for Linux/Mac
# This script starts all services using Docker Compose

echo "========================================"
echo "  PAPPI Calculator Deployment"
echo "========================================"
echo ""

# Check if Docker is running
echo "Checking Docker..."
if ! docker ps > /dev/null 2>&1; then
    echo "✗ Docker is not running. Please start Docker."
    exit 1
fi
echo "✓ Docker is running"

# Pull latest changes from submodules
echo ""
echo "Updating submodules..."
git submodule update --init --recursive --remote

# Ensure frontend is on the correct branch
echo ""
echo "Checking frontend branch..."
cd front-examen-arqsoft
git checkout feature/new-branch
git pull origin feature/new-branch
cd ..

echo "✓ Submodules updated"

# Stop any running containers
echo ""
echo "Stopping any running containers..."
docker-compose down

# Build and start all services
echo ""
echo "Building and starting all services..."
docker-compose up --build -d

# Wait for services to be ready
echo ""
echo "Waiting for services to be ready..."
sleep 10

# Check service status
echo ""
echo "========================================"
echo "  Service Status"
echo "========================================"
docker-compose ps

echo ""
echo "========================================"
echo "  Services are running!"
echo "========================================"
echo ""
echo "Frontend:            http://localhost:3000"
echo "Auth Backend:        http://localhost:8001"
echo "Calculator Backend:  http://localhost:8002"
echo "Auth API Docs:       http://localhost:8001/docs"
echo "Calculator API Docs: http://localhost:8002/docs"
echo ""
echo "To view logs: docker-compose logs -f"
echo "To stop all services: docker-compose down"
echo ""
