package com.maga.Authentication;

import com.maga.JavaFiles.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.maga.DB.DatabaseConnection;

public class UserDAO {


    public User validateUser(String email, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("phoneNumber"),
                            rs.getString("address")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Error in validateUser: " + e.getMessage());
            e.printStackTrace();
        }

        return user;
    }


    public boolean registerUser(User user) {
        String query = "INSERT INTO users (name, email, password, phoneNumber, address) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getAddress());

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("User registered successfully!");
                return true;
            } else {
                System.out.println("No rows inserted during registration.");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("SQL Error in registerUser: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}