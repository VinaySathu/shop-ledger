<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop Ledger | Home</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #0d6efd 0%, #6610f2 100%);
            min-height: 100vh;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .card {
            border-radius: 15px;
        }
        .section-title-owner {
            font-weight: bold;
            color: #0d6efd;
        }
        .section-title-customer {
            font-weight: bold;
            color: #198754;
        }
        .muted-links a {
            font-size: 0.85rem;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-transparent mt-2">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">Shop Ledger</a>
    </div>
</nav>

<!-- MAIN CONTENT -->
<div class="container d-flex align-items-center justify-content-center" style="min-height: 85vh;">
    <div class="row w-100">
        <div class="col-lg-8 offset-lg-2">
            <div class="card shadow-lg p-4">
                <h2 class="text-center mb-3">Welcome to Shop Ledger</h2>
                <p class="text-center text-muted mb-4">
                    Simple ledger system for shops and customers: track purchases, payments, and balances.
                </p>

                <div class="row">

                    <!-- SHOP OWNER SECTION -->
                    <div class="col-md-6 mb-4">
                        <h4 class="section-title-owner">👨‍💼 Shop Owner Portal</h4>

                        <div class="list-group mb-2">
                            <!-- MAIN ENTRY -->
                            <a href="shop-login" class="list-group-item list-group-item-action">
                                🔐 Shop Login & Dashboard
                            </a>
                        </div>

                        <!-- Optional direct links (for you as developer) -->
                        <div class="muted-links">
                            <span class="text-light-50 fw-semibold">Developer shortcuts:</span>
                            <div class="list-group mt-1">
                                <a href="add-shop" class="list-group-item list-group-item-action">
                                    ➕ Create New Shop
                                </a>
                                <a href="add-customer" class="list-group-item list-group-item-action">
                                    👥 Add Customer (manual shopId)
                                </a>
                                <a href="add-product" class="list-group-item list-group-item-action">
                                    🛒 Add Product (manual shopId)
                                </a>
                                <a href="customer-transactions" class="list-group-item list-group-item-action">
                                    💳 Add Purchase / Payment (manual shopId/customerId)
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- CUSTOMER SECTION -->
                    <div class="col-md-6 mb-4">
                        <h4 class="section-title-customer">👤 Customer Portal</h4>

                        <div class="list-group mb-2">
                            <!-- MAIN ENTRY -->
                            <a href="customer-login" class="list-group-item list-group-item-action">
                                🔐 Customer Login & Dashboard
                            </a>
                        </div>

                        <div class="alert alert-info mt-2 mb-0">
                            <small>
                                Ask your shop owner for your <b>Customer ID</b> to see your balance,
                                purchases, and available products.
                            </small>
                        </div>
                    </div>

                </div>

                <div class="text-center mt-4">
                    <small class="text-muted">© 2025 Shop Ledger System</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
