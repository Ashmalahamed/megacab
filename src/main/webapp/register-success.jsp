<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-19
  Time: 7:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Successful</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Font Awesome Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
    }

    .success-container {
      max-width: 500px;
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
      margin-bottom: 2rem;
    }

    .login-btn {
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

    .login-btn:hover {
      background-color: #0b5ed7;
    }
  </style>
</head>
<body>

<div class="success-container">
  <h2><i class="fas fa-check-circle"></i> Registration Successful!</h2>
  <p>You have been registered successfully. Please proceed to login.</p>
  <a href="login.jsp" class="login-btn"><i class="fas fa-sign-in-alt"></i> Go to Login</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>