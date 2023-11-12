<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/style.css" type="text/css">

</head>
<body>
    <h1 class="text-center">Danh sách khách hàng</h1>
    <div class="container mt-5">
      <div class="separate row fw-bold pb-2">
        <span class="col-4 ">Tên</span>
        <span class="col-3 ">Ngày sinh</span>
        <span class="col-3 ">Địa chỉ</span>
        <span class="col-2">Ảnh</span>
      </div>
     
     <c:forEach var = "i" items="1,4,5,6,7,8,9">
    		Item <c:out value="${i}"/>
	</c:forEach>
	
   	<c:forEach var="customers" items="${customers}">
	  	 <div class="row separate">
	           <span class="col-4 title">${customer.getName}</span>
		       <span class="col-3 title">${customer.getBirthday}</span>
		       <span class="col-3 title">${customer.getAddress}</span>
		       <span class="col-2 ">
		          <img 
		              src="https://th.bing.com/th/id/OIP.55xrJdT3ckz5UX55xcVb7QHaLH?pid=ImgDet&rs=1" 
		              alt="Avatar"
		              class="img"
		            >
		        </span>
	      	</div>
  	</c:forEach>

    </div>
</body>
</html>