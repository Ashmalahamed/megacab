package com.maga.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.maga.DB.DatabaseConnection;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the booking ID from the form
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        try {
            // Establish database connection
            Connection conn = DatabaseConnection.getConnection();
            if (conn != null) {
                // Delete the booking from the database
                String sql = "DELETE FROM bookings WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, bookingId);
                stmt.executeUpdate();

                // Close resources
                stmt.close();
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to ViewBookServlet to reload the bookings
        response.sendRedirect("ViewBookServlet");
    }
}