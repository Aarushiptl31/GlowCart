package com.glowcart.servlet;

import com.glowcart.dao.CartDAO;
import com.glowcart.dao.ProductDAO;
import com.glowcart.model.Cart;
import com.glowcart.model.CartItemInfo;
import com.glowcart.model.Product;
import com.glowcart.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view-cart")
public class CartViewServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Cart> cartItems = cartDAO.getCartByUserId(user.getId());
        List<CartItemInfo> cartInfoList = new ArrayList<>();
        double totalPrice = 0;

        for (Cart item : cartItems) {
            Product p = productDAO.getProductById(item.getProductId());
            CartItemInfo info = new CartItemInfo(item.getId(), p.getName(), p.getPrice(), p.getImageUrl(), item.getQuantity());
            cartInfoList.add(info);
            totalPrice += (p.getPrice() * item.getQuantity());
        }

        request.setAttribute("cartInfoList", cartInfoList);
        request.setAttribute("totalPrice", totalPrice);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }
}