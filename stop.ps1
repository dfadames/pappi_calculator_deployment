# PAPPI Calculator - Stop Script for Windows
# This script stops all running services

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Stopping PAPPI Calculator Services" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Stop all containers
Write-Host "Stopping all containers..." -ForegroundColor Yellow
docker-compose down

Write-Host ""
Write-Host "✓ All services stopped" -ForegroundColor Green
Write-Host ""
