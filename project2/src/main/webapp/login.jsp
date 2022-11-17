<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.nav{
	height: 90px;
	border-bottom: 1px solid gray;
	display: flex;
	align-items: center;
	}
	.sitename{
		margin-left: 50px;
		font-size: 30px;
		font-family: 'Jalnan';
		color: #F6323E;
		
	}
	.menu{
		display: flex;
		margin-left: auto;
		margin-right: 50px;
	}
	.menubar{
		margin-right: 30px;
		margin-left: 50px;
		font-size: 15px;
	}
	
	section{
		margin: 0;
	}
	#login{
		margin-top: 5px;
		margin-bottom: 20px;
		font-size: 20px;
	}
	.loginbox{
		width: 300px;
		margin-right: auto;
		margin-left: auto;
		margin-top: 150px;
		padding: 20px;
		text-align: center;
		border: 1px solid gray; 
	}
	.text-field{
		font-size: 14px;
		padding: 10px;
		border: 0.5px solid gray;
		width: 260px;
		margin-bottom: 10px;
	}	
	.loginbtn{
		font-size: 14px;
		border: none;
		padding: 10px;
		width: 260px;
		margin-top: 20px;
		margin-bottom: 30px;
	
	}
</style>
</head>
<body>
	<header class="nav">
		<div class="sitename">이방어때</div>
		<div class="menu"> 
			<div class="menubar" href="#">지도</div>
			<div class="menubar" href="#">관심목록</div>
			<div class="menubar" href="#">방내놓기</div>
			<div class="menubar" href="#">알림</div>
			<div class="menubar" href="#">로그인/회원가입</div>
		</div>
	</header>
	<section>
		<div class="loginbox">
		<form>
			<div id="login">LOGIN</div>
			<input type="text" name="id" class="text-field" placeholder="아이디">	
			<input type="password" name="pwd" class="text-field" placeholder="비밀번호">
			<input type="submit" value="로그인" class="loginbtn">	
		</form>	
		</div>
	</section>	
</body>
</html>