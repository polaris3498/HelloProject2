<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="${contextPath}/book/bookPage">책</a><br>
	<a href="${contextPath}/reservation/reservationPage">좌석예약</a><br>
	<a href="${contextPath}/book/bookPage">책</a>
	<a href="${contextPath}/admin/manage">관리자페이지</a>
	
	

	
	
</body>
</html>