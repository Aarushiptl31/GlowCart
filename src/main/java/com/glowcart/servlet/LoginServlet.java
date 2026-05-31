package com.glowcart.servlet;

import com.glowcart.dao.UserDAO;
import com.glowcart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Simple Validation
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        // Authenticate User
        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user != null) {
            // Login Success: Create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Redirect based on role
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("products.jsp");
            }
        } else {
            // Login Failed
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}