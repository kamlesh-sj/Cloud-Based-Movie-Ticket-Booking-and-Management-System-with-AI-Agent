# Cloud-Based Movie Ticket Booking and Management System

## 🎬 Project Overview
A comprehensive cloud-based movie ticket booking and management system built with modern web technologies. This system allows users to browse movies, book tickets, and manage their bookings, while providing administrators with tools to manage movies, theaters, and bookings.

## 🚀 Features

### User Features
- User registration and authentication
- Browse movies and showtimes
- Search and filter movies
- Book tickets with seat selection
- Payment integration (mock)
- View booking history
- Cancel bookings

### Admin Features
- Admin dashboard
- Manage movies (CRUD operations)
- Manage theaters and screens
- Manage showtimes
- View all bookings
- Generate reports
- User management

## 🛠️ Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database
- **JWT** - Authentication
- **Bcrypt** - Password hashing

### Frontend
- **React** - UI library
- **React Router** - Navigation
- **Axios** - HTTP client
- **Tailwind CSS** - Styling
- **Context API** - State management

### DevOps
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration

## 📋 Prerequisites
- Node.js (v16 or higher)
- MongoDB (v5 or higher)
- npm or yarn

## ⚡ Quick Start (Automated Setup)

### Option 1: Run with Docker (Recommended)
```bash
# Windows
.\run-docker.ps1

# Linux/Mac
./run-docker.sh
```

### Option 2: Run Locally
```bash
# Windows
.\run-local.ps1

# Linux/Mac
./run-local.sh
```

The application will be available at:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000

## 📁 Project Structure
```
movie-ticket-booking/
├── backend/                 # Express.js backend
│   ├── config/             # Configuration files
│   ├── controllers/        # Request handlers
│   ├── models/             # Database models
│   ├── routes/             # API routes
│   ├── middleware/         # Custom middleware
│   ├── utils/              # Utility functions
│   └── server.js           # Entry point
├── frontend/               # React frontend
│   ├── public/             # Static files
│   └── src/
│       ├── components/     # React components
│       ├── context/        # Context providers
│       ├── pages/          # Page components
│       ├── services/       # API services
│       └── App.js          # Main component
├── docker-compose.yml      # Docker orchestration
└── README.md              # Documentation
```

## 🔐 Default Credentials

### Admin Account
- Email: admin@moviebooking.com
- Password: Admin@123

### Test User Account
- Email: user@test.com
- Password: User@123

## 🌐 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `GET /api/auth/profile` - Get user profile

### Movies
- `GET /api/movies` - Get all movies
- `GET /api/movies/:id` - Get movie by ID
- `POST /api/movies` - Create movie (Admin)
- `PUT /api/movies/:id` - Update movie (Admin)
- `DELETE /api/movies/:id` - Delete movie (Admin)

### Theaters
- `GET /api/theaters` - Get all theaters
- `GET /api/theaters/:id` - Get theater by ID
- `POST /api/theaters` - Create theater (Admin)

### Showtimes
- `GET /api/showtimes` - Get all showtimes
- `GET /api/showtimes/movie/:movieId` - Get showtimes by movie
- `POST /api/showtimes` - Create showtime (Admin)

### Bookings
- `GET /api/bookings` - Get user bookings
- `POST /api/bookings` - Create booking
- `DELETE /api/bookings/:id` - Cancel booking

## 🧪 Testing
```bash
# Backend tests
cd backend
npm test

# Frontend tests
cd frontend
npm test
```

## 📦 Manual Installation

### Backend Setup
```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your configuration
npm run dev
```

### Frontend Setup
```bash
cd frontend
npm install
npm start
```

## 🐳 Docker Deployment
```bash
docker-compose up -d
```

## 🌟 Cloud Deployment Options
- **AWS**: EC2, ECS, or Elastic Beanstalk
- **Google Cloud**: Cloud Run or GKE
- **Azure**: App Service or AKS
- **Heroku**: Easy deployment with buildpacks

## 📝 Environment Variables

### Backend (.env)
```
NODE_ENV=development
PORT=5000
MONGODB_URI=mongodb://localhost:27017/moviebooking
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRE=7d
```

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:5000/api
```

## 🤝 Contributing
This is a final year project. For educational purposes only.

## 📄 License
MIT License

## 👨‍💻 Author
Final Year Project - Cloud-Based Movie Ticket Booking System

## 📞 Support
For any queries, please raise an issue in the repository.

---
**Note**: This is an educational project designed for learning cloud-based application development.
