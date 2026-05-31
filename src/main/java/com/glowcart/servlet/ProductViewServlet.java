package com.glowcart.servlet;

import com.glowcart.dao.ProductDAO;
import com.glowcart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductViewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();

        List<Product> productList = dao.getAllProducts();

        request.setAttribute("productList", productList);

        request.getRequestDispatcher("products.jsp")
               .forward(request, response);
    }
}