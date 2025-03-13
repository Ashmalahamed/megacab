package com.maga.Authentication;

import com.maga.JavaFiles.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/register") // URL mapping for the servlet
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        // Debugging: Log received parameters
        System.out.println("Received Registration Data:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Phone Number: " + phoneNumber);
        System.out.println("Address: " + address);

        // Validate input fields
        if (name == null || name.isEmpty() ||
                email == null || email.isEmpty() ||
                password == null || password.isEmpty() ||
                phoneNumber == null || phoneNumber.isEmpty() ||
                address == null || address.isEmpty()) {

            System.out.println("Missing form data!");
            response.sendRedirect("register-failed.jsp?error=All+fields+are+required.");
            return;
        }

        // Validate email format (basic regex check)
        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            System.out.println("Invalid email format!");
            response.sendRedirect("register-failed.jsp?error=Invalid+email+format.");
            return;
        }

        // Validate phone number format (basic numeric check)
        if (!phoneNumber.matches("^\\d{10,15}$")) { // Assuming a 10-15 digit phone number
            System.out.println("Invalid phone number format!");
            response.sendRedirect("register-failed.jsp?error=Invalid+phone+number+format.");
            return;
        }

        // Create a User object with all fields
        User user = new User(name, email, password, phoneNumber, address);

        // Attempt to register the user using UserDAO
        UserDAO userDAO = new UserDAO();
        try {
            boolean success = userDAO.registerUser(user);

            if (success) {
                System.out.println("User registered successfully!");

                // Set session attributes for auto-login
                HttpSession session = request.getSession();
                session.setAttribute("userRole", "user");
                session.setAttribute("userName", name);

                // Redirect to success page
                response.sendRedirect("register-success.jsp");
            } else {
                System.out.println("Registration failed: Could not insert user.");
                response.sendRedirect("register-failed.jsp?error=Failed+to+register+user.");
            }
        } catch (Exception e) {
            // Log the exception and redirect to an error page
            System.out.println("Registration error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("register-failed.jsp?error=An+error+occurred+while+processing+your+request.");
        }
    }
}