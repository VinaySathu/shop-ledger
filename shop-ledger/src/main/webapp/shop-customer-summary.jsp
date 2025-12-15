<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Shop Customer Summary</title>
</head>
<body>

<h2>Shop Customer Summary</h2>

<!-- Form to enter Shop ID -->
<form action="/shop-customer-summary" method="get">
    Shop ID: <input type="text" name="shopId" value="${shopId}"/>
    <input type="submit" value="View Customers">
</form>

<hr/>

<c:if test="${not empty summaries}">
    <h3>Customers for Shop ID: ${shopId}</h3>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Balance</th>
        </tr>
        <c:forEach var="c" items="${summaries}">
            <tr>
                <td>${c.customerId}</td>
                <td>${c.name}</td>
                <td>${c.phone}</td>
                <td>${c.balance}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${empty summaries and not empty shopId}">
    <p>No customers found for this shop.</p>
</c:if>

<br/>
<a href="/">Back to Home</a>

</body>
</html>
