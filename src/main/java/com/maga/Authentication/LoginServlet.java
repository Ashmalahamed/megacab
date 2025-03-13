package com.maga.Authentication;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.maga.JavaFiles.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String ADMIN_EMAIL = "admin@gmail.com";
    private static final String ADMIN_PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Debugging: Log received parameters
        System.out.println("Login Attempt: Email = " + email + ", Password = " + password);

        // Validate input fields
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            System.out.println("Missing form data!");
            response.sendRedirect("login.jsp?error=All+fields+are+required.");
            return;
        }

        // Validate email format (basic regex check)
        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            System.out.println("Invalid email format!");
            response.sendRedirect("login.jsp?error=Invalid+email+format.");
            return;
        }

        // Get session
        HttpSession session = request.getSession();

        // Check if admin login
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            session.setAttribute("userRole", "admin");
            session.setAttribute("userName", "Admin");
            System.out.println("Admin Login Successful: Redirecting to admin-interface.jsp");
            response.sendRedirect("admin-interface.jsp");
            return;
        }

        // Check user credentials
        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateUser(email, password);

        if (user != null) {
            session.setAttribute("userRole", "user");
            session.setAttribute("userName", user.getName()); // Use getName() instead of getUsername()
            System.out.println("User Login Successful: Redirecting to users-interface.jsp");
            response.sendRedirect("users-interface.jsp");
        } else {
            System.out.println("Login Failed: Invalid email or password.");
            response.sendRedirect("login.jsp?error=Invalid+credentials.");
        }
    }
}