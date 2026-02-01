# PowerShell script to run the Movie Booking System with Docker

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Movie Ticket Booking System - Docker" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Docker is installed
Write-Host "Checking prerequisites..." -ForegroundColor Yellow
try {
    $dockerVersion = docker --version
    Write-Host "✓ Docker version: $dockerVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Docker is not installed. Please install Docker from https://www.docker.com/" -ForegroundColor Red
    exit 1
}

# Check if Docker Compose is available
try {
    $composeVersion = docker-compose --version
    Write-Host "✓ Docker Compose version: $composeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Docker Compose is not installed" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Building and starting containers..." -ForegroundColor Yellow
Write-Host ""

docker-compose up --build -d

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  Application Started Successfully!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Frontend: http://localhost:3000" -ForegroundColor Cyan
    Write-Host "Backend:  http://localhost:5000" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Login Credentials:" -ForegroundColor Yellow
    Write-Host "  Admin: admin@moviebooking.com / Admin@123" -ForegroundColor White
    Write-Host "  User:  user@test.com / User@123" -ForegroundColor White
    Write-Host ""
    Write-Host "To stop the application, run: docker-compose down" -ForegroundColor Yellow
    Write-Host "To view logs, run: docker-compose logs -f" -ForegroundColor Yellow
    Write-Host ""
    
    # Seed the database
    Write-Host "Waiting for services to be ready..." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
    
    Write-Host "Seeding database..." -ForegroundColor Yellow
    docker-compose exec backend npm run seed
    
    Write-Host ""
    Write-Host "✓ Setup complete! Visit http://localhost:3000 to use the application" -ForegroundColor Green
} else {
    Write-Host "Failed to start containers" -ForegroundColor Red
    exit 1
}
