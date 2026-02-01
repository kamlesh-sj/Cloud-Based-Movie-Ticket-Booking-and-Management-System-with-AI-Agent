# Final Year Project Report
## Cloud-Based Movie Ticket Booking and Management System

### Project Information
- **Project Type**: Final Year Project
- **Domain**: Cloud Computing & Web Application Development
- **Technology Stack**: MERN Stack (MongoDB, Express.js, React, Node.js)

---

## Table of Contents
1. [Introduction](#introduction)
2. [Problem Statement](#problem-statement)
3. [Objectives](#objectives)
4. [System Architecture](#system-architecture)
5. [Technologies Used](#technologies-used)
6. [System Design](#system-design)
7. [Implementation](#implementation)
8. [Features](#features)
9. [Testing](#testing)
10. [Deployment](#deployment)
11. [Conclusion](#conclusion)
12. [Future Enhancements](#future-enhancements)

---

## 1. Introduction

The Cloud-Based Movie Ticket Booking and Management System is a comprehensive web application designed to streamline the process of booking movie tickets online. The system provides an intuitive interface for users to browse movies, select showtimes, book seats, and manage their bookings. Additionally, it includes an admin panel for managing movies, theaters, showtimes, and viewing booking analytics.

---

## 2. Problem Statement

Traditional movie ticket booking systems face several challenges:
- Long queues at theater counters
- Limited visibility of available seats and showtimes
- Manual management of bookings and inventory
- Lack of centralized system for multiple theaters
- Poor user experience and convenience

This project aims to solve these problems by providing a modern, cloud-based solution that is accessible from anywhere and provides real-time seat availability.

---

## 3. Objectives

### Primary Objectives
1. Develop a user-friendly web application for movie ticket booking
2. Implement real-time seat selection and availability tracking
3. Create an admin dashboard for theater management
4. Ensure secure authentication and authorization
5. Design a scalable and cloud-ready architecture

### Secondary Objectives
1. Provide search and filter functionality for movies
2. Enable booking history and cancellation features
3. Implement responsive design for mobile devices
4. Create automated deployment scripts
5. Document the system comprehensively

---

## 4. System Architecture

### Architecture Type
**Three-Tier Architecture**

#### Presentation Layer (Frontend)
- React.js single-page application
- Responsive UI with modern design
- Context API for state management

#### Application Layer (Backend)
- Node.js with Express.js framework
- RESTful API architecture
- JWT-based authentication
- Business logic and validation

#### Data Layer (Database)
- MongoDB (NoSQL database)
- Schema design for movies, theaters, showtimes, bookings
- Indexed queries for performance

### Cloud Architecture
- Containerized using Docker
- Microservices-ready design
- Horizontal scalability support
- Cloud platform agnostic (AWS, Azure, GCP compatible)

---

## 5. Technologies Used

### Frontend Technologies
- **React.js** (v18.2.0) - UI library
- **React Router** (v6.15.0) - Navigation
- **Axios** - HTTP client
- **React Toastify** - Notifications
- **CSS3** - Styling

### Backend Technologies
- **Node.js** (v16+) - Runtime environment
- **Express.js** (v4.18.2) - Web framework
- **MongoDB** (v5.0) - Database
- **Mongoose** (v7.5.0) - ODM
- **JWT** - Authentication
- **Bcrypt.js** - Password hashing

### DevOps & Tools
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration
- **Git** - Version control
- **npm** - Package management

---

## 6. System Design

### Database Schema

#### User Schema
```javascript
{
  name: String,
  email: String (unique),
  password: String (hashed),
  phone: String,
  role: Enum ['user', 'admin'],
  isActive: Boolean,
  createdAt: Date
}
```

#### Movie Schema
```javascript
{
  title: String,
  description: String,
  genre: [String],
  language: String,
  duration: Number,
  releaseDate: Date,
  rating: String,
  director: String,
  cast: [String],
  posterUrl: String,
  averageRating: Number,
  isActive: Boolean
}
```

#### Theater Schema
```javascript
{
  name: String,
  location: {
    address: String,
    city: String,
    state: String,
    pincode: String
  },
  screens: [{
    name: String,
    capacity: Number,
    seats: [Seat Schema],
    screenType: String
  }],
  amenities: [String],
  isActive: Boolean
}
```

#### Showtime Schema
```javascript
{
  movie: ObjectId (ref: Movie),
  theater: ObjectId (ref: Theater),
  screen: ObjectId,
  date: Date,
  time: String,
  price: {
    regular: Number,
    premium: Number,
    vip: Number
  },
  availableSeats: Number,
  bookedSeats: [Seat],
  isActive: Boolean
}
```

#### Booking Schema
```javascript
{
  user: ObjectId (ref: User),
  showtime: ObjectId (ref: Showtime),
  movie: ObjectId (ref: Movie),
  theater: ObjectId (ref: Theater),
  seats: [Seat with price],
  totalAmount: Number,
  bookingCode: String (unique),
  bookingStatus: Enum,
  paymentStatus: Enum,
  showDate: Date,
  showTime: String
}
```

### API Endpoints Design

**Base URL**: `/api`

#### Authentication APIs
- POST `/auth/register` - User registration
- POST `/auth/login` - User login
- GET `/auth/profile` - Get user profile

#### Movie APIs
- GET `/movies` - List all movies
- GET `/movies/:id` - Get movie details
- POST `/movies` - Create movie (Admin)
- PUT `/movies/:id` - Update movie (Admin)
- DELETE `/movies/:id` - Delete movie (Admin)

#### Theater APIs
- GET `/theaters` - List all theaters
- GET `/theaters/:id` - Get theater details
- POST `/theaters` - Create theater (Admin)
- PUT `/theaters/:id` - Update theater (Admin)
- DELETE `/theaters/:id` - Delete theater (Admin)

#### Showtime APIs
- GET `/showtimes` - List all showtimes
- GET `/showtimes/movie/:movieId` - Get showtimes by movie
- POST `/showtimes` - Create showtime (Admin)
- PUT `/showtimes/:id` - Update showtime (Admin)
- DELETE `/showtimes/:id` - Delete showtime (Admin)

#### Booking APIs
- GET `/bookings` - Get user bookings
- GET `/bookings/all` - Get all bookings (Admin)
- POST `/bookings` - Create booking
- DELETE `/bookings/:id` - Cancel booking

---

## 7. Implementation

### Frontend Implementation

#### Key Components
1. **Navbar** - Navigation and user menu
2. **MovieCard** - Display movie information
3. **PrivateRoute** - Protected route wrapper
4. **AdminRoute** - Admin-only route wrapper

#### Key Pages
1. **Home** - Browse movies with search/filter
2. **MovieDetails** - View movie info and showtimes
3. **BookTicket** - Interactive seat selection
4. **MyBookings** - User booking history
5. **Admin Dashboard** - Statistics and management
6. **Admin Management Pages** - CRUD operations

#### State Management
- Context API for authentication state
- Local state for component data
- API calls through centralized service layer

### Backend Implementation

#### Middleware
1. **Authentication** - JWT token verification
2. **Authorization** - Role-based access control
3. **Validation** - Express-validator for input validation
4. **Error Handling** - Centralized error handler

#### Controllers
- Separate controllers for each resource
- Business logic separation
- Error handling and validation

#### Security Features
1. Password hashing with bcrypt
2. JWT token authentication
3. Protected routes with middleware
4. Input validation and sanitization
5. CORS configuration

---

## 8. Features

### User Features
✅ User registration and authentication
✅ Browse movies with search and filters
✅ View detailed movie information
✅ View showtimes by date and theater
✅ Interactive seat selection interface
✅ Real-time seat availability
✅ Book multiple seats (max 10)
✅ Different seat types (Regular, Premium, VIP)
✅ View booking history with details
✅ Cancel bookings
✅ Responsive design for mobile devices

### Admin Features
✅ Admin dashboard with statistics
✅ Manage movies (Create, Read, Update, Delete)
✅ Manage theaters and screens
✅ Manage showtimes
✅ View all bookings
✅ Role-based access control

### Technical Features
✅ RESTful API architecture
✅ JWT-based authentication
✅ MongoDB database with Mongoose ODM
✅ Docker containerization
✅ Automated setup scripts
✅ Environment-based configuration
✅ Error handling and validation
✅ Database seeding for demo data

---

## 9. Testing

### Manual Testing Performed
1. **User Registration & Login**
   - Successful registration
   - Duplicate email validation
   - Login with valid/invalid credentials
   - JWT token generation and storage

2. **Movie Browsing**
   - List all movies
   - Search functionality
   - Genre filtering
   - Movie details display

3. **Booking Flow**
   - Showtime selection
   - Seat availability check
   - Seat selection (single and multiple)
   - Booking creation
   - Double booking prevention

4. **Booking Management**
   - View booking history
   - Booking cancellation
   - Seat release on cancellation

5. **Admin Features**
   - Dashboard statistics
   - CRUD operations on movies
   - CRUD operations on theaters
   - CRUD operations on showtimes
   - View all bookings

### Test Cases

#### Authentication Test Cases
| Test Case | Expected Result | Status |
|-----------|----------------|--------|
| Register with valid data | User created successfully | ✅ Pass |
| Register with existing email | Error: User already exists | ✅ Pass |
| Login with valid credentials | JWT token returned | ✅ Pass |
| Login with invalid credentials | Error: Invalid credentials | ✅ Pass |
| Access protected route without token | 401 Unauthorized | ✅ Pass |

#### Booking Test Cases
| Test Case | Expected Result | Status |
|-----------|----------------|--------|
| Book available seats | Booking created | ✅ Pass |
| Book already booked seats | Error: Seats already booked | ✅ Pass |
| Cancel confirmed booking | Booking cancelled, seats released | ✅ Pass |
| Book more than 10 seats | Warning message | ✅ Pass |

---

## 10. Deployment

### Local Deployment
Two automated scripts provided:
1. **run-local.ps1** (Windows PowerShell)
2. **run-local.sh** (Linux/Mac Bash)

Features:
- Automatic dependency installation
- Environment file creation
- Database seeding
- Concurrent server startup

### Docker Deployment
Two Docker scripts provided:
1. **run-docker.ps1** (Windows)
2. **run-docker.sh** (Linux/Mac)

Configuration:
- Multi-container setup (MongoDB, Backend, Frontend)
- Docker Compose orchestration
- Volume persistence for database
- Network isolation

### Cloud Deployment Options

#### AWS Deployment
- **Compute**: EC2 instances or ECS
- **Database**: DocumentDB or MongoDB Atlas
- **Storage**: S3 for assets
- **Load Balancer**: Application Load Balancer

#### Google Cloud Deployment
- **Compute**: Cloud Run or GKE
- **Database**: MongoDB Atlas
- **Storage**: Cloud Storage
- **Load Balancer**: Cloud Load Balancing

#### Azure Deployment
- **Compute**: App Service or AKS
- **Database**: Cosmos DB (MongoDB API)
- **Storage**: Blob Storage
- **Load Balancer**: Azure Load Balancer

---

## 11. Conclusion

The Cloud-Based Movie Ticket Booking and Management System successfully achieves its objectives of providing a modern, user-friendly platform for booking movie tickets online. The system demonstrates:

### Key Achievements
1. **Successful Implementation**: Complete MERN stack application with all planned features
2. **User Experience**: Intuitive interface with real-time seat selection
3. **Scalability**: Cloud-ready architecture with Docker containerization
4. **Security**: Secure authentication and authorization mechanisms
5. **Administration**: Comprehensive admin panel for system management
6. **Automation**: One-click deployment with automated scripts
7. **Documentation**: Complete technical and user documentation

### Learning Outcomes
1. Full-stack web development with MERN stack
2. RESTful API design and implementation
3. Database schema design and optimization
4. Authentication and authorization patterns
5. Cloud deployment and containerization
6. DevOps practices and automation
7. Project management and documentation

### Project Impact
This project demonstrates the practical application of cloud computing and modern web technologies to solve real-world problems. The system can be easily adapted for production use with minimal modifications and deployed to any cloud platform.

---

## 12. Future Enhancements

### Short-term Enhancements
1. **Payment Gateway Integration**
   - Integrate Razorpay/Stripe for real payments
   - Payment receipt generation
   - Refund processing

2. **Email Notifications**
   - Booking confirmation emails
   - Booking reminder emails
   - Cancellation notifications

3. **Advanced Search**
   - Search by cast, director
   - Advanced filters (rating, year)
   - Sort options

4. **User Reviews and Ratings**
   - Allow users to rate movies
   - Write and read reviews
   - Average rating calculation

### Medium-term Enhancements
1. **Mobile Application**
   - React Native mobile app
   - Push notifications
   - QR code tickets

2. **Analytics Dashboard**
   - Revenue analytics
   - Popular movies/theaters
   - Booking trends
   - User demographics

3. **Loyalty Program**
   - Points system
   - Discounts and offers
   - Membership tiers

4. **Social Features**
   - Share bookings on social media
   - Group bookings
   - Friends and recommendations

### Long-term Enhancements
1. **AI/ML Features**
   - Movie recommendations
   - Dynamic pricing
   - Fraud detection
   - Predictive analytics

2. **Multi-language Support**
   - Internationalization (i18n)
   - Multiple language options
   - RTL support

3. **Food & Beverage Ordering**
   - Pre-order food
   - Seat delivery
   - Combo offers

4. **Virtual Reality Preview**
   - VR movie trailers
   - Virtual seat preview
   - Theater walkthrough

---

## Appendices

### Appendix A: Installation Guide
See SETUP.md for detailed installation instructions.

### Appendix B: User Manual
See README.md for user guide and feature descriptions.

### Appendix C: API Documentation
See SETUP.md for complete API documentation.

### Appendix D: Source Code
Complete source code available in the project repository.

---

## References

1. MongoDB Documentation - https://docs.mongodb.com/
2. Express.js Documentation - https://expressjs.com/
3. React Documentation - https://react.dev/
4. Node.js Documentation - https://nodejs.org/
5. Docker Documentation - https://docs.docker.com/
6. JWT Authentication - https://jwt.io/
7. RESTful API Design - https://restfulapi.net/

---

**Project Completed**: January 2026
**Developer**: Final Year Student
**Institution**: [Your Institution Name]
**Course**: [Your Course Name]

---

**END OF REPORT**
