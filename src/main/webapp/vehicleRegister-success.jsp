<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-03-01
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vehicle Success</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Font Awesome Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
    }

    .message-container {
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
      margin-bottom: 2rem;
    }

    .action-btn {
      display: inline-block;
      margin: 0 10px;
      padding: 10px 20px;
      border-radius: 8px;
      font-size: 1rem;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }

    .register-btn {
      background-color: #0d6efd;
      color: white;
    }

    .register-btn:hover {
      background-color: #0b5ed7;
    }

    .home-btn {
      background-color: #6c757d;
      color: white;
    }

    .home-btn:hover {
      background-color: #5a6268;
    }
  </style>
</head>
<body>

<div class="message-container">
  <h2><i class="fas fa-check-circle"></i> Success!</h2>
  <p><%= request.getParameter("message") != null ? request.getParameter("message") : "Your action was completed successfully." %></p>

  <div>
    <a href="admin-interface.jsp" class="action-btn register-btn"><i class="fas fa-plus"></i> Register Another Vehicle</a>
    <a href="index.jsp" class="action-btn home-btn"><i class="fas fa-home"></i> Go to Home</a>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>