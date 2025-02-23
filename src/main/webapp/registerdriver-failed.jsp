<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-21
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .error-message {
            color: #dc3545; /* Red color for error messages */
            font-size: 1.5em;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff; /* Blue color for buttons */
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
<div class="error-message">Driver Registration Failed!</div>
<br>
<a href="Register-Driver.jsp">Go back to the Driver Registration</a>
<a href="admin-interface.jsp">Admin Panel</a>
<a href="index.jsp">Logout</a>
</body>
</html>