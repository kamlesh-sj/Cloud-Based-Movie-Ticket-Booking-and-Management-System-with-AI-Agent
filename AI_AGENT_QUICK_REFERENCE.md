# 🤖 AI Agent Quick Reference

## Quick Start (3 Steps)

### Step 1: Add OpenAI API Key
```bash
# Edit backend/.env and add:
OPENAI_API_KEY=sk-your-key-here
```

### Step 2: Restart Backend
```bash
cd backend
npm run dev
```

### Step 3: Use AI Booking
- Login at http://localhost:3000
- Click **🤖 AI Booking** in navbar
- Type your request!

---

## Example Prompts

### Basic Booking
```
"Book 2 tickets for Avatar tomorrow"
"I want to watch Inception today"
"Get me 3 seats for The Dark Knight"
```

### With Time Preference
```
"Book Avatar tomorrow evening"
"Show me Inception afternoon shows"
"Book Interstellar morning show on Friday"
```

### With Theater
```
"Book 2 tickets for Avatar at PVR tomorrow"
"I want to watch Inception at INOX today"
"Book The Dark Knight at Cinepolis evening show"
```

### With Seat Type
```
"Book 2 premium tickets for Avatar tomorrow"
"Get me 3 VIP seats for Inception today"
"Book 4 regular seats for The Dark Knight"
```

### Complex Request
```
"Book 4 premium tickets for Avatar at PVR tomorrow evening"
"I need 2 VIP seats for Inception at INOX today afternoon"
"Get me 3 regular tickets for The Dark Knight this Friday at 7 PM"
```

---

## Date Keywords

| Keyword | Meaning |
|---------|---------|
| `today` | Current date |
| `tomorrow` | Next day |
| `this weekend` | Upcoming Sat/Sun |
| `Friday`, `Saturday`, etc. | Next occurrence |
| `2024-01-25` | Specific date |

## Time Keywords

| Keyword | Time Range |
|---------|------------|
| `morning` | 6 AM - 12 PM |
| `afternoon` | 12 PM - 5 PM |
| `evening` | 5 PM - 12 AM |
| `7 PM`, `3:30 PM` | Specific time |

## Seat Types

- `regular` - Standard seats
- `premium` - Premium seats
- `vip` - VIP seats

---

## Files Added/Modified

### Backend
✅ `backend/controllers/aiAgentController.js` - AI logic
✅ `backend/routes/aiAgentRoutes.js` - API routes
✅ `backend/server.js` - Route registration
✅ `backend/.env` - OpenAI API key
✅ `backend/.env.example` - Template updated

### Frontend
✅ `frontend/src/pages/AIBooking.js` - UI component
✅ `frontend/src/pages/AIBooking.css` - Styling
✅ `frontend/src/App.js` - Route added
✅ `frontend/src/components/Navbar.js` - AI link added
✅ `frontend/src/components/Navbar.css` - AI link styling

### Documentation
✅ `AI_AGENT_SETUP.md` - Full setup guide
✅ `AI_AGENT_QUICK_REFERENCE.md` - This file

---

## API Endpoints

```javascript
// Process booking prompt
POST /api/ai-agent/process
Headers: { Authorization: "Bearer <token>" }
Body: { prompt: "Book 2 tickets for Avatar tomorrow" }

// Confirm booking
POST /api/ai-agent/confirm-booking
Headers: { Authorization: "Bearer <token>" }
Body: { 
  showtimeId: "...",
  numberOfSeats: 2,
  seatType: "regular"
}

// Get recommendations
GET /api/ai-agent/recommendations
Headers: { Authorization: "Bearer <token>" }
```

---

## Troubleshooting

### Issue: "AI processing failed"
**Fix:** Check OPENAI_API_KEY in backend/.env

### Issue: "No showtimes available"
**Fix:** Try different date or movie

### Issue: Backend error
**Fix:** 
```bash
cd backend
npm install openai
npm run dev
```

---

## Cost
- ~$0.002-0.005 per booking request
- Uses GPT-3.5-turbo (cost-effective)

---

## Support
- Check console logs (F12 in browser)
- Verify MongoDB is running
- Ensure backend and frontend are running
