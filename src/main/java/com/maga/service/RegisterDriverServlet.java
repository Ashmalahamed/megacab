package com.maga.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.maga.DB.DatabaseConnection;

@WebServlet("/RegisterDriverServlet")
public class RegisterDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String licenseNumber = request.getParameter("licenseNumber");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Debugging: Log received parameters
            System.out.println("Received Parameters:");
            System.out.println("Name: " + name);
            System.out.println("Email: " + email);
            System.out.println("Phone: " + phone);
            System.out.println("License Number: " + licenseNumber);

            // Get database connection
            conn = DatabaseConnection.getConnection();
            if (conn == null) {
                System.out.println("Database connection failed.");
                response.sendRedirect("register-driver.jsp?error=Database+connection+failed.");
                return;
            }

            // Insert driver into the database
            String sql = "INSERT INTO drivers (name, email, phone, licenseNumber) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, licenseNumber);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Driver registered successfully.");
                response.sendRedirect("registerdriver-success.jsp");
            } else {
                System.out.println("Failed to register driver.");
                response.sendRedirect("register-driver.jsp?error=Failed+to+register+driver.");
            }
        } catch (Exception e) {
            // Log the exception for debugging
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
            response.sendRedirect("register-driver.jsp?error=An+error+occurred+while+processing+your+request.");
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}