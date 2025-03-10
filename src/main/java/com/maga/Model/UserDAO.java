package com.maga.Model;

import com.maga.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public boolean registerUser(User user) {
        Connection conn = DatabaseConnection.getConnection();

        if (conn == null) {
            System.out.println("Database connection failed in UserDAO!");
            return false;
        }

// Updated SQL query to include phone_number and address
        String query = "INSERT INTO users (name, email, password, phone_number, address) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
// Set parameters for the prepared statement
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setString(5, user.getAddress());

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("User inserted successfully into the database!");
                return true;
            } else {
                System.out.println("No rows inserted!");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("SQL Error in UserDAO: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


    public User validateUser(String email, String password) {
        Connection conn = DatabaseConnection.getConnection();

        if (conn == null) {
            System.out.println("Database connection failed in UserDAO!");
            return null;
        }

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                return new User(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone_number"), // New field
                        rs.getString("address") // New field
                );
            }
        } catch (SQLException e) {
            System.out.println("SQL Error in UserDAO: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
}