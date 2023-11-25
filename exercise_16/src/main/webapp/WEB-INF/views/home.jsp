<%@ page import="com.exercise_16.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DUC
  Date: 11/25/2023
  Time: 12:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>CHào mừng<%=((User)session.getAttribute("user_login")).getFullName()%> quay trở lại trang web!</h1>

</body>
</html>
