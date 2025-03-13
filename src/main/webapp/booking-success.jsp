<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-20
  Time: 5:16 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .success-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 2rem;
            text-align: center;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #28a745;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 1.5rem;
        }

        .fare {
            font-size: 1.5rem;
            color: #28a745;
            font-weight: bold;
        }

        .discount {
            font-size: 1rem;
            color: #dc3545;
            font-weight: bold;
        }

        .order-number {
            font-size: 1.2rem;
            color: #0d6efd;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="success-container">
    <h2><i class="fas fa-check-circle"></i> Booking Successful!</h2>
    <p>Your cab has been booked successfully.</p>

    <%
        // Retrieve query parameters
        String orderNumber = request.getParameter("orderNumber");
        String fareParam = request.getParameter("fare");
        String discountPercentageParam = request.getParameter("discountPercentage");

        double fare = fareParam != null ? Double.parseDouble(fareParam) : 0.0;
        double discountPercentage = discountPercentageParam != null ? Double.parseDouble(discountPercentageParam) : 0.0;
    %>

    <% if (orderNumber != null && !orderNumber.isEmpty()) { %>
    <p>Your booking order number is: <span class="order-number"><%= orderNumber %></span>.</p>
    <% } else { %>
    <p>No order number found for this booking.</p>
    <% } %>

    <p>The fare for your ride is: <span class="fare">Rs.<%= fare %></span></p>

    <% if (discountPercentage > 0) { %>
    <p>You received a discount of <span class="discount"><%= discountPercentage %>%</span>.</p>
    <% } else { %>
    <p>No discount applied.</p>
    <% } %>

    <a href="users-interface.jsp" class="btn btn-primary">Go Back to Home</a>
    <a href="logout.jsp" class="btn btn-danger">Logout</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>