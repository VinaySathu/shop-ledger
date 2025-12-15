<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Shop | Shop Ledger</title>
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
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">Shop Ledger</a>
        <span class="navbar-text text-white">Add Shop</span>
    </div>
</nav>

<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body p-4">

                    <h3 class="page-title mb-3 text-center">Add New Shop</h3>
                    <p class="text-muted text-center mb-4">
                        Enter your shop details to start managing customers and products.
                    </p>

                    <!-- Success Message -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-success text-center">
                            ${message}
                        </div>
                    </c:if>

                    <!-- Add Shop Form -->
                    <form action="${pageContext.request.contextPath}/add-shop" method="post">

                        <div class="mb-3">
                            <label class="form-label">Shop Name</label>
                            <input type="text" name="name" class="form-control" placeholder="e.g., Vinay Super Market" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Owner Name</label>
                            <input type="text" name="ownerName" class="form-control" placeholder="e.g., Vinay Sathu" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input type="text" name="phone" class="form-control" placeholder="e.g., 9876543210" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            ➕ Add Shop
                        </button>
                    </form>

                    <div class="mt-3 text-center">
                        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary btn-sm">
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
