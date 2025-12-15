<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Login & Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f3f4f6; }
        .card { border-radius: 15px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">Shop Ledger</a>
        <span class="navbar-text">Customer Portal</span>
    </div>
</nav>

<div class="container mt-4">

    <!-- LOGIN CARD -->
    <div class="row">
        <div class="col-md-5 mb-4">
            <div class="card shadow">
                <div class="card-body p-4">
                    <h3 class="mb-3 text-center">Customer Login</h3>
                    <p class="text-muted text-center">Enter your Customer ID to view your account.</p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form action="/customer-login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Customer ID</label>
                            <input type="number" name="customerId" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Login / View Dashboard</button>
                    </form>

                    <div class="mt-3 text-center">
                        <a href="/" class="text-decoration-none">← Back to Home</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- DASHBOARD SECTION (VISIBLE AFTER LOGIN) -->
        <c:if test="${not empty summary}">
            <div class="col-md-7 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-success text-white">My Profile & Balance</div>
                    <div class="card-body">
                        <p><b>Name:</b> ${summary.name}</p>
                        <p><b>Phone:</b> ${summary.phone}</p>
                        <p><b>Shop:</b> ${summary.shopName} (ID: ${summary.shopId})</p>
                        <p><b>My Balance:</b>
                            <span class="badge 
                                <c:choose>
                                    <c:when test="${summary.balance > 0}">bg-danger</c:when>
                                    <c:otherwise>bg-success</c:otherwise>
                                </c:choose>">
                                ${summary.balance}
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <!-- TRANSACTIONS + PRODUCTS SECTION -->
    <c:if test="${not empty summary}">
        <div class="row">
            <!-- Transactions -->
            <div class="col-md-7 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-success text-white">My Transactions</div>
                    <div class="card-body p-0">
                        <c:if test="${not empty transactions}">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Type</th>
                                        <th>Product</th>
                                        <th>Qty</th>
                                        <th>Amount</th>
                                        <th>Date/Time</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="t" items="${transactions}">
                                        <tr>
                                            <td>${t.id}</td>
                                            <td>${t.type}</td>
                                            <td><c:out value="${t.productName != null ? t.productName : '-'}"/></td>
                                            <td><c:out value="${t.quantity != null ? t.quantity : '-'}"/></td>
                                            <td>${t.amount}</td>
                                            <td>${t.dateTime}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty transactions}">
                            <p class="p-3 mb-0">No transactions yet.</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Products -->
            <div class="col-md-5 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-secondary text-white">Products in My Shop</div>
                    <div class="card-body p-0">
                        <c:if test="${not empty products}">
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="p" items="${products}">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.name}</td>
                                            <td>${p.price}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty products}">
                            <p class="p-3 mb-0">No products found for this shop.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
