<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Shop Owner Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/">Shop Ledger</a>
        <span class="navbar-text">Shop Owner Dashboard</span>
    </div>
</nav>

<div class="container mt-4">

    <div class="card mb-4">
        <div class="card-body">
            <h4 class="card-title">Select Shop</h4>
            <form action="/shop-dashboard" method="get" class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="shopId" class="col-form-label">Shop ID:</label>
                </div>
                <div class="col-auto">
                    <input type="text" id="shopId" name="shopId" class="form-control" value="${shopId}">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Load Customers</button>
                </div>
            </form>
            <small class="text-muted d-block mt-2">
                Enter your Shop ID to see all customers and their balances.
            </small>
        </div>
    </div>

    <!-- === SHOP ACTION BUTTONS ROW (You requested this) === -->
    <c:if test="${not empty shopId}">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Shop ID: ${shopId}</h4>
            <div>
                <a href="/add-customer?shopId=${shopId}" class="btn btn-sm btn-outline-primary me-2">
                    ➕ Add Customer
                </a>
                <a href="/add-product?shopId=${shopId}" class="btn btn-sm btn-outline-secondary me-2">
                    🛒 Add Product
                </a>
                <a href="/customer-transactions?shopId=${shopId}" class="btn btn-sm btn-outline-success">
                    💳 Add Purchase / Payment
                </a>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty summaries}">
        <div class="card">
            <div class="card-header bg-primary text-white">
                Customers for Shop ID: ${shopId}
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover mb-0">

                        <!-- === UPDATED THEAD (You requested this) === -->
                        <thead class="table-light">
                        <tr>
                            <th>Customer ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th class="text-end">Balance to Pay</th>
                            <th>Actions</th>
                        </tr>
                        </thead>

                        <!-- === UPDATED TBODY (You requested this) === -->
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
                                        Add Purchase / Payment
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${empty summaries and not empty shopId}">
        <div class="alert alert-warning mt-3">
            No customers found for Shop ID: <b>${shopId}</b>
        </div>
    </c:if>

    <div class="mt-3">
        <a href="/" class="btn btn-outline-secondary btn-sm">← Back to Home</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
