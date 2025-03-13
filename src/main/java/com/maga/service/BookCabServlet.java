package com.maga.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import com.maga.JavaFiles.Booking;

@WebServlet("/BookCabServlet")
public class BookCabServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userName = (session != null) ? (String) session.getAttribute("userName") : null;

        if (userName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve form data
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        String cabType = request.getParameter("cabType");
        String bookingTime = request.getParameter("bookingTime");
        String customerName = request.getParameter("customerName");
        String customerAddress = request.getParameter("customerAddress");
        String customerPhone = request.getParameter("customerPhone");

        // Log received parameters
        System.out.println("Pickup Location: " + pickupLocation);
        System.out.println("Drop Location: " + dropLocation);
        System.out.println("Cab Type: " + cabType);
        System.out.println("Booking Time: " + bookingTime);
        System.out.println("Customer Name: " + customerName);
        System.out.println("Customer Address: " + customerAddress);
        System.out.println("Customer Phone: " + customerPhone);

        // Validate input fields
        if (pickupLocation == null || pickupLocation.isEmpty() ||
                dropLocation == null || dropLocation.isEmpty() ||
                cabType == null || cabType.isEmpty() ||
                bookingTime == null || bookingTime.isEmpty() ||
                customerName == null || customerName.isEmpty() ||
                customerAddress == null || customerAddress.isEmpty() ||
                customerPhone == null || customerPhone.isEmpty()) {
            response.sendRedirect("booking-failed.jsp?error=All+fields+are+required.");
            return;
        }

        // Validate phone number format (basic numeric check)
        if (!customerPhone.matches("\\d{10,15}")) { // Assuming a 10-15 digit phone number
            response.sendRedirect("booking-failed.jsp?error=Invalid+phone+number+format.");
            return;
        }

        String dbURL = "jdbc:mysql://127.0.0.1:3306/magacabs";
        String dbUser = "root";
        String dbPassword = "abc123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert booking into the database with a placeholder for orderNumber
            String bookingSQL = "INSERT INTO bookings (userName, pickupLocation, dropLocation, cabType, bookingTime, customerName, customerAddress, customerPhone, orderNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement bookingStmt = conn.prepareStatement(bookingSQL, Statement.RETURN_GENERATED_KEYS);
            bookingStmt.setString(1, userName);
            bookingStmt.setString(2, pickupLocation);
            bookingStmt.setString(3, dropLocation);
            bookingStmt.setString(4, cabType);
            bookingStmt.setString(5, bookingTime);
            bookingStmt.setString(6, customerName);
            bookingStmt.setString(7, customerAddress);
            bookingStmt.setString(8, customerPhone);
            bookingStmt.setString(9, ""); // Placeholder for orderNumber
            int rowsInserted = bookingStmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = bookingStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int bookingId = generatedKeys.getInt(1);

                    // Generate a unique order number
                    String orderNumber = generateOrderNumber(bookingId, bookingTime);

                    // Update the order number in the database
                    String updateOrderNumberSQL = "UPDATE bookings SET orderNumber = ? WHERE id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateOrderNumberSQL);
                    updateStmt.setString(1, orderNumber);
                    updateStmt.setInt(2, bookingId);
                    updateStmt.executeUpdate();
                    updateStmt.close();

                    // Generate bill and calculate fare
                    double fare = generateBill(conn, bookingId, userName, pickupLocation, dropLocation, cabType, bookingTime);

                    // Redirect with order number and fare information
                    response.sendRedirect("booking-success.jsp?orderNumber=" + orderNumber + "&fare=" + fare);
                    return; // Ensure to return after redirect
                }
            }

            bookingStmt.close();
            conn.close();
            response.sendRedirect("booking-failed.jsp?error=Failed+to+insert+booking.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("booking-failed.jsp?error=An+error+occurred+while+processing+your+request.");
        }
    }

    private double generateBill(Connection conn, int bookingId, String userName, String pickupLocation, String dropLocation, String cabType, String bookingTime) {
        return 0;
    }

    private String generateOrderNumber(int bookingId, String bookingTime) {
        return null;
    }
}