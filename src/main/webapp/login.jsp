<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GlowCart - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <nav class="navbar navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">✨ GlowCart</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card p-5">
                    <h3 class="text-center mb-4" style="color: #db2777;">Welcome Back!</h3>
                    <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input type="email" class="form-control" name="email" required placeholder="you@example.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" required placeholder="Enter password">
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-glow">Login</button>
                        </div>
                    </form>
                    <div class="text-center mt-3">
                        <small>New here? <a href="register.jsp" style="color: #db2777;">Create an account</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>