<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-21
  Time: 10:29 PM
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

        h1 {
            color: #333;
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }

        .success-message {
            color: #28a745;
            font-size: 1.5em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="success-message">Driver Registered Successfully!</div>
<br>
<a href="Register-Driver.jsp">Go back to the Driver Registration</a>
<a href="admin-interface.jsp">Admin Panel</a>
<a href="index.jsp">Logout</a>
</body>
</html>