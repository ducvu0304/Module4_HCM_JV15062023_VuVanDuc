
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${images}" var="imgUrl">
    <li>
        <img width="300" src="${imgUrl}" alt="#">
        <a href="${imgUrl}" target="_blank">download</a>
    </li>>
</c:forEach>
</body>
</html>
