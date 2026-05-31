<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GlowCart - Products</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            background-color: #fdf4f7;
            font-family: Arial, sans-serif;
        }

        .navbar-brand {
            font-size: 28px;
            font-weight: bold;
            color: #ff4f8b !important;
        }

        .btn-glow {
            background-color: #ff4f8b;
            color: white;
            border: none;
        }

        .btn-glow:hover {
            background-color: #e63c76;
            color: white;
        }

        .product-card {
            transition: 0.3s;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .product-image {
            height: 280px;
            object-fit: cover;
        }

        .price {
            color: #ff4f8b;
            font-weight: bold;
            font-size: 20px;
        }

        .section-title {
            font-weight: bold;
            margin-bottom: 40px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">

        <a class="navbar-brand" href="index.jsp">
            ✨ GlowCart
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="products">
                        Products
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="cart">
                        Cart 🛒
                    </a>
                </li>

                <li class="nav-item">
                    <a class="btn btn-glow ms-2" href="login.jsp">
                        Login
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- Product Section -->
<div class="container mt-5 mb-5">

    <h1 class="text-center section-title">
        Our Beauty Collection
    </h1>

    <div class="row">
        
        <c:forEach items="${productList}" var="p">

            <div class="col-md-4 col-lg-3 mb-4">

                <div class="card product-card h-100 shadow-sm">

                    <!-- Product Image -->
                    <img src="${p.imageUrl}"
                         alt="${p.name}"
                         class="card-img-top product-image">

                    <!-- Product Details -->
                    <div class="card-body text-center">

                        <h5 class="card-title">
                            ${p.name}
                        </h5>

                        <p class="card-text text-muted">
                            ${p.description}
                        </p>

                        <p class="price">
                            ₹${p.price}
                        </p>

                        <!-- Add to Cart -->
                        <form action="cart" method="post">

                            <input type="hidden"
                                   name="productId"
                                   value="${p.id}">
                        
                            <button type="submit"
                                    class="btn btn-glow w-100">
                        
                                Add to Cart 🛒
                        
                            </button>
                        
                        </form>

                    </div>
                </div>
            </div>

        </c:forEach>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>