<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-21
  Time: 10:21 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Driver</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }

        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 2rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #28a745;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input {
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus {
            border-color: #28a745;
            outline: none;
            box-shadow: 0 0 8px rgba(40, 167, 69, 0.3);
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #28a745, #1e7e34);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #1e7e34, #28a745);
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2><i class="fas fa-user-plus"></i> Register a Driver</h2>

    <%-- Display Error Message --%>
    <% if (request.getParameter("error") != null) { %>
    <p style="color: red; text-align: center;"><i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error").replace("+", " ") %></p>
    <% } %>

    <form action="RegisterDriverServlet" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name:</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Enter your full name">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" name="email" id="email" class="form-control" placeholder="Enter your email">
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Phone Number:</label>
            <input type="text" name="phone" id="phone" class="form-control" placeholder="Enter your phone number">
        </div>

        <div class="mb-3">
            <label for="licenseNumber" class="form-label">License Number:</label>
            <input type="text" name="licenseNumber" id="licenseNumber" class="form-control" placeholder="Enter your license number">
        </div>

        <button type="submit" class="btn btn-success">Register</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>