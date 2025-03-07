package com.maga.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.maga.DB.DatabaseConnection;

@WebServlet("/BookVehicleServlet")
public class BookVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the vehicle ID from the form
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {

            conn = DatabaseConnection.getConnection();

            // Check if the vehicle is already booked
            String checkStatusSQL = "SELECT status FROM vehicles WHERE id = ?";
            stmt = conn.prepareStatement(checkStatusSQL);
            stmt.setInt(1, vehicleId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String status = rs.getString("status");

                if ("Booked".equals(status)) {

                    response.sendRedirect("booking-error.jsp?message=Vehicle+already+booked");
                    return;
                }
            }

            // Update the vehicle status to "Booked"
            String updateStatusSQL = "UPDATE vehicles SET status = 'Booked' WHERE id = ?";
            stmt = conn.prepareStatement(updateStatusSQL);
            stmt.setInt(1, vehicleId);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Fetch vehicle details for the success page
                String fetchDetailsSQL = "SELECT vehicle_name, vehicle_type, driver_name FROM vehicles WHERE id = ?";
                stmt = conn.prepareStatement(fetchDetailsSQL);
                stmt.setInt(1, vehicleId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    String vehicleName = rs.getString("vehicle_name");
                    String vehicleType = rs.getString("vehicle_type");
                    String driverName = rs.getString("driver_name");

                    // Set attributes for the success page
                    request.setAttribute("vehicleName", vehicleName);
                    request.setAttribute("vehicleType", vehicleType);
                    request.setAttribute("driverName", driverName);


                    request.getRequestDispatcher("bookingcab-success.jsp").forward(request, response);
                }
            } else {

                response.sendRedirect("booking-error.jsp?message=Failed+to+book+the+vehicle");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking-error.jsp?message=An+error+occurred+while+processing+your+request");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}