<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GlowCart - Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="navbar navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">✨ GlowCart</a>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card p-5">
                    <h3 class="text-center mb-4" style="color: #db2777;">Create Account 🌸</h3>
                    <form action="RegisterServlet" method="post">
                        <div class="mb-3"><label class="form-label">Username</label><input type="text" class="form-control" name="username" required></div>
                        <div class="mb-3"><label class="form-label">Email</label><input type="email" class="form-control" name="email" required></div>
                        <div class="mb-3"><label class="form-label">Password</label><input type="password" class="form-control" name="password" required></div>
                        <div class="d-grid"><button type="submit" class="btn btn-glow">Register</button></div>
                    </form>
                    <div class="text-center mt-3"><small>Already have an account? <a href="login.jsp" style="color: #db2777;">Login here</a></small></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>