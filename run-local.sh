#!/bin/bash

# Bash script to run the Movie Booking System locally

echo "========================================"
echo "  Movie Ticket Booking System Setup"
echo "========================================"
echo ""

# Check if Node.js is installed
echo "Checking prerequisites..."
if ! command -v node &> /dev/null; then
    echo "✗ Node.js is not installed. Please install Node.js from https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node --version)
echo "✓ Node.js version: $NODE_VERSION"

# Check if MongoDB is running
echo "Checking MongoDB connection..."
if command -v mongosh &> /dev/null; then
    if mongosh --eval "db.version()" --quiet &> /dev/null; then
        echo "✓ MongoDB is running"
    else
        echo "⚠ Warning: MongoDB might not be running. Please ensure MongoDB is installed and running."
        echo "  Download from: https://www.mongodb.com/try/download/community"
        read -p "Continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
else
    echo "⚠ MongoDB CLI not found. Assuming MongoDB is running..."
fi

echo ""
echo "========================================"
echo "  Setting up Backend"
echo "========================================"

# Setup Backend
cd backend

if [ ! -d "node_modules" ]; then
    echo "Installing backend dependencies..."
    npm install
    if [ $? -ne 0 ]; then
        echo "✗ Failed to install backend dependencies"
        exit 1
    fi
    echo "✓ Backend dependencies installed"
else
    echo "✓ Backend dependencies already installed"
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "Creating backend .env file..."
    cp .env.example .env
    echo "✓ Backend .env file created"
fi

echo ""
echo "========================================"
echo "  Seeding Database"
echo "========================================"

echo "Seeding database with sample data..."
npm run seed
if [ $? -eq 0 ]; then
    echo "✓ Database seeded successfully"
else
    echo "⚠ Database seeding failed. Continuing anyway..."
fi

cd ..

echo ""
echo "========================================"
echo "  Setting up Frontend"
echo "========================================"

# Setup Frontend
cd frontend

if [ ! -d "node_modules" ]; then
    echo "Installing frontend dependencies..."
    npm install
    if [ $? -ne 0 ]; then
        echo "✗ Failed to install frontend dependencies"
        exit 1
    fi
    echo "✓ Frontend dependencies installed"
else
    echo "✓ Frontend dependencies already installed"
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "Creating frontend .env file..."
    cp .env.example .env
    echo "✓ Frontend .env file created"
fi

cd ..

echo ""
echo "========================================"
echo "  Starting Application"
echo "========================================"
echo ""

# Start backend in background
echo "Starting backend server..."
cd backend
npm run dev &
BACKEND_PID=$!
cd ..

# Wait a bit for backend to start
sleep 3

# Start frontend
echo "Starting frontend server..."
cd frontend
npm start &
FRONTEND_PID=$!
cd ..

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
echo "Press Ctrl+C to stop all servers"

# Wait for Ctrl+C
trap "kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait
