<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-19
  Time: 7:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Failed</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }

        .error-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 2rem;
            text-align: center;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #dc3545;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 2rem;
        }

        .go-back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0d6efd;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .go-back-btn:hover {
            background-color: #0b5ed7;
        }

        /* Additional Styling for Error Icons */
        .error-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #dc3545;
        }
    </style>
</head>
<body>

<div class="error-container">
    <i class="fas fa-exclamation-circle error-icon"></i>
    <h2>Registration Failed</h2>

    <%
        // Retrieve the error parameter from the URL
        String error = request.getParameter("error");

        if ("missing_data".equals(error)) {
    %>
    <p>Please fill in all required fields before submitting the form.</p>
    <%
    } else if ("invalid_phone".equals(error)) {
    %>
    <p>The phone number must be exactly 10 digits. Please check and try again.</p>
    <%
    } else if ("invalid_email".equals(error)) {
    %>
    <p>The email address you entered is invalid. Please provide a valid email and try again.</p>
    <%
    } else if ("database_error".equals(error)) {
    %>
    <p>An error occurred while saving your data. Please try again later.</p>
    <%
    } else if ("server_error".equals(error)) {
    %>
    <p>A server error occurred. Please contact support if the issue persists.</p>
    <%
    } else {
    %>
    <p>We encountered an issue while processing your registration. Please try again.</p>
    <%
        }
    %>

    <a href="register.jsp" class="go-back-btn"><i class="fas fa-arrow-left"></i> Go Back to Register</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>