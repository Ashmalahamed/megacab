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

@WebServlet("/UpdateBillServlet")
public class UpdateBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the bill ID from the form
        int billId = Integer.parseInt(request.getParameter("billId"));

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn == null) {
                System.out.println("Database connection failed.");
                response.sendRedirect("viewbill.jsp?error=db");
                return;
            }

            // Update the payment status to "Paid"
            String sql = "UPDATE bills SET paymentStatus = 'Paid' WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, billId);
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    System.out.println("Bill ID " + billId + " marked as Paid.");
                    response.sendRedirect("admin-interface.jsp"); // Redirect back to the same page
                } else {
                    System.out.println("Failed to update bill ID " + billId);
                    response.sendRedirect("viewbill.jsp?error=update");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewbill.jsp?error=db");
        }
    }
}