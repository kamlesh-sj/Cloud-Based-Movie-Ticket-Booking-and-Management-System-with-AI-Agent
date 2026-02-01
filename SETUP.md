# Setup Guide - Movie Ticket Booking System

## Prerequisites

Before running the application, ensure you have the following installed:

### Required Software
1. **Node.js** (v16 or higher)
   - Download from: https://nodejs.org/
   - Verify installation: `node --version`

2. **MongoDB** (v5 or higher)
   - Download from: https://www.mongodb.com/try/download/community
   - Verify installation: `mongod --version`
   - Ensure MongoDB service is running

3. **Git** (for cloning the repository)
   - Download from: https://git-scm.com/

### Optional (for Docker deployment)
- **Docker** and **Docker Compose**
  - Download from: https://www.docker.com/

## Installation Methods

### Method 1: Automated Local Setup (Recommended)

#### Windows (PowerShell)
```powershell
.\run-local.ps1
```

#### Linux/Mac (Bash)
```bash
chmod +x run-local.sh
./run-local.sh
```

This script will:
- Check prerequisites
- Install all dependencies
- Create environment files
- Seed the database with sample data
- Start both backend and frontend servers

### Method 2: Docker Deployment

#### Windows (PowerShell)
```powershell
.\run-docker.ps1
```

#### Linux/Mac (Bash)
```bash
chmod +x run-docker.sh
./run-docker.sh
```

This will build and start all services in Docker containers.

### Method 3: Manual Setup

#### Step 1: Install Backend Dependencies
```bash
cd backend
npm install
cp .env.example .env
```

Edit `backend/.env` if needed to configure MongoDB connection.

#### Step 2: Seed Database
```bash
npm run seed
```

#### Step 3: Start Backend Server
```bash
npm run dev
```
Backend will run on http://localhost:5000

#### Step 4: Install Frontend Dependencies (New Terminal)
```bash
cd frontend
npm install
cp .env.example .env
```

#### Step 5: Start Frontend Server
```bash
npm start
```
Frontend will run on http://localhost:3000

## Access the Application

Once running, access the application at:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000

## Default Login Credentials

### Admin Account
- **Email**: admin@moviebooking.com
- **Password**: Admin@123

### Test User Account
- **Email**: user@test.com
- **Password**: User@123

## Troubleshooting

### MongoDB Connection Error
- Ensure MongoDB is installed and running
- Check if MongoDB service is active: `systemctl status mongod` (Linux) or check Services (Windows)
- Verify connection string in `backend/.env`

### Port Already in Use
- Backend (5000): Change PORT in `backend/.env`
- Frontend (3000): Change port when prompted or update package.json

### Dependencies Installation Failed
- Clear npm cache: `npm cache clean --force`
- Delete `node_modules` folder and `package-lock.json`
- Run `npm install` again

### Docker Issues
- Ensure Docker daemon is running
- Run `docker-compose down` to stop existing containers
- Run `docker-compose up --build` to rebuild

## Project Structure

```
movie-ticket-booking/
├── backend/              # Express.js backend
│   ├── config/          # Configuration files
│   ├── controllers/     # Request handlers
│   ├── models/          # Database models
│   ├── routes/          # API routes
│   ├── middleware/      # Custom middleware
│   ├── utils/           # Utility functions
│   └── server.js        # Entry point
├── frontend/            # React frontend
│   ├── public/          # Static files
│   └── src/
│       ├── components/  # React components
│       ├── context/     # Context providers
│       ├── pages/       # Page components
│       └── services/    # API services
├── docker-compose.yml   # Docker configuration
├── run-local.ps1        # Windows setup script
├── run-local.sh         # Linux/Mac setup script
├── run-docker.ps1       # Windows Docker script
└── run-docker.sh        # Linux/Mac Docker script
```

## Features Overview

### User Features
- Browse movies and showtimes
- Search and filter movies
- Select seats and book tickets
- View booking history
- Cancel bookings

### Admin Features
- Manage movies (Add/Edit/Delete)
- Manage theaters
- Manage showtimes
- View all bookings
- Dashboard with statistics

## API Documentation

### Base URL
```
http://localhost:5000/api
```

### Authentication Endpoints
- `POST /auth/register` - Register new user
- `POST /auth/login` - User login
- `GET /auth/profile` - Get user profile (Protected)

### Movie Endpoints
- `GET /movies` - Get all movies
- `GET /movies/:id` - Get movie details
- `POST /movies` - Create movie (Admin only)
- `PUT /movies/:id` - Update movie (Admin only)
- `DELETE /movies/:id` - Delete movie (Admin only)

### Theater Endpoints
- `GET /theaters` - Get all theaters
- `GET /theaters/:id` - Get theater details
- `POST /theaters` - Create theater (Admin only)

### Showtime Endpoints
- `GET /showtimes` - Get all showtimes
- `GET /showtimes/movie/:movieId` - Get showtimes by movie
- `POST /showtimes` - Create showtime (Admin only)

### Booking Endpoints
- `GET /bookings` - Get user bookings (Protected)
- `POST /bookings` - Create booking (Protected)
- `DELETE /bookings/:id` - Cancel booking (Protected)
- `GET /bookings/all` - Get all bookings (Admin only)

## Development Commands

### Backend
```bash
npm run dev      # Start development server with nodemon
npm start        # Start production server
npm run seed     # Seed database with sample data
```

### Frontend
```bash
npm start        # Start development server
npm run build    # Build for production
npm test         # Run tests
```

### Docker
```bash
docker-compose up        # Start all services
docker-compose up -d     # Start in detached mode
docker-compose down      # Stop all services
docker-compose logs -f   # View logs
```

## Cloud Deployment

### Deploy to Heroku
1. Create Heroku account
2. Install Heroku CLI
3. Deploy backend and frontend separately

### Deploy to AWS
- Use AWS EC2 for servers
- Use AWS DocumentDB for MongoDB
- Configure security groups and load balancer

### Deploy to Google Cloud
- Use Google Cloud Run or App Engine
- Use Cloud MongoDB or MongoDB Atlas
- Configure Cloud Build for CI/CD

### Deploy to Azure
- Use Azure App Service
- Use Azure Cosmos DB (MongoDB API)
- Configure Azure DevOps for CI/CD

## Support

For issues and questions:
1. Check the troubleshooting section above
2. Review the README.md file
3. Check MongoDB and Node.js logs

## License

MIT License - Free for educational and personal use.
