<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-19
  Time: 7:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%
    // Get the session
    HttpSession sessionObj = request.getSession(false);
    String userName = (sessionObj != null) ? (String) sessionObj.getAttribute("userName") : null;
    // Redirect to login if not logged in
    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }

        h1 {
            color: #4CAF50;
        }

        .logout {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background: #d9534f;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .logout:hover {
            background: #c9302c;
        }
    </style>
</head>
<body>

<!-- Sidebar Navigation -->
<div class="sidebar">
    <a href="#" data-page="welcome.jsp"><i class="bi bi-house-door"></i> Home</a>
    <a href="#" data-page="bookcab.jsp"><i class="bi bi-car-front"></i> Book A Cab</a>
    <a href="#" data-page="viewbooking.jsp"><i class="bi bi-list-check"></i> View Booking</a>
    <a href="#" data-page="viewDrivers.jsp"><i class="bi bi-person"></i> View Drivers</a>
    <a href="index.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <div id="page-content" class="container">
        <!-- Default content -->
        <h1>Welcome, <%= userName %>! 🎉</h1>
        <p>You have successfully registered.</p>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        // Handle navigation link clicks
        $('.sidebar a').on('click', function (e) {
            e.preventDefault(); // Prevent default link behavior

            // Get the target page from the data-page attribute
            const page = $(this).data('page');

            // Load the content of the selected page into the main content area
            $('#page-content').load(page, function (response, status, xhr) {
                if (status === 'error') {
                    $('#page-content').html('<p>Error loading page. Please try again later.</p>');
                }
            });
        });
    });
</script>

</body>
</html>