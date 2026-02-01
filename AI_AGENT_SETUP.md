# 🤖 AI Agent Setup Guide

## Overview
The AI Agent feature allows users to book movie tickets using natural language prompts. Simply tell the AI what you want to watch, and it will intelligently process your request and help you complete the booking.

## Features
✅ Natural language processing for booking requests
✅ Intelligent movie and showtime matching
✅ Contextual understanding (today, tomorrow, this weekend, etc.)
✅ Theater and time preferences
✅ Automatic seat type selection
✅ Smart clarification questions when needed
✅ One-click booking confirmation

## Setup Instructions

### 1. Get OpenAI API Key

1. Go to [OpenAI Platform](https://platform.openai.com/)
2. Sign up or log in to your account
3. Navigate to API Keys section
4. Create a new API key
5. Copy the key (it starts with `sk-`)

### 2. Configure Backend

Add your OpenAI API key to the backend `.env` file:

```bash
cd backend
```

Edit the `.env` file and add:
```
OPENAI_API_KEY=sk-your-actual-api-key-here
```

### 3. Restart the Application

If the application is already running, restart both backend and frontend:

**Option 1: Using PowerShell (Windows)**
```powershell
# Stop the running servers (Ctrl+C in both terminal windows)
# Then restart
.\run-local.ps1
```

**Option 2: Manual Restart**
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm start
```

## How to Use

### 1. Login to Your Account
- Navigate to http://localhost:3000
- Login with your credentials (or use the default user)

### 2. Access AI Booking
- Click on the **🤖 AI Booking** button in the navigation bar
- You'll see the AI Booking Assistant interface

### 3. Make a Booking Request

#### Example Prompts:
```
✅ "Book 2 tickets for Avatar tomorrow evening"
✅ "I want to watch Inception today afternoon at PVR Cinemas"
✅ "Get me 3 premium seats for The Dark Knight this weekend"
✅ "Book tickets for Interstellar on Friday at 7 PM"
✅ "Show me action movies playing today"
✅ "Book 4 VIP seats for Oppenheimer on Saturday morning"
✅ "I need tickets for Avatar 2 at INOX theater tonight"
```

### 4. Review and Confirm
- The AI will process your request
- Available showtimes will be displayed
- Select your preferred showtime
- Review booking details (seats, price)
- Click "Confirm Booking"

### 5. Complete Your Booking
- Your booking will be confirmed
- You'll be redirected to "My Bookings" page
- Your tickets are ready!

## How It Works

### AI Processing Pipeline:

1. **User Input**: Natural language prompt
2. **AI Analysis**: OpenAI GPT-3.5 analyzes the prompt
3. **Information Extraction**: 
   - Movie title
   - Date (converts "today", "tomorrow" to actual dates)
   - Time preference (morning/afternoon/evening)
   - Theater name
   - Number of seats
   - Seat type (regular/premium/vip)
4. **Validation**: Checks against available movies and showtimes
5. **Clarification**: Asks questions if information is unclear
6. **Presentation**: Shows matching showtimes
7. **Confirmation**: User selects and confirms booking
8. **Execution**: Creates booking in database

## Intelligent Features

### Date Understanding
- "today" → Current date
- "tomorrow" → Next day
- "this weekend" → Upcoming Saturday/Sunday
- "Friday" → Next Friday
- "2024-01-25" → Specific date

### Time Understanding
- "morning" → 6 AM - 12 PM showtimes
- "afternoon" → 12 PM - 5 PM showtimes
- "evening" → 5 PM - 12 AM showtimes
- "7 PM" → Specific time matching

### Smart Matching
- Movie titles (fuzzy matching)
- Theater names (partial matching)
- Genre preferences
- Language preferences

## API Endpoints

### Process Booking Prompt
```
POST /api/ai-agent/process
Authorization: Bearer <token>
Body: {
  "prompt": "Book 2 tickets for Avatar tomorrow"
}
```

### Confirm AI Booking
```
POST /api/ai-agent/confirm-booking
Authorization: Bearer <token>
Body: {
  "showtimeId": "...",
  "numberOfSeats": 2,
  "seatType": "regular"
}
```

### Get AI Recommendations
```
GET /api/ai-agent/recommendations
Authorization: Bearer <token>
```

## Troubleshooting

### "AI processing failed"
- **Cause**: Missing or invalid OpenAI API key
- **Solution**: Check your `.env` file and ensure OPENAI_API_KEY is set correctly

### "No showtimes available"
- **Cause**: No matching showtimes for the requested movie/date
- **Solution**: Try a different date or check available movies

### Rate Limit Errors
- **Cause**: Too many API requests to OpenAI
- **Solution**: Wait a moment and try again, or upgrade your OpenAI plan

### Backend Not Responding
- **Cause**: Backend server not running or OpenAI package not installed
- **Solution**: 
  ```bash
  cd backend
  npm install openai
  npm run dev
  ```

## Cost Considerations

- OpenAI API charges per request
- GPT-3.5-turbo is cost-effective (~$0.002 per request)
- Each booking prompt costs approximately $0.002-0.005
- Monitor usage at [OpenAI Usage Dashboard](https://platform.openai.com/usage)

## Future Enhancements

🚀 **Planned Features:**
- Voice-based booking
- Multi-language support
- Advanced recommendations based on user history
- Group booking coordination
- Calendar integration
- SMS/Email booking confirmations via AI

## Support

For issues or questions:
1. Check the console logs (browser and backend)
2. Verify OpenAI API key is valid
3. Ensure all dependencies are installed
4. Check MongoDB is running

## Demo Credentials

**Admin User:**
- Email: admin@moviebooking.com
- Password: Admin@123

**Regular User:**
- Email: user@test.com
- Password: User@123

---

**Enjoy booking movies with AI! 🎬🤖**
