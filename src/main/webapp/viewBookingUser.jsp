<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-03-02
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.maga.JavaFiles.BookingUser" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: Arial, sans-serif; }
        .container { margin-top: 50px; }
        h2 { color: #4CAF50; }
        .table { background: white; border-radius: 8px; }
    </style>
</head>
<body>

<%
    HttpSession sessionUser = request.getSession(false);
    String username = (sessionUser != null) ? (String) sessionUser.getAttribute("userName") : null;

    if (username == null) {
        System.out.println("Username is null. Redirecting to login.jsp");
        response.sendRedirect("login.jsp");
        return;
    }

    List<BookingUser> bookings = (List<BookingUser>) request.getAttribute("bookings");
%>

<div class="container">
    <h2 class="text-center">📅 My Bookings</h2>

    <% if (bookings == null || bookings.isEmpty()) { %>
    <h5 class="text-center text-danger">No bookings found.</h5>
    <% } else { %>

    <table class="table table-bordered text-center">
        <thead class="table-success">
        <tr>
            <th>ID</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Cab Type</th>
            <th>Booking Time</th>
        </tr>
        </thead>
        <tbody>
        <% for (BookingUser booking : bookings) { %>
        <tr>
            <td><%= booking.getId() %></td>
            <td><%= booking.getPickupLocation() %></td>
            <td><%= booking.getDropLocation() %></td>
            <td><%= booking.getCabType() %></td>
            <td><%= booking.getBookingTime() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <% } %>

</div>

</body>
</html>