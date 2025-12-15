<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Product | Shop Ledger</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f3f4f6;
        }
        .card {
            border-radius: 15px;
        }
        .page-title {
            font-weight: 600;
            color: #0d6efd;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">Shop Ledger</a>
        <span class="navbar-text text-white">Add Product</span>
    </div>
</nav>

<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-body p-4">

                    <h3 class="page-title mb-3 text-center">Add New Product</h3>
                    <p class="text-muted text-center mb-4">
                        Enter product details to add it to your shop inventory.
                    </p>

                    <!-- SUCCESS MESSAGE -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-success text-center">
                            ${message}
                        </div>
                    </c:if>

                    <!-- FORM -->
                    <form action="/add-product" method="post">

                        <!-- Shop ID -->
                        <div class="mb-3">
                            <label class="form-label">Shop ID</label>
                            <input type="text" name="shopId" class="form-control" placeholder="Enter Shop ID" required>
                        </div>

                        <!-- Product Name -->
                        <div class="mb-3">
                            <label class="form-label">Product Name</label>
                            <input type="text" name="name" class="form-control" placeholder="e.g., Sugar, Milk, Rice" required>
                        </div>

                        <!-- Price -->
                        <div class="mb-3">
                            <label class="form-label">Price (₹)</label>
                            <input type="text" name="price" class="form-control" placeholder="e.g., 120" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            ➕ Add Product
                        </button>
                    </form>

                    <div class="text-center mt-3">
                        <a href="/" class="btn btn-outline-secondary btn-sm">
                            ← Back to Home
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
