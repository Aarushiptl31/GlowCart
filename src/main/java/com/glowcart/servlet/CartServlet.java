package com.glowcart.servlet;

import com.glowcart.dao.ProductDAO;
import com.glowcart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int productId =
                Integer.parseInt(request.getParameter("productId"));

        ProductDAO dao = new ProductDAO();

        Product product = dao.getProductById(productId);

        HttpSession session = request.getSession();

        List<Product> cart =
                (List<Product>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(product);

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    request.getRequestDispatcher("cart.jsp")
           .forward(request, response);
}
}
