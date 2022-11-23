<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때 지도</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- 카카오맵 API + services 라이브러리 추가 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12e06872dba1199aee65af50b2693e45&libraries=services"></script>
<!-- 카카오맵 -->
<!-- css 파일 -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="houseList_style.css">
<!-- css 파일 -->
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<!-- 화살표, 검색 버튼 아이콘 제공 태그 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script type="text/javascript">
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5553, 126.9215), // 지도의 중심좌표 - 홍대입구역
	        level: 3 // 지도의 확대 레벨
	    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var markerImage = new kakao.maps.MarkerImage("images/marker.png",new kakao.maps.Size(60, 60),{offset: new kakao.maps.Point(27, 69)});
		// 마커를 생성하고 지도위에 표시하는 함수
		function addMarker(position) {
			
		    // 마커를 생성
		    var marker = new kakao.maps.Marker({
		        position: position,
		        image: markerImage
		    });

		    // 마커가 지도 위에 표시되도록 설정
		    marker.setMap(map);
		    
		    // 생성된 마커를 배열에 추가
		    markers.push(marker);
		}

		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
		var markers = [];
		var positions = [];
		
		// 각 페이지 맞게 헤더 글씨 색상 변경
		$("#houseListPage").css("color","#F6323E");
		
		$.ajax({
			url:"RecommendHouse",
			success:function(arr){
				// markers 비워주기
				for(i=0; i<markers.length; i++){
					markers[i].setMap(null);
				}
				markers = [];
				
				$.each(arr,function(){
					console.log(this);
					
					// 마커 하나를 지도위에 표시합니다 
					addMarker(new kakao.maps.LatLng(this.lat, this.lng));
					
				});
				
				setMarkers(map);
				
				}
		}); 
		
		// 검색
		$("#map_searchBtn").click(function(e){
			var searchWord = $("#house_search").val(); 
			console.log(searchWord);
					
			$.ajax({
				url:"SearchHouse",
				data:{searchWord:searchWord},
				success:function(arr){
					$(".list").css("display","none");
					
					// markers 비워주기
					for(i=0; i<markers.length; i++){
						markers[i].setMap(null);
					}
					markers = [];
					
					$.each(arr,function(){
						console.log(this);
						var div1 = $("<div></div>").addClass("list");
						var div2 = $("<div></div>").addClass("innerList");
						var img = $("<img>").addClass("house_img").attr("src","images/"+this.img_fname);
						var div3 = $("<div></div>").addClass("house_info");
						var h3 = $("<h3></h3>").html(this.house_name).addClass("house_info_name");
						var p1 = $("<p></p>").html(this.type).addClass("house_info_type");
						var p2 = $("<p></p>").html(this.deal_type+" "+this.deposit+"/"+this.price).addClass("house_info_price");
						var p3 = $("<p></p>").html(this.area+"평 "+this.floor+"층").addClass("house_info_area");
						$(div3).append(h3,p1,p2,p3);
						$(div2).append(img,div3);
						$(div1).append(div2);
						$(".listWrap").append(div1);
						
						// 마커 하나를 지도위에 표시합니다 
						addMarker(new kakao.maps.LatLng(this.lat, this.lng));
						
					});
					
					setMarkers(map);
					
					}
			}); 
			
			e.preventDefault();
		});
		
		console.log($(document).height()); 
		
		$(window).scroll(function(){
			console.log($(window).scrollTop()); 
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
	
	<main>
		<div id="contentWrap">
			<div class="subHeader">
				<div class="house_searchWrap">
					<form action="" class="house_searchForm" id="searchForm">
						<input type="search" id="house_search" placeholder="지역명을 입력해주세요">
					</form>
					<button type="submit" id="map_searchBtn" class="btn red rounded">검색</button>
				</div>
			</div>
			
			<div class="subContentWrap">
				<div id="listDiv" class="mostly-customized-scrollbar">
					<div class="listWrap">
						<c:forEach var="h" items="${list }">
							<div class="list">
								<div class="innerList">
									<img src="images/${h.img_fname }" class="house_img">
									<div class="house_info">
										<h3 class="house_info_name">${h.house_name }</h3>
										<p class="house_info_type">${h.type }</p>
										<p class="house_info_price">${h.deal_type } ${h.deposit }/${h.price }</p>
										<p class="house_info_area">${h.area}평 ${h.floor }층</p>										
									</div>
								</div>
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
</body>
</html>