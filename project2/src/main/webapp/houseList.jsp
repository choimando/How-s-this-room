<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때 지도</title>
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
	}
	
	body {
		/* overflow: hidden; */
	}

	#map {
		overflow: hidden;
	}
	
	#contentWrap {
		flex-grow: 1;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		min-width: 1200px;
		max-height: 800px;
		position: relative;
	
	}
	
	.subHeader {
		flex: 0 0 auto;
		display: flex;
		width: 100%;
		height: 64px;
		border-bottom: 1px solid rgb(205,205,205);
		background-color: rgb(255,255,255);
		z-index: 900;
	}
	
	.house_searchWrap {
		flex: 0 0 auto;
		display: flex;
		align-items: center;
		width: 400px;
		height: 100%;
		padding: 0px 20px;
		border-right: 1px solid rgb(231,231,231);
		position: relative;
	
	}
	
	.house_searchForm {
		flex-grow: 1;
		width: 0px;
		height: 36px;
		padding-left: 30px;
		padding-right: 20px;
		background: yellow;
	}
	
	#house_search {
		width: 100%;
		height: 36px;
		padding: 0px;
		border: 0px;
	}
	
	.subContentWrap {
		-webkit-box-flex: 1;
	    flex-grow: 1;
	    display: flex;
	    width: 100%;
	    height: 100%;
	    position: relative;
	}
	
	#mapWrap {
		flex-grow: 1;
		position: relative;
		width: 100%;
		z-index:10;
	}
	
	#listDiv {
		flex: 0 0 auto;
		display: flex;
		flex-direction: column;
		width: 280px;
		max-height: 640px;
		border-right: 1px solid rgb(231,231,231);
		position: relative;
		overflow: scroll;
		background: pink;
		z-index: 20;
	}
	
	.listWrap {
		flex: 0 0 auto;
		display: flex;
		flex-direction: column;
		width: 280px;
		height: 100%;
		border-right: 1px solid rgb(231,231,231);
		position: relative;
		overflow: scroll;
		background: pink;
		z-index: 20;
	}
	
	.house_img {
		flex: 0 0 auto;
	    width: 140px;
	    height: 168px;
	    min-height: 140px;
	    position: relative;
	}
	
	
	/* .mostly-customized-scrollbar {
		display: block;
		width: 280px;
		overflow: auto;
		height: 432px;
	}
	
	/* "대부분 커스터마이징된" 스크롤바
	 * (width/height가 지정되지 않으면 보이지 않음 */
	.mostly-customized-scrollbar::-webkit-scrollbar {
		width: 5px;
		height: 8px;
		background-color: #aaa; /* 또는 트랙에 추가한다 */
		z-index: 30;
	}
	
	/* 썸(thumb) 추가 */
	.mostly-customized-scrollbar::-webkit-scrollbar-thumb {
		background: #000;
		z-index: 30;
	} */
	
	#active {
		color: #F6323E;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12e06872dba1199aee65af50b2693e45"></script>
<!-- 카카오맵 -->
<!-- css 파일 -->
<link rel="stylesheet" href="style.css">
<!-- css 파일 -->
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function(){
		// 각 페이지 맞게 헤더 글씨 색상 변경
		$("#houseListPage").css("color","#F6323E");
		
		$("#topMenu .menu_link").click(function(){
			alert($(this).html());
			
		});
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5553, 126.9215), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		$("#moveSist").click(function(){
			// 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(37.5566, 126.9195);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);     
		    
			// 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        position: moveLatLon
		    });

		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		});
		
		console.log($(document).height());
		
		
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
	
	<main>
		<div id="contentWrap">
			<div class="subHeader">
				<div class="house_searchWrap">
					<form action="" class="house_searchForm">
						<input type="search" id="house_search">
					</form>
					<i class=''></i>
				</div>
			</div>
			
			<div class="subContentWrap">
				<div id="listDiv">
					<div class="listWrap mostly-customized-scrollbar">
						<c:forEach var="h" items="${list }">
							<div class="list">
								${h.house_name }<br>
								${h.type }<br>
								${h.deal_type }<br>
								${h.price }<br>
								${h.loc }<br>
								<img src="images/${h.img_fname }" class="house_img">
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="mapWrap">
					<div id="map" style="width:100%;height:640px;"></div>
				</div>
			</div>
		</div>
	</main>
	
	
	<%-- <c:forEach var="h" items="${list }">
		
		${h.house_name }<br>
		${h.type }<br>
		${h.deal_type }<br>
		${h.price }<br>
		${h.loc }<br>
		<hr>
	</c:forEach> --%>
</body>
</html>