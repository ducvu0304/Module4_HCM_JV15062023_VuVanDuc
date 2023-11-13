<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
    <jsp:forward page="/Product?action=FINDALL"></jsp:forward>
<%--    <jsp:forward page="WEB-INF/views/404.jsp"></jsp:forward>--%>
</body>
</html>