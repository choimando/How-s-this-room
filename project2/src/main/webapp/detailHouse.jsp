<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#price_info{
		float: left;
	}
	#house_inof{
		float: left;
	}
	button{
		position: absolute;
		left: 50%;
	}
	.opt_icon{
		width: 50px;
		height: 50px;
		margin: 10px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d6c7f01d8653b719ba4858f81141fae"></script>
<script type="text/javascript">
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5565, 126.9196), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	});
</script>
</head>
<body>
	<header></header>
	
	<nav></nav>
	
	<article>
		 <!-- 첫 화면에 보이는 컨테이너 -->
		<div id="main_container">
			<div id="title">
				<a href="">돌아가기</a>
				<c:forEach items="${house_list }" var="h">
				<h1 id="house_name">${h.house_name }</h1>
				<div id="loc">${h.loc }</div>
				</c:forEach>
				<hr>
			</div>
			<div id="house_img">
				<c:forEach items="${img_list }" var="i">
				<img src="images/${i.img_fname }" height="300px" >
				</c:forEach>
			</div>
			<div id="house_info">
				<div id="price_info">
					<table width = "250px">
						<tr>
							<td colspan="2"><h3>가격정보</h3></td>
						</tr>
						<tr>
							<c:forEach items="${house_list }" var="h" >
							<td id="deal_type">${h.deal_type }</td>
							<td id="house_price">${h.price }만원</td>
						</tr>
						<tr>
							<td>관리비</td>
							<td id="mgr">${h.mgr }만원</td>
						
						</tr>
						<tr>
							<td>보증금</td>
							<td id="deposit">${h.deposit }만원</td>
							
						</tr>
						<tr>
							<td>한 달 예상금액</td>
							<td id="month_price">100만원</td>
						</tr>
							</c:forEach>
					</table>
				</div><!-- 프라이스 인포 끝 -->
				<div id="detail_info">
					<table width="250px">
						<tr>
							<td colspan="2"><h3>상세정보</h3></td>
						</tr>
						<tr>
							<td>방 형태</td>
							<c:forEach items="${house_list }" var="h">
							<td id="house_type">${h.type }</td>
							
						</tr>
						<tr>
							<td>층수</td>
							<td id="floor">${h.floor }층</td>
						</tr>
						<tr>
							<td>방향</td>
							<td id="aspect">${h.aspect }</td>
						</tr>
						<tr>
							<c:forEach items="${opt_list }" var="o">
							<td>주차 가능여부</td>
							<c:if test="${o.opt_park eq 'Y' }">
							<td id="opt_park">가능</td>
							</c:if>
							<c:if test="${o.opt_park ne 'Y' }">
							<td id="opt_park">불가능</td>
							</c:if>
							</c:forEach>
						</tr>
						</c:forEach>
					</table>
				</div><!-- 디테일 인포 끝 -->
			</div><!-- 하우스 인포 끝 -->
		</div><!-- 메인 컨테이너 끝 -->
		 <!-- 더보기 버튼 누를 때 화면에 보이는 컨테이너 -->
		 <button id="btn_plus">더보기</button>
		<div id="add_container">
			<div id="detail_loc">
				<h3>상세 위치</h3>
				<c:forEach items="${house_list }" var="h">
				<div id="house_loc">${h.loc }</div>
				</c:forEach>
				<div id="map" style="width:30%;height:350px;"></div>
			</div>
			<div id=opt>
				<c:forEach items="${opt_list }" var="o">
					<h3>옵션</h3>
					<span id="option_icon">
						<c:if test="${o.opt_park eq 'Y' }">
							<img src="images/park.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_aircon eq 'Y' }">
							<img src="images/aircon.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_refrige eq 'Y' }">
							<img src="images/refrige.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_washer eq 'Y' }">
							<img src="images/washer.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_gas eq 'Y' }">
							<img src="images/gas.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_micro eq 'Y' }">
							<img src="images/micro.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_elevator eq 'Y' }">
							<img src="images/elevator.png" class="opt_icon">
						</c:if>
						<c:if test="${o.opt_builtin eq 'Y' }">
							<img src="images/biltin.png" class="opt_icon">
						</c:if>
					</span>  <!-- 옵션 아이콘 줄줄이 넣을 곳 -->
				</c:forEach>
			</div>
			<div id="detail">
				<h3>상세 설명</h3>
				<c:forEach items="${house_list }" var="h">
				<div id="house_detail">${h.detail }</div>
				</c:forEach>
			</div>
		</div>
	</article>
</body>
</html>