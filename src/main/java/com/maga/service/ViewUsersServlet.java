package com.maga.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.maga.JavaFiles.User;

import com.maga.DB.DatabaseConnection; // Import the existing DatabaseConnection class

@WebServlet("/ViewUsersServlet")
public class ViewUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn == null) {
                System.out.println("Database connection failed.");
                response.sendRedirect("error.jsp");
                return;
            }
            System.out.println("Database connection successful.");

            // Updated SQL query to include phone_number and address fields
            String sql = "SELECT id, name, email, password, phone_number, address FROM users";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = stmt.executeQuery()) {
                    if (!rs.isBeforeFirst()) { // Check if ResultSet is empty
                        System.out.println("No data found in the database.");
                    } else {
                        while (rs.next()) {
                            User user = new User();
                            user.setId(rs.getInt("id"));
                            user.setName(rs.getString("name")); // Updated from username to name
                            user.setEmail(rs.getString("email"));
                            user.setPassword(rs.getString("password"));
                            user.setPhoneNumber(rs.getString("phone_number")); // New field
                            user.setAddress(rs.getString("address"));         // New field
                            users.add(user);
                            System.out.println("User added: " + user.getName());
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        // Forward the list of users to the JSP page
        request.setAttribute("users", users);
        request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
    }
}