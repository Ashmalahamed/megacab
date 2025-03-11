package com.maga.service;

import com.maga.JavaFiles.BookingUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.maga.DB.DatabaseConnection;

@WebServlet("/ViewBookingUserServlet")
public class ViewBookingUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("userName") : null;

        if (username == null) {
            System.out.println("Username is null. Redirecting to login.jsp");
            response.sendRedirect("login.jsp");
            return;
        }

        List<BookingUser> bookings = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn == null) {
                System.out.println("Database connection failed.");
                response.sendRedirect("error.jsp");
                return;
            }

            String sql = "SELECT id, pickup_location, dropoff_location, cab_type, booking_time FROM bookings WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);

                System.out.println("Executing query for username: " + username); // Debugging

                try (ResultSet rs = stmt.executeQuery()) {
                    if (!rs.isBeforeFirst()) {
                        System.out.println("No bookings found for username: " + username);
                    }

                    while (rs.next()) {
                        BookingUser bookingUser = new BookingUser();
                        bookingUser.setId(rs.getInt("id"));
                        bookingUser.setPickupLocation(rs.getString("pickup_location"));
                        bookingUser.setDropLocation(rs.getString("dropoff_location"));
                        bookingUser.setCabType(rs.getString("cab_type"));
                        bookingUser.setBookingTime(rs.getString("booking_time"));
                        bookings.add(bookingUser);

                        System.out.println("Retrieved booking: " + bookingUser); // Debugging
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error during database query.");
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBookingUser.jsp").forward(request, response);
    }
}