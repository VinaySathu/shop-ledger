<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Shop Owner Login & Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f3f4f6; }
        .card { border-radius: 15px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">Shop Ledger</a>
        <span class="navbar-text">Shop Owner Portal</span>
    </div>
</nav>

<div class="container mt-4">

    <div class="row">
        <!-- LOGIN CARD -->
        <div class="col-md-4 mb-4">
            <div class="card shadow">
                <div class="card-body p-4">
                    <h3 class="mb-3 text-center">Shop Owner Login</h3>
                    <p class="text-muted text-center">Enter your Shop ID to view your dashboard.</p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form action="/shop-login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Shop ID</label>
                            <input type="number" name="shopId" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Login / View Dashboard</button>
                    </form>

                    <div class="mt-3 text-center">
                        <a href="/" class="text-decoration-none">← Back to Home</a>
                    </div>

                    <hr>
                    <div class="text-center">
                        <a href="/add-shop" class="btn btn-outline-light btn-sm bg-primary">
                            ➕ Create New Shop
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- DASHBOARD SECTION (AFTER LOGIN) -->
        <c:if test="${not empty shop}">
            <div class="col-md-8 mb-4">
                <!-- Shop Info + Quick Actions -->
                <div class="card mb-3 shadow-sm">
                    <div class="card-body">
                        <h4 class="mb-1">Shop: ${shop.name}</h4>
                        <p class="mb-1"><b>Owner:</b> ${shop.ownerName}</p>
                        <p class="mb-2"><b>Phone:</b> ${shop.phone}</p>
                        <p class="mb-2"><b>Shop ID:</b> ${shopId}</p>

                        <div class="mt-2">
                            <a href="/add-customer?shopId=${shopId}" class="btn btn-sm btn-outline-primary me-2">
                                👥 Add Customer
                            </a>
                            <a href="/add-product?shopId=${shopId}" class="btn btn-sm btn-outline-secondary me-2">
                                🛒 Add Product
                            </a>
                            <a href="/customer-transactions?shopId=${shopId}" class="btn btn-sm btn-outline-success">
                                💳 Add Purchase / Payment
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Customers Table -->
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        Customers & Balances
                    </div>
                    <div class="card-body p-0">
                        <c:if test="${not empty summaries}">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Customer ID</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th class="text-end">Balance</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="c" items="${summaries}">
                                        <tr>
                                            <td>${c.customerId}</td>
                                            <td>${c.name}</td>
                                            <td>${c.phone}</td>
                                            <td class="text-end">
                                                <span class="badge
                                                    <c:choose>
                                                        <c:when test="${c.balance > 0}">bg-danger</c:when>
                                                        <c:otherwise>bg-success</c:otherwise>
                                                    </c:choose>">
                                                    ${c.balance}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="/customer-transactions?shopId=${shopId}&customerId=${c.customerId}"
                                                   class="btn btn-sm btn-outline-primary">
                                                    💳 Add Txn
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty summaries}">
                            <p class="p-3 mb-0">No customers found for this shop yet.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
