# Payment & Booking Guide - For Project Demo

## ✅ How Payment Works (Simulated for Project)

Your movie booking system has a **simulated payment system** perfect for project demonstrations. No real money is involved!

---

## 💳 Payment Flow

### **Step-by-Step Process:**

```
1. User selects seats
   ↓
2. Clicks "Proceed to Payment"
   ↓
3. Chooses payment method (UPI/Card/Wallet)
   ↓
4. Clicks "Pay ₹XXX" button
   ↓
5. System simulates 2-second processing
   ↓
6. Booking is created in database
   ↓
7. User sees success page with E-ticket
   ↓
8. Booking appears in "My Bookings"
   ↓
9. Admin can see booking in admin panel
```

---

## 🎯 How to Test Complete Booking

### **For Regular User:**

1. **Login as User**
   ```
   Email: user@test.com
   Password: User@123
   ```

2. **Browse Movies**
   - Go to Movies page
   - Select any movie (e.g., "Avengers: Endgame")

3. **Choose Showtime**
   - Select date (Today/Tomorrow)
   - Click on any time slot (e.g., "07:00 PM")

4. **Select Seats**
   - Click on 2-3 green seats
   - See total amount update
   - Click "Proceed to Payment"

5. **Payment Page** ⭐
   - Choose payment method:
     - **UPI** - Shows QR code (can scan but not required for demo)
     - **Card** - Shows card form (fill dummy data)
     - **Wallet** - Shows wallet options
   - Click **"Pay ₹XXX"** button

6. **Payment Processing**
   - See "Processing payment..." toast notification
   - Wait 2 seconds (simulated payment)
   - Automatic redirect to success page

7. **Success!** 🎉
   - See confetti animation
   - View E-ticket with QR code
   - Download or print ticket
   - Booking code displayed

8. **Verify Booking**
   - Go to "My Bookings" in navbar
   - See your booking listed
   - All details displayed
   - Can cancel if needed

---

## 🛠️ For Admin Verification

### **Check Booking in Admin Panel:**

1. **Logout** from user account

2. **Login as Admin**
   ```
   Email: admin@moviebooking.com
   Password: Admin@123
   ```

3. **Go to Admin Dashboard**
   - Click "Admin Dashboard" in navbar
   - See total bookings count increased

4. **View All Bookings**
   - Click "View All Bookings" or go to `/admin/bookings`
   - See the new booking listed
   - Details include:
     - Booking code
     - User name (Test User)
     - Movie name
     - Theater
     - Date & time
     - Seats
     - Amount
     - Status (CONFIRMED)

---

## 🎫 What Gets Stored in Database

### **Booking Record Contains:**

```javascript
{
  bookingCode: "BK1737567890ABC",      // Unique code
  user: "User ID",                      // Reference to user
  movie: "Movie ID",                    // Movie reference
  theater: "Theater ID",                // Theater reference
  showtime: "Showtime ID",              // Showtime reference
  seats: [                              // Selected seats
    { row: "A", number: 5, type: "regular", price: 150 },
    { row: "A", number: 6, type: "regular", price: 150 }
  ],
  totalAmount: 300,                     // Total paid
  showDate: "2026-01-22",              // Show date
  showTime: "07:00 PM",                // Show time
  paymentMethod: "upi",                // Payment method
  paymentStatus: "completed",          // Status
  bookingStatus: "confirmed",          // Booking status
  bookingDate: "2026-01-22T10:30:00"  // When booked
}
```

---

## 💡 Payment Methods Explained

### **1. UPI Payment** (Recommended for Demo)
- **Shows QR Code**: Generated with UPI payment string
- **UPI String Format**: `upi://pay?pa=moviebook@upi&pn=MovieBook&am=300&cu=INR&tn=Movie Ticket Booking`
- **Demo**: Just click "Pay" button (QR code is for visual effect)
- **Real Usage**: Users would scan with Google Pay/PhonePe

### **2. Card Payment**
- **Shows Card Form**: Card number, name, expiry, CVV
- **Demo**: Enter any dummy data (e.g., 1234 5678 9012 3456)
- **Real Usage**: Would integrate with Razorpay/Stripe

### **3. Wallet Payment**
- **Shows Wallet Options**: Paytm, Amazon Pay, etc.
- **Demo**: Just select and click "Pay"
- **Real Usage**: Would redirect to wallet apps

---

## 🔒 Security Features (Already Implemented)

