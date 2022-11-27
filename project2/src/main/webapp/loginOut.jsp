<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
</head>
<body>
<script type="text/javascript">
	var logout = sessionStorage.getItem("key");
	sessionStorage.removeItem("key");
	
	if(logout == null){
		
	}else{
		alert("로그아웃되었습니다.");
		location.href = "main.jsp";
	}
	
</script>
	
</body>
</html>