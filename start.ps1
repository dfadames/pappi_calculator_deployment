# PAPPI Calculator - Startup Script for Windows
# This script starts all services using Docker Compose

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  PAPPI Calculator Deployment" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Docker is running
Write-Host "Checking Docker..." -ForegroundColor Yellow
try {
    docker ps | Out-Null
    Write-Host "✓ Docker is running" -ForegroundColor Green
} catch {
    Write-Host "✗ Docker is not running. Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

# Pull latest changes from submodules
Write-Host ""
Write-Host "Updating submodules..." -ForegroundColor Yellow
git submodule update --init --recursive --remote

# Ensure frontend is on the correct branch
Write-Host ""
Write-Host "Checking frontend branch..." -ForegroundColor Yellow
Push-Location -Path "front-examen-arqsoft"
git checkout feature/new-branch
git pull origin feature/new-branch
Pop-Location

Write-Host "✓ Submodules updated" -ForegroundColor Green

# Stop any running containers
Write-Host ""
Write-Host "Stopping any running containers..." -ForegroundColor Yellow
docker-compose down

# Build and start all services
Write-Host ""
Write-Host "Building and starting all services..." -ForegroundColor Yellow
docker-compose up --build -d

# Wait for services to be ready
Write-Host ""
Write-Host "Waiting for services to be ready..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check service status
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Service Status" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

docker-compose ps

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Services are running!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Frontend:            http://localhost:3000" -ForegroundColor White
Write-Host "Auth Backend:        http://localhost:8001" -ForegroundColor White
Write-Host "Calculator Backend:  http://localhost:8002" -ForegroundColor White
Write-Host "Auth API Docs:       http://localhost:8001/docs" -ForegroundColor White
Write-Host "Calculator API Docs: http://localhost:8002/docs" -ForegroundColor White
Write-Host ""
Write-Host "To view logs: docker-compose logs -f" -ForegroundColor Yellow
Write-Host "To stop all services: docker-compose down" -ForegroundColor Yellow
Write-Host ""
