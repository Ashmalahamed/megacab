package com.maga.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Database connection details
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/magacabs";
    private static final String USER = "root";
    private static final String PASSWORD = "abc123"; // Replace with your actual database password

    /**
     * Method to establish a database connection.
     * @return Connection object if successful, null otherwise.
     */
    public static Connection getConnection() {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database Connected Successfully!");
            return conn;
        } catch (ClassNotFoundException e) {
            // Handle missing JDBC driver
            System.out.println("JDBC Driver Not Found!");
            e.printStackTrace();
        } catch (SQLException e) {
            // Handle database connection issues
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }
        return null; // Return null if connection fails
    }
}