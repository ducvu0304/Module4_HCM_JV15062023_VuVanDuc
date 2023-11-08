<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="calculate" method="post">
    <label for="description">Product Description:</label>
    <input type="text" id="description" name="description"><br>

    <label for="listPrice">List Price:</label>
    <input type="number" min=0 id="listPrice" name="listPrice" required><br>

    <label for="discountPercent">Discount Percent:</label>
    <input type="number" min=0 id="discountPercent" name="discountPercent" required><br>

    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>