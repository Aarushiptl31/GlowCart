<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*,com.glowcart.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GlowCart - Cart</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body>

<div class="container mt-5">

    <h2>Your Cart 🛒</h2>

    <table class="table table-bordered mt-4">

        <tr>
            <th>Product</th>
            <th>Price</th>
        </tr>

        <%
            List<Product> cart =
                (List<Product>) session.getAttribute("cart");

            double total = 0;

            if(cart != null){

                for(Product p : cart){
                    total += p.getPrice();
        %>

        <tr>
            <td><%= p.getName() %></td>
            <td>₹<%= p.getPrice() %></td>
        </tr>

        <%
                }
            }
        %>

        <tr>
            <th>Total</th>
            <th>₹<%= total %></th>
        </tr>

    </table>

</div>

</body>
</html>