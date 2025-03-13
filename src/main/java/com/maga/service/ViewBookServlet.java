package com.maga.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.maga.JavaFiles.Booking;
import com.maga.DB.DatabaseConnection;

@WebServlet("/ViewBookServlet")
public class ViewBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userName = (session != null) ? (String) session.getAttribute("userName") : null;
        String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;

        // Redirect to login if the user is not logged in
        if (userName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Booking> bookings = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            if (conn == null) {
                System.out.println("Database connection failed!");
                response.sendRedirect("error.jsp?message=Database+connection+failed.");
                return;
            }

            String sql;
            if ("admin".equals(userRole)) {
                // Admin can view all bookings
                sql = "SELECT id, userName, pickupLocation, dropLocation, cabType, bookingTime, customerName, customerAddress, customerPhone, orderNumber FROM bookings";
                stmt = conn.prepareStatement(sql);
            } else {
                // Regular users can only view their own bookings
                sql = "SELECT id, pickupLocation, dropLocation, cabType, bookingTime, customerName, customerAddress, customerPhone, orderNumber FROM bookings WHERE userName = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, userName);
            }

            rs = stmt.executeQuery();

            // Populate the list of bookings
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("userName"),
                        rs.getString("pickupLocation"),
                        rs.getString("dropLocation"),
                        rs.getString("cabType"),
                        rs.getString("bookingTime"),
                        rs.getString("customerName"),
                        rs.getString("customerAddress"),
                        rs.getString("customerPhone"),
                        rs.getString("orderNumber")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=An+error+occurred+while+fetching+bookings.");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward the bookings to the JSP page
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewbooking.jsp").forward(request, response);
    }
}