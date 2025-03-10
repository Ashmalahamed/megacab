<%--
Created by IntelliJ IDEA.
User: ahame
Date: 2025-03-01
Time: 4:52 PM
To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.maga.service.BookVehicleServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Vehicles</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .table-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 30px;
        }
        .table {
            margin-top: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
        .table thead {
            background-color: #4CAF50;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            color: #dc3545;
            font-size: 1.2rem;
        }
        .error-message {
            text-align: center;
            color: #dc3545;
            font-size: 1.2rem;
        }
        .btn-book {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn-book:hover {
            background-color: #45a049;
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
    </style>
</head>
<body>

<div class="container table-container">
    <h2><i class="fas fa-car"></i> Registered Vehicles</h2>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Vehicle Name</th>
            <th>Vehicle Type</th>
            <th>Registration Number</th>
            <th>Driver Name</th>
            <th>Action</th> <!-- New column for the "Book" button -->
        </tr>
        </thead>
        <tbody>

        <%
            // Database connection details
            String dbURL = "jdbc:mysql://localhost:3306/magacabs";
            String dbUser = "root";
            String dbPass = "abc123";

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // SQL Query to fetch vehicles
                String sql = "SELECT * FROM vehicles";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                boolean hasData = false;

                while (rs.next()) {
                    hasData = true;
                    int vehicleId = rs.getInt("id"); // Get the vehicle ID for the "Book" button
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("vehicle_name") %></td>
            <td><%= rs.getString("vehicle_type") %></td>
            <td><%= rs.getString("registration_number") %></td>
            <td><%= rs.getString("driver_name") %></td>
            <td>
                <!-- Book Button -->
                <form action="BookVehicleServlet" method="post">
                    <input type="hidden" name="vehicleId" value="<%= vehicleId %>">
                    <button type="submit" class="btn-book">Book</button>
                </form>
            </td>
        </tr>
        <%
            }

            if (!hasData) {
        %>
        <tr>
            <td colspan="6" class="no-data"><i class="fas fa-exclamation-circle"></i> No vehicles found in the database.</td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <tr>
            <td colspan="6" class="error-message"><i class="fas fa-times-circle"></i> Error fetching data from the database!</td>
        </tr>
        <%
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>

        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>