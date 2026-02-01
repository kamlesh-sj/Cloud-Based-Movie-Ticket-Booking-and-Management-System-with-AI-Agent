# PowerShell script to run the Movie Booking System locally

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Movie Ticket Booking System Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
Write-Host "Checking prerequisites..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js is not installed. Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Check if MongoDB is running
Write-Host "Checking MongoDB connection..." -ForegroundColor Yellow
$mongoRunning = $false
try {
    $mongoTest = mongo --eval "db.version()" --quiet 2>$null
    if ($?) {
        $mongoRunning = $true
        Write-Host "✓ MongoDB is running" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠ MongoDB connection test failed" -ForegroundColor Yellow
}

if (-not $mongoRunning) {
    Write-Host "⚠ Warning: MongoDB might not be running. Please ensure MongoDB is installed and running." -ForegroundColor Yellow
    Write-Host "  Download from: https://www.mongodb.com/try/download/community" -ForegroundColor Yellow
    $continue = Read-Host "Continue anyway? (y/n)"
    if ($continue -ne "y") {
        exit 1
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Setting up Backend" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Setup Backend
Set-Location backend

if (-not (Test-Path "node_modules")) {
    Write-Host "Installing backend dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ Failed to install backend dependencies" -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Backend dependencies installed" -ForegroundColor Green
} else {
    Write-Host "✓ Backend dependencies already installed" -ForegroundColor Green
}

# Create .env file if it doesn't exist
if (-not (Test-Path ".env")) {
    Write-Host "Creating backend .env file..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "✓ Backend .env file created" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Seeding Database" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "Seeding database with sample data..." -ForegroundColor Yellow
npm run seed
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Database seeded successfully" -ForegroundColor Green
} else {
    Write-Host "⚠ Database seeding failed. Continuing anyway..." -ForegroundColor Yellow
}

Set-Location ..

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Setting up Frontend" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Setup Frontend
Set-Location frontend

if (-not (Test-Path "node_modules")) {
    Write-Host "Installing frontend dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ Failed to install frontend dependencies" -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Frontend dependencies installed" -ForegroundColor Green
} else {
    Write-Host "✓ Frontend dependencies already installed" -ForegroundColor Green
}

# Create .env file if it doesn't exist
if (-not (Test-Path ".env")) {
    Write-Host "Creating frontend .env file..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "✓ Frontend .env file created" -ForegroundColor Green
}

Set-Location ..

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Starting Application" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Starting backend server..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd backend; npm run dev" -WindowStyle Normal

Start-Sleep -Seconds 3

Write-Host "Starting frontend server..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; npm start" -WindowStyle Normal

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
Write-Host "Press Ctrl+C in each terminal window to stop the servers" -ForegroundColor Yellow
