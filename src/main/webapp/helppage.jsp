<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-03-01
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Maga Cab Service</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: #121212; /* Dark background */
            color: #e0e0e0; /* Light text for contrast */
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;

        }

        /* Container Styling */
        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.7); /* Semi-transparent black overlay */
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
            position: relative;
            overflow: hidden;
            animation: fadeIn 1.5s ease-in-out;
        }

        header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            color: #ff6f61; /* Accent color for heading */
            position: relative;
            z-index: 1;
            animation: slideInDown 1s ease-in-out;
        }

        header p {
            font-size: 1rem;
            color: #ccc;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Instructions Section */
        .instructions {
            text-align: left;
            margin-top: 1rem;
            color: #ddd;
        }

        .instructions .step {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .instructions .step-icon {
            font-size: 1.5rem;
            color: #ff6f61; /* Accent color for icons */
            margin-right: 15px;
        }

        .instructions h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
            color: #ff6f61; /* Accent color for subheadings */
        }

        .instructions p {
            font-size: 1rem;
            margin-bottom: 0;
            color: #ccc;
        }

        /* Button Styling */
        .btn {
            text-decoration: none;
            color: #fff;
            background-color: #ff6f61;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
            display: inline-block;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #ff3b2f;
            transform: translateY(-3px);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* Button Hover Effect */
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.3);
            transition: left 0.5s ease;
            z-index: -1;
        }

        .btn:hover::before {
            left: 0;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideInDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>How to Use Maga Cab Service</h1>
        <p>Your guide to navigating our platform.</p>
    </header>

    <div class="instructions">
        <div class="step">
            <i class="fas fa-user-plus step-icon"></i>
            <div>
                <h3>Step 1: Register or Login</h3>
                <p>If you're a new user, click the "Register" button to create an account. If you already have an account, click "Login" to access your profile.</p>
            </div>
        </div>

        <div class="step">
            <i class="fas fa-taxi step-icon"></i>
            <div>
                <h3>Step 2: Book a Cab</h3>
                <p>Once logged in, navigate to the "Book a Cab" section. Enter your pickup location, drop location, cab type, and booking time. Click "Book Now" to confirm your ride.</p>
            </div>
        </div>

        <div class="step">
            <i class="fas fa-list-alt step-icon"></i>
            <div>
                <h3>Step 3: View Your Bookings</h3>
                <p>You can view all your bookings in the "View Bookings" section. Here, you can also cancel any unwanted bookings.</p>
            </div>
        </div>

        <div class="step">
            <i class="fas fa-headset step-icon"></i>
            <div>
                <h3>Step 4: View Vehicles</h3>
                <p>you can view all the vehicles in the system.</p>
            </div>

        <div class="step">
            <i class="fas fa-headset step-icon"></i>
            <div>
                <h3>Step 4: Contact Support</h3>
                <p>If you encounter any issues or need assistance, feel free to contact our support team via the provided social media links or email.</p>
            </div>

        </div>
    </div>

    <a href="index.jsp" class="btn">Go Back to Home</a>
</div>
</body>
</html>