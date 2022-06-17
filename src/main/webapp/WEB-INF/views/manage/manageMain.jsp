<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		height: 280px;
		line-height: 280px;
		text-align: center;
	}
	.title{
		font-size: 80px;
		font-weight: 900px;
	}
	
	.inner{
		display: inline-block;
		line-height: normal;
	}
	
	html, body, div, span, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, blockquote, p, address, pre, cite, form, fieldset, caption, textarea, input, select, table, th, td, a {
    margin: 0px;
    padding: 0px;
   }  
   


  
</style>
</head>
<body>
	<div id="container">
		<div class="outer">
			<div class="inner"><h1 class="title">GDJ 도서관 통합 관리 시스템</h1></div>	
		</div>
		
		<div id="menu_area">
			<ul class="menu">
				
				<li id="a"><a href="${contextPath}/admin/memberManage">회원관리</a></li>
				<li><a href="${contextPath}/admin/reservationManage" id="b">예약관리</a></li>
				<li><a href="${contextPath}/admin/bookManage" id="c">도서현황관리</a></li>
				<li><a href="${contextPath}/admin/boardsManage" id="d">게시판관리</a></li>
			</ul>
		</div>
		
		
	</div>
	
	
																	
</body>
</html>