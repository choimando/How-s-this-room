<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${re > 0 }">
		<script type="text/javascript">
			var key = "${id}";
			sessionStorage.removeItem("key");
			sessionStorage.setItem("key",key);
			alert("로그인 성공");
			location.href = "main.jsp";
			
		</script>
		
	</c:if>
	<c:if test="${re <= 0 }">
		<script type="text/javascript">
			alert("비밀번호를 확인하세요");
			location.href = "login.jsp";
		</script>
	</c:if>
</body>
</html>
