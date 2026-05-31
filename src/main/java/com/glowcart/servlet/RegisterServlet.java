package com.glowcart.servlet;

// CORRECT IMPORTS:
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Your custom imports for DAOs and Models:
import com.glowcart.dao.UserDAO;
import com.glowcart.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Simple Validation
        if (username == null || email == null || password == null || 
            username.isEmpty() || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("register.jsp?error=empty");
            return;
        }

        // Create User Object
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole("customer"); // Default role for new users

        // Save to Database
        userDAO.saveUser(user);

        // Redirect to login page with success message
        response.sendRedirect("login.jsp?msg=registered");
    }
}