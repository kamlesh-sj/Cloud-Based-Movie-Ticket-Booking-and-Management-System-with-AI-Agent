#!/bin/bash

# Bash script to run the Movie Booking System with Docker

echo "========================================"
echo "  Movie Ticket Booking System - Docker"
echo "========================================"
echo ""

# Check if Docker is installed
echo "Checking prerequisites..."
if ! command -v docker &> /dev/null; then
    echo "✗ Docker is not installed. Please install Docker from https://www.docker.com/"
    exit 1
fi

DOCKER_VERSION=$(docker --version)
echo "✓ Docker version: $DOCKER_VERSION"

# Check if Docker Compose is available
if ! command -v docker-compose &> /dev/null; then
    echo "✗ Docker Compose is not installed"
    exit 1
fi

COMPOSE_VERSION=$(docker-compose --version)
echo "✓ Docker Compose version: $COMPOSE_VERSION"

echo ""
echo "Building and starting containers..."
echo ""

docker-compose up --build -d

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "  Application Started Successfully!"
    echo "========================================"
    echo ""
    echo "Frontend: http://localhost:3000"
    echo "Backend:  http://localhost:5000"
    echo ""
    echo "Login Credentials:"
    echo "  Admin: admin@moviebooking.com / Admin@123"
    echo "  User:  user@test.com / User@123"
    echo ""
    echo "To stop the application, run: docker-compose down"
    echo "To view logs, run: docker-compose logs -f"
    echo ""
    
    # Seed the database
    echo "Waiting for services to be ready..."
    sleep 10
    
    echo "Seeding database..."
    docker-compose exec -T backend npm run seed
    
    echo ""
    echo "✓ Setup complete! Visit http://localhost:3000 to use the application"
else
    echo "✗ Failed to start containers"
    exit 1
fi
