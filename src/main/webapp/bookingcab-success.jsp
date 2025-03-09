<%--
Created by IntelliJ IDEA.
User: ahame
Date: 2025-03-01
Time: 4:52 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Successful</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .success-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #4CAF50;
            font-size: 2rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 20px;
        }
        .btn-back {
            display: inline-block;
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn-back:hover {
            background-color: #45a049;
        }
        .icon-success {
            font-size: 4rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container success-container">
    <i class="fas fa-check-circle icon-success"></i>
    <h1>Booking Successful!</h1>
    <p>Your vehicle has been successfully booked.</p>

    <%
        // Retrieve booking details from request attributes
        String vehicleName = (String) request.getAttribute("vehicleName");
        String vehicleType = (String) request.getAttribute("vehicleType");
        String driverName = (String) request.getAttribute("driverName");

        if (vehicleName != null && vehicleType != null && driverName != null) {
    %>
    <div class="booking-details">
        <p><strong>Vehicle Name:</strong> <%= vehicleName %></p>
        <p><strong>Vehicle Type:</strong> <%= vehicleType %></p>
        <p><strong>Driver Name:</strong> <%= driverName %></p>
    </div>
    <%
    } else {
    %>
    <p><strong>Details:</strong> Booking confirmed, but details are unavailable.</p>
    <%
        }
    %>

    <a href="users-interface.jsp" class="btn-back">Back to Vehicles</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>