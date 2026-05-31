<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GlowCart - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">✨ GlowCart Admin</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="products">View Store</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger text-white ms-2" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5 mb-5">
        <h2 class="mb-4">Admin Dashboard 📊</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card p-4">
                    <h4 class="mb-3">Add New Product</h4>
                    <form action="ProductServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Product Name</label>
                            <input type="text" class="form-control" name="name" required placeholder="e.g., Rose Blush">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <input type="text" class="form-control" name="category" required placeholder="e.g., Makeup">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price ($)</label>
                            <input type="number" step="0.01" class="form-control" name="price" required placeholder="e.g., 24.99">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Image URL</label>
                            <input type="url" class="form-control" name="imageUrl" required placeholder="https://...">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Stock Quantity</label>
                            <input type="number" class="form-control" name="stock" required placeholder="e.g., 50">
                        </div>
                        <input type="hidden" name="action" value="add">
                        <button type="submit" class="btn btn-glow w-100">Add Product</button>
                    </form>
                </div>
            </div>

            <div class="col-md-8 mb-4">
                <div class="card p-4">
                    <h4 class="mb-3">Current Products</h4>
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Stock</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productList}" var="p">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.name}</td>
                                    <td>${p.category}</td>
                                    <td>$${p.price}</td>
                                    <td>${p.stock}</td>
                                    <td>
                                        <form action="ProductServlet" method="post">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="productId" value="${p.id}">
                                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>