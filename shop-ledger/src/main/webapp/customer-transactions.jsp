<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Purchase & Payment | Shop Ledger</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background: #eef1f4; }
        .card { border-radius: 15px; }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">Shop Ledger</a>
        <span class="navbar-text text-white">Purchase & Payment</span>
    </div>
</nav>

<div class="container mt-4">

    <!-- SUCCESS / ERROR MESSAGE -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <!-- BALANCE -->
    <c:if test="${not empty balance}">
        <div class="alert alert-info">
            Current Balance: <b>${balance}</b>
        </div>
    </c:if>

    <!-- SHOP & CUSTOMER SELECTION -->
    <div class="card shadow mb-4">
        <div class="card-header bg-secondary text-white fw-bold">
            Select Shop & Customer
        </div>
        <div class="card-body">
            <form action="/customer-transactions" method="get" class="row g-3 align-items-end">

                <div class="col-md-4">
                    <label class="form-label">Shop ID</label>
                    <input type="number" name="shopId" class="form-control"
                           value="${shopId}" required>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Customer ID</label>
                    <input type="number" name="customerId" class="form-control"
                           value="${customerId}" required>
                </div>

                <div class="col-md-4">
                    <button type="submit" class="btn btn-secondary w-100">
                        Load Products & Balance
                    </button>
                </div>

            </form>
            <small class="text-muted d-block mt-2">
                Enter Shop ID & Customer ID, then click "Load Products & Balance".
            </small>
        </div>
    </div>

    <!-- ONLY SHOW FORMS WHEN WE HAVE SHOP, CUSTOMER & PRODUCTS -->
    <c:if test="${not empty shopId && not empty customerId && not empty products}">

        <div class="row">

            <!-- PURCHASE FORM -->
            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white fw-bold">
                        Add Customer Purchase
                    </div>

                    <div class="card-body">

                        <form action="/customer-purchase" method="post">

                            <!-- Hidden IDs -->
                            <input type="hidden" name="shopId" value="${shopId}">
                            <input type="hidden" name="customerId" value="${customerId}">

                            <!-- Product Select -->
                            <div class="mb-3">
                                <label class="form-label">Select Product</label>
                                <select id="productSelect" name="productId" class="form-control" required>
                                    <option value="">-- Select Product --</option>

                                    <c:forEach var="p" items="${products}">
                                        <option value="${p.id}" data-price="${p.price}">
                                            ${p.name} - ₹${p.price}
                                        </option>
                                    </c:forEach>

                                </select>
                            </div>

                            <!-- Product Price -->
                            <div class="mb-3">
                                <label class="form-label">Price</label>
                                <input type="text" id="productPrice" class="form-control" readonly>
                            </div>

                            <!-- Quantity -->
                            <div class="mb-3">
                                <label class="form-label">Quantity</label>
                                <input type="number" id="quantity" name="quantity"
                                       class="form-control" min="1" required>
                            </div>

                            <!-- Total Amount -->
                            <div class="mb-3">
                                <label class="form-label">Total Amount</label>
                                <input type="text" id="totalAmount" class="form-control" readonly>
                            </div>

                            <button class="btn btn-primary w-100">Save Purchase</button>

                        </form>

                    </div>
                </div>
            </div>

            <!-- PAYMENT FORM -->
            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-header bg-success text-white fw-bold">
                        Add Payment
                    </div>

                    <div class="card-body">

                        <form action="/customer-payment" method="post">
                            <input type="hidden" name="shopId" value="${shopId}">
                            <input type="hidden" name="customerId" value="${customerId}">

                            <div class="mb-3">
                                <label class="form-label">Amount Paid</label>
                                <input type="number" name="amount" class="form-control" required>
                            </div>

                            <button class="btn btn-success w-100">Save Payment</button>
                        </form>

                    </div>
                </div>
            </div>

        </div>

    </c:if>

    <!-- If products are empty but IDs present -->
    <c:if test="${not empty shopId && empty products}">
        <div class="alert alert-warning">
            No products found for Shop ID: <b>${shopId}</b>.  
            Please add products first from <a href="/add-product" class="alert-link">Add Product</a>.
        </div>
    </c:if>

    <a href="/" class="btn btn-outline-secondary mt-2">← Back to Home</a>

</div>

<!-- AUTO PRICE & TOTAL LOGIC -->
<script>
    const productSelect = document.getElementById("productSelect");
    const productPrice = document.getElementById("productPrice");
    const quantityInput = document.getElementById("quantity");
    const totalAmount = document.getElementById("totalAmount");

    if (productSelect) {
        productSelect.addEventListener("change", function () {
            let price = this.options[this.selectedIndex].getAttribute("data-price");
            productPrice.value = price ? price : "";
            calculateTotal();
        });
    }

    if (quantityInput) {
        quantityInput.addEventListener("input", calculateTotal);
    }

    function calculateTotal() {
        let price = parseFloat(productPrice.value);
        let qty = parseInt(quantityInput.value);

        if (!isNaN(price) && !isNaN(qty)) {
            totalAmount.value = (price * qty).toFixed(2);
        } else {
            totalAmount.value = "";
        }
    }
</script>

</body>
</html>
