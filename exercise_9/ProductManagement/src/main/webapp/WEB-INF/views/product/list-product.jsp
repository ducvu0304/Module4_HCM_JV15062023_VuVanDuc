<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
    <h1>Danh sách khách hàng</h1>
    <table class="table">
        <thead>
        <tr class="">
            <th scope="col">STT</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Image</th>
            <th scope="col">Description</th>
            <th scope="col" colspan="3">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="c" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${c.name}</td>
                <td>${c.price}</td>
                <td><img width="100" height="100" style="object-fit: cover" src="${c.img}" alt="${c.name}"></td>
                <td>${c.description?"Nam":"Nữ"}</td>
                <td><a href="<%=request.getContextPath()%>/CustomerController?action=DETAIL&id=${c.id}" class="btn btn-info">Detail</a></td>
                <td><a href="<%=request.getContextPath()%>/CustomerController?action=EDIT&id=${c.id}" class="btn btn-warning">Edit</a></td>
                <td><a href="<%=request.getContextPath()%>/CustomerController?action=DELETE&id=${c.id}" onclick="return confirm('Bạn có chắc muốn xóa không?')" class="btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</body>
</html>