✅ **JWT Authentication** - Token-based user verification
✅ **Protected Routes** - Payment page requires login
✅ **Authorization** - Only logged-in users can book
✅ **Token Auto-Refresh** - Automatically adds token to all API calls
✅ **Booking Validation** - Checks seat availability before booking
✅ **Seat Locking** - Prevents double booking

---

## 📊 Demo Scenarios

### **Scenario 1: Successful Booking**
```
1. Login → Select Movie → Choose Seats → Pay → Success
Result: Booking created, E-ticket generated, Admin can see it
```

### **Scenario 2: Try to Book Same Seats**
```
1. User 1 books seats A5, A6
2. User 2 tries to book seat A5
Result: Error "Seat already booked"
```

### **Scenario 3: Cancel Booking**
```
1. User books ticket
2. Goes to My Bookings
3. Clicks "Cancel Booking"
Result: Booking cancelled, seats released, appears in admin
```

### **Scenario 4: Admin Oversight**
```
1. Admin logs in
2. Views all bookings
3. Sees all users' bookings
4. Can see statistics on dashboard
```

---

## 🎬 Perfect for Project Presentation

### **What to Demonstrate:**

1. **User Flow** (5 minutes)
   - Browse movies with filters
   - Select showtime for any date
   - Interactive seat selection
   - Payment with QR code display
   - E-ticket generation

2. **Admin Panel** (3 minutes)
   - Login as admin
   - Show dashboard statistics
   - View all bookings
   - Demonstrate movie/theater management

3. **Technical Features** (2 minutes)
   - Explain JWT authentication
   - Show QR code generation
   - Explain database structure
   - Show API architecture

---

## 🚀 Quick Test (2 Minutes)

### **Fast Demo Flow:**

```bash
1. Open: http://localhost:3000
2. Click: "Browse Movies"
3. Click: "Avengers: Endgame"
4. Click: "Today" → "07:00 PM"
5. Login: user@test.com / User@123
6. Click: 3 seats
7. Click: "Proceed to Payment"
8. Select: "UPI Payment"
9. Click: "Pay ₹450"
10. Result: E-Ticket with QR Code! ✓
```

**Time**: ~2 minutes
**Result**: Complete booking stored in database

---

## 📱 E-Ticket Features

### **What E-Ticket Contains:**

✅ **QR Code** - Contains booking details (scannable)
✅ **Booking Code** - Unique identifier (e.g., BK1234567890ABC)
✅ **Movie Poster** - Visual confirmation
✅ **Complete Details** - Theater, date, time, seats
✅ **Download Option** - Save as image
✅ **Print Option** - Printer-friendly format

### **QR Code Data:**
```json
{
  "bookingCode": "BK1234567890ABC",
  "bookingId": "507f1f77bcf86cd799439011",
  "movie": "Avengers: Endgame",
  "seats": "A5,A6,A7",
  "showDate": "2026-01-22",
  "showTime": "07:00 PM",
  "amount": 450
}
```

---

## ✅ What's Fixed

### **Authorization Issue - SOLVED!**

**Before:**
- ❌ "Not authorized" error on payment
- ❌ Bookings not being created
- ❌ Token not sent with requests

**After:**
- ✅ Automatic token handling
- ✅ All bookings stored successfully
- ✅ Admin can see all bookings
- ✅ E-tickets generated properly

---

## 🎓 For Project Report

### **Payment System Section:**

**Type:** Simulated Payment System
**Purpose:** Demonstration and Testing
**Methods:** UPI, Credit/Debit Card, Digital Wallet
**Processing Time:** 2 seconds (simulated)
**Security:** JWT authentication, protected routes
**Storage:** MongoDB database
**QR Code:** Generated using qrcode library
**Real Integration Ready:** Can integrate Razorpay/Stripe

---

## 💼 Future Enhancements (Optional)

If you want to add real payment gateway later:

1. **Razorpay Integration**
   - Add Razorpay SDK
   - Create payment order
   - Handle webhook callbacks
   - Verify payment signature

2. **Payment Gateway Options**
   - Razorpay (India)
   - Stripe (International)
   - PayU (India)
   - Paytm (India)

3. **Additional Features**
   - Payment receipts via email
   - Refund processing
   - Payment failure handling
   - Transaction history

---

## 🎉 Summary

✅ **Payment Works**: Simulated, 2-second processing
✅ **Bookings Stored**: In MongoDB database
✅ **Admin Visibility**: Can see all bookings
✅ **E-Tickets Generated**: With downloadable QR codes
✅ **No Real Money**: Perfect for project demo
✅ **Production Ready**: Can add real gateway later

---

**Your payment system is now fully functional for project demonstration!**

**Test it now:** http://localhost:3000
