<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-23
  Time: 7:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.maga.JavaFiles.Booking" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
  HttpSession sessionObj = request.getSession(false);
  String userName = (sessionObj != null) ? (String) session.getAttribute("userName") : null;
  String userRole = (sessionObj != null) ? (String) session.getAttribute("userRole") : null;
  if (userName == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  @SuppressWarnings("unchecked")
  List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Bookings</title>
  <style>
    /* General Body Styling */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }

    /* Heading Styling */
    h2 {
      color: #28a745;
      margin-bottom: 30px;
      font-size: 2rem;
      font-weight: bold;
    }

    /* Table Styling */
    table {
      width: 90%;
      max-width: 1000px;
      margin: auto;
      border-collapse: collapse;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      background: white;
      border-radius: 10px;
      overflow: hidden;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #28a745;
      color: white;
      font-weight: bold;
      text-transform: uppercase;
    }

    tr:hover {
      background-color: #f1f1f1;
      transition: background-color 0.3s ease;
    }

    /* Cancel Button Styling */
    .cancel-btn {
      display: inline-block;
      padding: 8px 12px;
      background-color: #dc3545;
      color: white;
      font-size: 0.9rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .cancel-btn:hover {
      background-color: #bd2130;
    }

    /* Link Styling */
    a {
      display: inline-block;
      margin-top: 20px;
      text-decoration: none;
      color: #007bff;
      font-size: 1rem;
      transition: color 0.3s ease;
    }

    a:hover {
      color: #0056b3;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      table {
        width: 100%;
      }

      th, td {
        padding: 10px;
        font-size: 0.9rem;
      }
    }
  </style>
</head>
<body>
<h2>📖 View Bookings</h2>

<% if (bookings == null || bookings.isEmpty()) { %>
<p>No bookings available.</p>
<% } else { %>
<table>
  <thead>
  <tr>
    <% if ("admin".equals(userRole)) { %>
    <th>User Name</th>
    <% } %>
    <th>Pickup Location</th>
    <th>Drop Location</th>
    <th>Cab Type</th>
    <th>Booking Time</th>
    <th>Action</th>
  </tr>
  </thead>
  <tbody>
  <% for (Booking booking : bookings) { %>
  <tr>
    <% if ("admin".equals(userRole)) { %>
    <td><%= booking.getUserName() %></td>
    <% } %>
    <td><%= booking.getPickupLocation() %></td>
    <td><%= booking.getDropLocation() %></td>
    <td><%= booking.getCabType() %></td>
    <td><%= booking.getBookingTime() %></td>
    <td>
      <form action="CancelBookingServlet" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to cancel this booking?');">
        <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
        <button type="submit" class="cancel-btn">Cancel</button>
      </form>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>
<% } %>

<br>
<a href="admin-interface.jsp">⬅ Go Back to Home</a>
</body>
</html>