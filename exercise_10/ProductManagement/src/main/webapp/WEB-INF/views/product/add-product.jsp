
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
    <h1 class="text-center">Thêm mới sản phẩm</h1>
    <div class="container">
        <form action="<%=request.getContextPath()%>/Product" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" placeholder="Price" name="price">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" rows="3" name="description"></textarea>
            </div>

            <input class="btn btn-success" type="submit" value="ADD" name="action">
        </form>
    </div>

</body>
</html>
