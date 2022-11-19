<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때 지도</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="style.css">
<!-- css 파일 -->
<script type="text/javascript">
	$(function(){
		$("#topMenu .menu_link").click(function(){
			//$(".menu_link").removeClass("on_menu_link");
			$(this).addClass("on_menu_link");
			
			
		});
	});

</script>
</head>
<body>
	<header id="main_header">
		<h1><a id="main_link" href="main.jsp">이방어때</a></h1>
		<nav id="topMenu">
			<ul>
				<li><a class="menu_link" id="houseListPage" href="loadHouse.do">지도</a></li>
				<li><a class="menu_link" href="#">관심목록</a></li>
				<li><a class="menu_link" href="#">방내놓기</a></li>
				<li><a class="menu_link" href="#">알림</a></li>
				<li><a class="menu_link" href="#">로그인/회원가입</a></li>
			</ul>
		</nav>
	</header>
	
	<h2>매물목록(지도)페이지입니다.</h2>
	
	<c:forEach var="h" items="${list }">
		
		${h.house_name }<br>
		${h.type }<br>
		${h.deal_type }<br>
		${h.price }<br>
		${h.loc }<br>
		<hr>
	</c:forEach>
</body>
</html>