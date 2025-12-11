#!/bin/bash

# PAPPI Calculator - Stop Script for Linux/Mac
# This script stops all running services

echo "========================================"
echo "  Stopping PAPPI Calculator Services"
echo "========================================"
echo ""

# Stop all containers
echo "Stopping all containers..."
docker-compose down

echo ""
echo "✓ All services stopped"
echo ""
