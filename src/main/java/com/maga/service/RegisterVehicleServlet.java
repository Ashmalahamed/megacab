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

@WebServlet("/RegisterVehicleServlet")
public class RegisterVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String vehicleName = request.getParameter("vehicleName");
        String vehicleType = request.getParameter("vehicleType");
        String registrationNumber = request.getParameter("registrationNumber");
        String driverName = request.getParameter("driverName");
        String contactNumber = request.getParameter("contactNumber");

        // Server-side validation
        StringBuilder errors = new StringBuilder();

        if (vehicleName == null || vehicleName.trim().isEmpty()) {
            errors.append("Vehicle Name is required.<br>");
        }

        if (vehicleType == null || vehicleType.trim().isEmpty()) {
            errors.append("Vehicle Type is required.<br>");
        }

        if (driverName == null || driverName.trim().isEmpty()) {
            errors.append("Driver Name is required.<br>");
        } else if (!driverName.matches("^[a-zA-Z\\s]+$")) {
            errors.append("Driver Name should only contain letters.<br>");
        }

        if (contactNumber == null || contactNumber.trim().isEmpty()) {
            errors.append("Contact Number is required.<br>");
        } else if (!contactNumber.matches("^\\d{10}$")) {
            errors.append("Contact Number must be 10 digits.<br>");
        }


        if (errors.length() > 0) {
            response.sendRedirect("registerVehicle.jsp?error=" + errors.toString());
            return;
        }


        try {

            Connection conn = DatabaseConnection.getConnection();
            if (conn == null) {
                System.out.println("Failed to establish database connection.");
                response.sendRedirect("registerVehicle.jsp?error=Database connection failed.");
                return;
            }

            // Prepare SQL query
            String sql = "INSERT INTO vehicles (vehicle_name, vehicle_type, registration_number, driver_name, contact_number) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, vehicleName);
            stmt.setString(2, vehicleType);
            stmt.setString(3, registrationNumber);
            stmt.setString(4, driverName);
            stmt.setString(5, contactNumber);

            // Debug statement to log the query
            System.out.println("Executing query: " + stmt.toString());

            // Execute the query
            int rowsAffected = stmt.executeUpdate();

            // Close resources
            stmt.close();
            conn.close();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                System.out.println("Data inserted successfully.");
                response.sendRedirect("vehicleRegister-success.jsp?message=Vehicle registered successfully!");
            } else {
                System.out.println("Failed to insert data.");
                response.sendRedirect("registerVehicle.jsp?error=Failed to register vehicle.");
            }
        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect("registerVehicle.jsp?error=Database error. Please try again later.");
        }
    }
}