<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-20
  Time: 5:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Check if the user is logged in
    HttpSession sessionObj = request.getSession(false);
    String userName = (sessionObj != null) ? (String) sessionObj.getAttribute("userName") : null;
    if (userName == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Cab</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Form Container */
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        /* Heading Styling */
        h2 {
            color: #28a745;
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: bold;
        }

        /* Paragraph Styling */
        p {
            color: #555;
            margin-bottom: 30px;
            font-size: 1rem;
        }

        /* Label Styling */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
            text-align: left;
        }

        /* Input and Select Fields */
        input[type="text"],
        input[type="datetime-local"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="datetime-local"]:focus,
        input[type="tel"]:focus,
        select:focus {
            border-color: #28a745;
            outline: none;
        }

        /* Button Styling */
        button {
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #218838;
        }

        /* Links Styling */
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        /* Logout Link Styling */
        .logout {
            color: #FFFFFF;
        }

        .logout:hover {
            color: #FFFFFF;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>🚖 Book Your Cab</h2>
    <p>Welcome, <b><%= userName %></b>! Fill in the details below to book your ride.</p>
    <form action="BookCabServlet" method="post">
        <!-- Hidden Field for UserName -->
        <input type="hidden" name="userName" value="<%= userName %>">

        <!-- Pickup Location -->
        <label for="pickupLocation">Pickup Location:</label>
        <input type="text" name="pickupLocation" id="pickupLocation" required>

        <!-- Drop Location -->
        <label for="dropLocation">Drop Location:</label>
        <input type="text" name="dropLocation" id="dropLocation" required>

        <!-- Cab Type -->
        <label for="cabType">Select Cab Type:</label>
        <select name="cabType" id="cabType" required>
            <option value="Standard">Standard</option>
            <option value="Luxury">Luxury</option>
            <option value="SUV">SUV</option>
        </select>

        <!-- Booking Time -->
        <label for="bookingTime">Booking Time:</label>
        <input type="datetime-local" name="bookingTime" id="bookingTime" required>

        <!-- Customer Name -->
        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" id="customerName" placeholder="Enter your name" required>

        <!-- Customer Address -->
        <label for="customerAddress">Customer Address:</label>
        <input type="text" name="customerAddress" id="customerAddress" placeholder="Enter your address" required>

        <!-- Customer Phone -->
        <label for="customerPhone">Customer Phone:</label>
        <input type="tel" name="customerPhone" id="customerPhone" placeholder="Enter your phone number" required pattern="\d{10,15}">

        <!-- Coupon Code (Optional) -->
        <label for="couponCode">Coupon Code (Optional):</label>
        <input type="text" name="couponCode" id="couponCode" placeholder="Enter coupon code">

        <!-- Submit Button -->
        <button type="submit">Book Now</button>
    </form>
</div>
</body>
</html>