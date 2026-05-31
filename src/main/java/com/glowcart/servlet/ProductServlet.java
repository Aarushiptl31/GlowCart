package com.glowcart.servlet;

import com.glowcart.dao.ProductDAO;
import com.glowcart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Add Product Logic
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            String imageUrl = request.getParameter("imageUrl");
            int stock = Integer.parseInt(request.getParameter("stock"));

            Product product = new Product();
            product.setName(name);
            product.setPrice(price);
            product.setDescription(request.getParameter("description"));
            product.setImageUrl(imageUrl);
            

            productDAO.saveProduct(product);
            response.sendRedirect("admin.jsp?msg=added");

        } else if ("delete".equals(action)) {
            // Delete Product Logic
            int productId = Integer.parseInt(request.getParameter("productId"));
            productDAO.deleteProduct(productId);
            response.sendRedirect("admin.jsp?msg=deleted");
        }
    }
}