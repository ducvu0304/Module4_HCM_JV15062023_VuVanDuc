<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
<h1>Update Product</h1>
<form action="<%=request.getContextPath()%>/Product" method="post">
    <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text"  value="${product.name}" class="form-control" id="name" name="name">
    </div>
    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <input type="text" class="form-control"  value="${product.description}" id="description" placeholder="Description" name="description">
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Price</label>
        <input type="text" class="form-control"  value="${product.price}" id="price" placeholder="Price" name="price">
    </div>
    <div class="mb-3">
        <label for="img" class="form-label">Avatar</label>
        <div>
            <img width="200" height="200" style="object-fit: cover"  src="${product.img}" alt="#" id="img">
        </div>
    </div>

    <input class="btn btn-success" type="submit" value="UPDATE" name="action">
</form>
</body>
</html>
