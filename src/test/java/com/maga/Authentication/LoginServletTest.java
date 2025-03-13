package com.maga.Authentication;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static jdk.internal.org.objectweb.asm.util.CheckClassAdapter.verify;
import static org.mockito.Mockito.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class LoginServletTest {

    private LoginServlet loginServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    @BeforeEach
    public void setUp() {
        loginServlet = new LoginServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testAdminLoginSuccess() throws Exception {
        // Mock request parameters
        when(request.getParameter("email")).thenReturn("admin@gmail.com");
        when(request.getParameter("password")).thenReturn("admin123");

        // Mock session
        when(request.getSession()).thenReturn(session);

        // Redirect behavior
        doNothing().when(response).sendRedirect("admin-interface.jsp");

        // Perform login
        loginServlet.doPost(request, response);

        // Verify session attributes
        verify(session).setAttribute("userRole", "admin");
        verify(session).setAttribute("userName", "Admin");

        // Verify redirection
        verify(response).sendRedirect("admin-interface.jsp");
    }

    private Object doNothing() {
        return null;
    }
}