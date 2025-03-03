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
import java.util.ArrayList;
import java.util.List;

import com.maga.DB.DatabaseConnection;
import com.maga.JavaFiles.Vehicle;

@WebServlet("/ViewVehiclesServlet")
public class ViewVehiclesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Vehicle> vehicles = new ArrayList<>();

        try {
            // Establish database connection
            Connection conn = DatabaseConnection.getConnection();
            if (conn == null) {
                request.setAttribute("error", "Database connection failed.");
                request.getRequestDispatcher("viewVehicles.jsp").forward(request, response);
                return;
            }

            // Retrieve all vehicles from the database
            String sql = "SELECT * FROM vehicles";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setId(rs.getInt("id"));
                vehicle.setVehicleName(rs.getString("vehicle_name"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setRegistrationNumber(rs.getString("registration_number"));
                vehicle.setDriverName(rs.getString("driver_name"));
                vehicle.setContactNumber(rs.getString("contact_number"));

                vehicles.add(vehicle);
            }

            request.setAttribute("vehicles", vehicles);
            request.getRequestDispatcher("viewVehicles.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while fetching vehicle data.");
            request.getRequestDispatcher("viewVehicles.jsp").forward(request, response);
        }
    }
}
