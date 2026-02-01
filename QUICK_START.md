# Quick Start Guide 🚀

## Run the Project in 2 Minutes!

### Option 1: Automated Local Setup (Recommended)

#### For Windows:
```powershell
.\run-local.ps1
```

#### For Linux/Mac:
```bash
chmod +x run-local.sh
./run-local.sh
```

### Option 2: Docker Setup

#### For Windows:
```powershell
.\run-docker.ps1
```

#### For Linux/Mac:
```bash
chmod +x run-docker.sh
./run-docker.sh
```

---

## Access the Application

Once the servers are running:

- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:5000

---

## Login Credentials

### Admin Account
```
Email: admin@moviebooking.com
Password: Admin@123
```

### Test User Account
```
Email: user@test.com
Password: User@123
```

---

## What You Can Do

### As a User:
1. ✅ Browse movies
2. ✅ Search and filter movies by genre
3. ✅ View movie details and showtimes
4. ✅ Select seats interactively
5. ✅ Book tickets
6. ✅ View booking history
7. ✅ Cancel bookings

### As an Admin:
1. ✅ View dashboard with statistics
2. ✅ Manage movies (Add/Edit/Delete)
3. ✅ Manage theaters
4. ✅ Manage showtimes
5. ✅ View all bookings

---

## Prerequisites

### Required:
- **Node.js** (v16+) - [Download](https://nodejs.org/)
- **MongoDB** (v5+) - [Download](https://www.mongodb.com/try/download/community)

### Optional (for Docker):
- **Docker** - [Download](https://www.docker.com/)

---

## Troubleshooting

### MongoDB Not Running?
**Windows:**
```powershell
net start MongoDB
```

**Linux/Mac:**
```bash
sudo systemctl start mongod
```

### Port Already in Use?
- Backend uses port **5000**
- Frontend uses port **3000**

Change ports in:
- `backend/.env` (PORT=5000)
- Frontend will prompt to use different port

### Can't Install Dependencies?
```bash
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

---

## Manual Setup (If Scripts Don't Work)

### Backend:
```bash
cd backend
npm install
npm run seed
npm run dev
```

### Frontend (New Terminal):
```bash
cd frontend
npm install
npm start
```

---

## Features Included

✅ **User Authentication** - Register/Login with JWT
✅ **Movie Browsing** - Search, filter, and view details
✅ **Seat Selection** - Interactive seat booking interface
✅ **Booking Management** - View and cancel bookings
✅ **Admin Panel** - Complete management dashboard
✅ **Responsive Design** - Works on mobile and desktop
✅ **Real-time Updates** - Live seat availability
✅ **Docker Support** - Easy deployment
✅ **Sample Data** - Pre-loaded movies and theaters

---

## Tech Stack

- **Frontend**: React, React Router, Axios
- **Backend**: Node.js, Express.js
- **Database**: MongoDB, Mongoose
- **Authentication**: JWT, Bcrypt
- **Deployment**: Docker, Docker Compose

---

## File Structure

```
movie-ticket-booking/
├── backend/              # Backend API
│   ├── models/          # Database schemas
│   ├── controllers/     # Business logic
│   ├── routes/          # API routes
│   └── server.js        # Entry point
├── frontend/            # React app
│   ├── src/
│   │   ├── components/  # Reusable components
│   │   ├── pages/       # Page components
│   │   ├── context/     # State management
│   │   └── services/    # API calls
│   └── public/          # Static files
├── run-local.ps1        # Windows setup
├── run-local.sh         # Linux/Mac setup
├── run-docker.ps1       # Windows Docker
├── run-docker.sh        # Linux/Mac Docker
├── README.md            # Main documentation
├── SETUP.md             # Detailed setup guide
└── PROJECT_REPORT.md    # Project report
```

---

## Support

📧 For issues, check:
1. **SETUP.md** - Detailed setup instructions
2. **README.md** - Full documentation
3. **PROJECT_REPORT.md** - Complete project details

---

## Next Steps

1. ✅ Run the application
2. ✅ Login with test credentials
3. ✅ Browse movies and make a booking
4. ✅ Check admin panel (login as admin)
5. ✅ Explore the code
6. ✅ Customize for your needs

---

**Enjoy your Movie Booking System! 🎬🍿**
