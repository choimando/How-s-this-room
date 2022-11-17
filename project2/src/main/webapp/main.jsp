<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때</title>
<style type="text/css">
	* {
		padding: 0;
		margin: 0;
	}

	#main_header {
		/* position:fixed; */
		height: 80px;
		padding: 1rem;
		font-weight: bold;
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;


	}
	
	#main_header h1 {
		color: #F6323E;
		font-family: 'Jalnan';
		margin-left: 50px;
	}

	#topMenu {
		height: 30px;
		width: 800px;
	}
	
	#topMenu ul li {
		list-style: none;
		float : left;
		text-align: center;
		align-items: center;
		line-height: 30px;
		vertical-align: middle;  
	} 
	
	#topMenu .menu_link {
		text-decoration: none;
		display: block;
		width: 150px;
		color: gray;
	}
	
	#topMenu .menu_link:hover {
		color: #F6323E;
	} 
	
	#main_body {
		background: #F6323E;
		height: 500px;
		width: 100%;
		padding-top: 100px;
		
	}
	
	#searchBox {
		display: inline;
		
		text-align: center;
		width: 600px;
	}
	#search{
		width: 600px;
		text-align: center;
	}
</style>
</head>
<body>
	<header id="main_header">
		<h1>이방어때</h1>
		<nav id="topMenu">
			<ul>
				<li><a class="menu_link" href="#">지도</a></li>
				<li><a class="menu_link" href="#">관심목록</a></li>
				<li><a class="menu_link" href="#">방내놓기</a></li>
				<li><a class="menu_link" href="#">알림</a></li>
				<li><a class="menu_link" href="#">로그인/회원가입</a></li>
			</ul>
		</nav>
	</header>
	
	<main>
		<div id="main_body">
			<div id="searchBox" class="form-group" class="form-control" placeholder="Default form control">
				<input type="text" name="search" id="search">
				<input type="submit" name="" value="검색">
			</div>
			
		</div>
	
	</main>
	
	<footer>
	
	</footer>
</body>
</html>