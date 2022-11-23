<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때 지도</title>
	<!-- jquery ui -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css">
	
   #map {
      overflow: hidden;
      left: 390px;
   }
   
   #content {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      min-width: 1200px;
      min-height: 100%;
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
 
 	.selectbar{
 		display: flex;
 		width:100%;
 		background-color: rgb(255,255,255);
 		padding-bottom: 20px;
 		
 		
 	}
   
   .house_searchWrap {
      flex: 0 0 auto;
      display: flex;
      align-items: center;
      width: 280px;
      height: 100%;
      padding-right:5px;
      border-right: 1px solid rgb(231,231,231);
      position: relative;
      
   
   }
   
   .house_searchForm {
      flex-grow: 1;
      width: 15px;
      height: 36px;
      padding-left: 20px;
      padding-right: 20px;
      background: white;
   }
   
   
   #house_search {
   	  position: absolute;
      width: 180px;
      line-height:37px;
      height: 37px;
      padding: 0px;
      margin:0px;
      border: 0.5px solid gray;
      background: #ffffff;
      
      
   }
   
   #searchBtn_map{
   	position : relative; 
   	width: 50px;
   	height: 36.5px;
   	top : 0.5px;
   	outline: none;
   	font-size: 13px;
   	margin-left:180px;
   	border:0.5px solid gray;
   	background-color: white;
   	
   	
   }
   
   #mapWrap {
   	  flex-grow: 1;
      position: relative;
      z-index:10;
      
   }
 	.houseType{
 		padding-top:20px; 
 		margin-left: 20px;
 		margin-right: 15px;
 	}
 	.Deal_type{
 		padding-top:20px; 
 		margin-right: 15px;
 	}
 	.houseMgr{
 		padding-top:20px; 
 		margin-right: 15px;
 	}
 	.houseSize{
 		position:fixed;
 		padding-top:20px; 
 		margin-left: 240px;
 	}
   #Mgrbox{
 		width:400px;
 		margin: 20px auto;
 		padding: 50px;
 		border: 0.5px solid gray;
 		border-radius: 5px;
 		display: none;
 		background-color: white;
 		
 	}
 	#SizeBox{
 		width:400px;
 		margin: 20px auto;
 		padding: 50px;
 		border: 0.5px solid gray;
 		border-radius: 5px;
 		display: none;
 		background-color: white;
 	}
 	#amout
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a5cf52627f9a5e2c09d99c49b380499"></script>
<!-- 카카오맵 -->
<!-- css 파일 -->
<link rel="stylesheet" href="style.css">
<!-- css 파일 -->
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
   $(function(){
      $("#topMenu .menu_link").click(function(){
         alert($(this).html());
         
      });
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = { 
           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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
      
 	// 관리비 클릭시 관리비 슬라이더 바 
	$("#houseMgr_select").click(function(){
		$("#Mgrbox").toggle();
	      $( "#slider-range" ).slider({
	          range: true,
	          min: 0,
	          max: 300000,
	          values: [ 0, 100000 ],
	          slide: function( event, ui ) {
	            $( "#amount" ).val( "￦" + ui.values[ 0 ] + " - ￦" + ui.values[ 1 ] );
	          }
	        });
	        $( "#amount" ).val( "￦" + $( "#slider-range" ).slider( "values", 0 ) +
	          " - " + $( "#slider-range" ).slider( "values", 1 ) );
		
	});
	
 	// 방크기 클릭시 방크기 슬라이더 바
	$("#houseSize_select").click(function(){
		$("#SizeBox").toggle();
	      $( "#slider-size" ).slider({
	          range: true,
	          min: 0,
	          max: 20,
	          values: [ 0, 20 ],
	          slide: function( event, ui ) {
	            $( "#size" ).val( "평" + ui.values[ 0 ] + " - 평" + ui.values[ 1 ] );
	          }
	        });
	        $( "#size" ).val( "평" + $( "#slider-size" ).slider( "values", 0 ) +
	          " - " + $( "#slider-size" ).slider( "values", 1 ) );
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
      <div id="content">
         <div class="subHeader">
            <div class="house_searchWrap">
               <form action="" class="house_searchForm">
                  <input type="search" id="house_search" placeholder="검색어를 입력하세요">
                  <button id="searchBtn_map"><img src="./images/searchicon.png" ></button>

               </form>
         </div>
         
			<div class="selectbar">
              	<div class="houseType">
              	<select class="houseType_select">
              	<option>원룸</option>
              	<option>투룸</option>
              	<option>오피스텔</option>
              	</select>
              	</div>
              	<div class="Deal_type">
              	<select class="dealType_select">
              	<option>월세</option>
              	<option>전세</option>
              	</select>
              	</div>
              	<div class="houseMgr">
              	<button id="houseMgr_select" type="button">관리비</button>
              	<div id="Mgrbox" class="Mgrbox" >
              		<label for="amount">관리비:</label>
              		<input type="text" id="amount" readonly style="border:0; color:#f6931f;" class="form-control">
              		<div id="slider-range"></div>
              	</div>
              	</div>
              	<div class="houseSize" >
              	<button id="houseSize_select">방크기</button>
              	<div id="SizeBox" class="SizeBox">
              	<label for="size"></label>
              	<input type="text" id="size" readonly style="border:0; color:#f6931f;" class="form-control">
              	<div id="slider-size"></div>
              	</div>
              </div>
            </div>
         </div>
         
      </div>
   </main>
   <div id="mapWrap"> 
            <div id="map" style="width:100%;height:500px;"></div>
         </div>
   
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