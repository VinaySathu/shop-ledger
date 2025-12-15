<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/">Shop Ledger</a>
        <span class="navbar-text">Add Customer</span>
    </div>
</nav>

<div class="container mt-4">

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title mb-3">Add New Customer</h3>

                    <form action="/add-customer" method="post">
                        <div class="mb-3">
                            <label class="form-label">Shop ID</label>
                            <input type="text" name="shopId" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Customer Name</label>
                            <input type="text" name="name" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input type="text" name="phone" class="form-control">
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Save Customer</button>
                    </form>

                    <c:if test="${not empty message}">
                        <div class="alert alert-success mt-3">
                            ${message}
                        </div>
                    </c:if>

                    <a href="/" class="btn btn-link mt-2">← Back to Home</a>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
