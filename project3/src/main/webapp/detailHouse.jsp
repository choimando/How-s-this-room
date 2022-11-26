<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"/>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
body{
	width: 1536px;
}

span {
	margin-top: 40px;
}

footer {
	position: absolute;
	bottom: 0px;
	left: 50%;
}

#house_info {
	display: flex;
}

#main_header {
	/* position:fixed; */
	height: 80px;
	padding: 1rem;
	
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
	float: left;
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
	font-weight: bold;
}

#main_body {
	background: #F6323E;
	height: 500px;
	width: 100%;
	padding-top: 100px;
}

#btn_plus {
	position: absolute;
	left: 50%;
}

.opt_icon {
	width: 50px;
	height: 50px;
	margin-right: 10px;
	margin-top: 15px;
}

#mini_box {
	border: 1px solid rgb(223, 223, 223);
	position: relative;
	width: 410px;
	height: 370px;
	float: right;
	background: #ffffff;
	box-shadow: rgb(0 0 0 / 10%) 0px 10px 20px;
	border-radius: 2px;
}

article {
	width: 80%;
	margin: auto;
}

#house_img {
	padding: 30px 0 30px 0;
	display: inline-block;
	position: relative;
}


#house_name {
	padding: 15px 0;
	font-size: 2em;
}

#house_info {
	padding: 0 0 30px 0;
}

table {
	height: 300px;
}

#map {
	margin-top: 30px;
}

#house_loc {
	margin-top: 10px;
}

#container {
	height: 900px;
	overflow: hidden;
}

#opt {
	margin-top: 40px;
}

#detail {
	margin-top: 30px;
	width: 70%;
}

#house_detail {
	margin-top: 20px;
	border: 1px solid black;
	width: 66.4%;
}

#recoment_box {
	margin-top: 30px;
	width: 70%;
}

#recoment {
	
}
#recoment_form button {
	margin-left: 20px;
	padding : 10px;
}
button{
	width: 100px;
	height: 50px;
	opacity: 50%;
}


.modal {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
  z-index: 100;
}

.modal.show {
  display: block;
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 1200px;
  height: 600px;

  padding: 40px;

  text-align: center;

  background-color: #ffffff;
  
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}
ul{
   list-style:none;
   }
#re_list{
	margin-left: 10px;
}
.recoment{
	margin-top: 10px;
	width : 70%;
	background: #E5E5E5;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-radius: 10px;
}
.active{
	background: #F6323E;
	color: white;
}
.post-slider .next {
      position: absolute;
      top: 50%;
      right: 30px;
      font-size: 2em;
      color: gray;
      cursor: potiner;
   }

.post-slider .prev{
      position:absolute;
      top:50%;
      left:30px;
      font-size:2em;
      color:gray;
      cursor: pointer;
   }
#mini_box div{
	margin-left: 20px;
	margin-right: 20px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d6c7f01d8653b719ba4858f81141fae"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script type="text/javascript">
	$(function() {
			
		var house_id = $("#house_id").val();
		var lat = $("#lat").val();
		var lng = $("#lng").val();
		var house_name = $("#house_name").val();
		var house_no = $("#house_no").val();
		var img_fname = $("#img_fname").val();
		var state = $("#state").val();
		var reno = null;
		
		var loginId = sessionStorage.getItem("id");
		
		sessionStorage.setItem("house_no", house_no);
		
		$("#inter_title").val(house_name);
		$("#inter_img").val(img_fname);
		$("#id").val(loginId);
		$("#house_id2").val(house_id);
		$("#house_no2").val(house_no);
		
		console.log(state);
		//로그인 아이디와 작성자 아이디인지 확인하는 기능
		
			if((house_id == loginId)&& state == "Y"){
				var btn_sell = $("<button></button>").html("거래 완료").css({
					position : "absolute",
					bottom : "0px",
					left : "50%",
					marginLeft : "-120px",
					marginBottom : "10px"
				}).addClass("btn_sell");
				var btn_delete = $("<button></button>").html("매물 삭제").css({
					position : "absolute",
					bottom : "0px",
					left : "50%",
					marginLeft : "20px",
					marginBottom : "10px"
				}).addClass("btn_delete");
				$("#mini_box").append(btn_sell, btn_delete);
				}else if(state =="Y"){
					var btn_inter = $("<button></button>").html("관심목록 등록").css({
						position : "absolute",
						bottom : "0px",
						left : "50%",
						marginLeft: "-50px",
						marginBottom : "10px"
					}).addClass("btn_inter");
					$("#mini_box").append(btn_inter);
					
				
				}else if(state != "Y"){
					var btn_selled = $("<button></button>").html("판매된 상품").css({
						position : "absolute",
						bottom : "0px",
						left : "50%",
						marginLeft: "-50px",
						marginBottom : "10px"
					});
					$("article").css({
						
						opacity : "50%"
					});
						$("#mini_box").append(btn_selled);
					}
		
				
		
		//관심목록 버튼 눌렀을 때 기능
		
		$(document).on("click",".btn_inter", function(){
			
			if(loginId == null){
				alert("먼저 로그인을 해주세요.");
				location.href="LoginAction.do";
			}else{
				var data = $("#inter_form").serializeArray();
				$.ajax({
					url : "RegInter",
					data : data,
					
					success: function(re){
						if(re>=1){
							alert("관심목록에 등록되었습니다.");
							
							location.href="RegiInterAction.do";
						}else{
							alert("관심목록 등록에 실패하였습니다.")
						}
					}
				});
			}
		});
		
		//거래완료 버튼 눌렀을 때 기능
		$(document).on("click", ".btn_sell", function(){
			$.ajax({
				url : "House_sell",
				data : {house_no : house_no},
				success : function(re){
					if(re>=1){
						alert("판매완료@");
						location.reload();
					}
				}
			});
		});
		
		//삭제버튼 눌렀을 때 기능
		$(document).on("click", ".btn_delete", function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href = "deleteHouse.do?house_no="+house_no+""
			}
		});
			
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5565, 126.9196), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		//더보기 버튼 눌렀을 때
		$("#btn_plus").click(function(){
			$("#container").css({
				overflow : "visible"
			});
			$("#footer").css({
				position: "absolute",
				bottom: "0px",
				left : "50%"
			});
			$(this).css({
				display:"none"
			});
			$("#btn_recoment").css({
				display:"inline"
			});
		});
		
		
		//스크롤 이벤트
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			var height = $(window).height();
			var documentHeight = $(document).height();
			console.log(scrollTop)
			if(scrollTop >= 597){
				$("#mini_box").css({
					border: "1px solid rgb(223, 223, 223)",
					position : "fixed",
					right : "75px",
					top : "0px",
					width : "410px",
					boxShadow: "rgb(0 0 0 / 10%) 0px 10px 20px",
					borderRadius: "2px"
					
				});
			}
			if(scrollTop < 597){
				$("#mini_box").css({
					border: "1px solid rgb(223, 223, 223)",
					position: "relative",
					width: "410px",
					height: "370px",
					
					right : "0px",
					boxShadow: "rgb(0 0 0 / 10%) 0px 10px 20px",
					borderRadius: "2px"
					
				});
			}
			
		});
		
		//댓글 버튼 관련 기능들
		//등록버튼
		$("#btn_Recoment").click(function(e){
			var data = $("#recoment_form").serializeArray();
			e.preventDefault();
			$("#re_content").val("");
			$("#re_pwd").val("");
			if(loginId != null){
				$.ajax({
					url : "InsertRecoment",
					data : data,
					success : function(re){
						if(re >=1){
							alert("댓글이 등록되었습니다.")
							$("#re_list").empty();
							getRecoment();
						}
					}
				});
			}else{
				alert("로그인 이후에 댓글 작성이 가능합니다.");
			}
			
		});
		
		//삭제버튼
		$("#btn_Redelete").click(function(e){
			var pwd_check = prompt("비밀번호를 입력해주세요");
			var pwd = $("#re_del_pwd").val();
			e.preventDefault();
			if(pwd == pwd_check ){
				$.ajax({
					url : "DeleteRecoment",
					data : {reno : reno},
					success : function(re){
						$("#re_list").empty();
						getRecoment();
					}
				});
				
			}else{
				alert("비밀번호를 확인해 주세요!")
			}
			
		});
		
		//댓글 클릭했을 때 해당 댓글 값 불러오는 거
		
		$(document).on("click",".recoment", function(){
			$("li").removeClass("active");
			$(this).addClass("active");
			var div = $(this).find("div");
			reno = $(div[2]).html();
			console.log(reno);
			$("#re_del_content").val($(div[1]).html());
			$("#re_del_pwd").val($(div[3]).html());
			
		});
		
		 const body = document.querySelector('body');
	      const modal = document.querySelector('.modal');
	      const btnOpenPopup = document.querySelector('.btn-open-popup');

	      btnOpenPopup.addEventListener('click', () => {
	        modal.classList.toggle('show');

	        if (modal.classList.contains('show')) {
	          body.style.overflow = 'hidden';
	        }
	      });

	      modal.addEventListener('click', (event) => {
	        if (event.target === modal) {
	          modal.classList.toggle('show');

	          if (!modal.classList.contains('show')) {
	            body.style.overflow = 'auto';
	          }
	        }
	      });
	      // 댓글 불러오는 함수 생성
	      
	      var getRecoment =  function(){
	    	  $.ajax({
	    		 url : "LoadRecoment",
	    		 data : {house_no : house_no},
	    		 success : function(data){
	    			 $.each(data, function(){
	    				var li = $("<li></li>").addClass("recoment");
	    				var un_know = $("<div></div>").html("<b>익명</b>");
	    				var re_contet = $("<div></div>").html(this.re_content);
	    				var re_no = $("<div></div>").html(this.reno).css({
	    					display : "none"
	    				}).addClass("reno");
	    				var re_pwd = $("<div></div>").html(this.re_pwd).css({
	    					display : "none"
	    				});
	    				$(li).append(un_know, re_contet, re_no, re_pwd);
	    				 
	    				$("#re_list").append(li);
	    			 });
	    		 }
	    	  });
	      }
	      getRecoment();
	      
	      //갤러리 동작하는 부분
	      var width = $('[data-role="slider"]').attr('data-width');
	      var height = $('[data-role="slider"]').attr('data-height');
	      var count = $('[data-role="slider"] div.item').length;
	      
	      $('[data-role="slider"]').css({
	    	  position : "relative",
	    	  overflow: "hidden",
	    	  width : width,
	    	  height : height,
	    	  left : "50%",
	    	  marginLeft : -(width/2)
	      }).find(".container").css({
	    	  position: "absolute",
	    	  width : count * width,
	    	  overflow:"hidden"
	      }).find(".item").css({
	    	  width : width,
	    	  height : height,
	    	  float : "left"
	    	  
	      });
	      
	      var currentPage =0;
	      var changePage = function(){
	    	  $('[data-role="slider"] > .container').animate({
	    		 left : -currentPage * width 
	    	  },500);
	      }
	      $("#left-button").click(function(){
	    	 if(currentPage > 0){
	    		 currentPage = currentPage -1;
	    		 changePage();
	    	 } 
	      });
	      
	      $("#right-button").click(function(){
	    	 if(currentPage < count - 1){
	    		 currentPage = currentPage + 1;
	    		 changePage();
	    	 } 
	      });
	      
	      //작성자 번호 불러오는 에이작
	      $.ajax({
	    	  url : "GetPhone",
	    	  data : {id : house_id},
	    	  success : function(data){
	    		  $.each(data, function(){
	    			$("#phone").append(this.phone);
	    		  })
	    		
	    		  
	    	  }
	      });
	      
	      $.ajax({
	    	 url : "GetMgr",
	    	 data : {house_no : house_no},
	    	 success : function(arr){
	    		 $.each(arr, function(){
	    			 var mgr_elec = this.mgr_elec;
	    			 var mgr_water = this.mgr_water;
	    			 var mgr_internet = this.mgr_internet;
	    			 var mgr_gas = this.mgr_gas;
	    			 var mgr_park = this.mgr_park;
	    			 var h6 = $("<h5></h5>");
	    			 $(h6).append("( ")
	    			 if(mgr_elec != null){
	    				 $(h6).append(mgr_elec+" ");
	    			 }
	    			 if(mgr_water != null){
	    				 $(h6).append(mgr_water+" ");
	    			 }
	    			 if(mgr_internet != null){
	    				 $(h6).append(mgr_internet+" ");
	    			 }
	    			 if(mgr_gas != null){
	    				 $(h6).append(mgr_gas+" ");
	    			 }
	    			 if(mgr_park != null){
	    				 $(h6).append(mgr_park+" ");
	    			 }
	    			 $(h6).append(" )")
	    			  $("#mgr_list").append(h6);
	    		 })
	    		
	    	 }
	      });
		
	});
</script>

</head>
<body>
	 <div class="modal">
      <div class="modal_body post-slider">
      	<div data-role ="slider" data-width="800" data-height="500">
      		<div class="container">
	      		<c:forEach items="${img_list }" var="i">
				    <div class = "item">
				    	<img src="images/${i.img_fname }" style="width: 800px; height: 500px; left: 50%;">
				    </div>
			    </c:forEach>
		    </div>
		</div>
			<i class="fa-solid fa-chevron-left prev" id="left-button"></i>      
            <i class="fa-solid fa-chevron-right next" id="right-button"></i>
		</div>
    </div>
	<c:forEach items="${house_list }" var="h">
	<c:forEach items="${img_list }" var="i" begin="0" end="0">
		<form id="data"> <!-- 집에 대한 정보 다 히든으로 받을 폼 -->
			<input type="hidden" id="house_id" name="house_id" value="${h.id }">
			<input type="hidden" id="lat" value="${h.lat }">
			<input type="hidden" id="lng" value="${h.lng }">
			<input type="hidden" id="house_name" name="house_name" value="${h.house_name }">
			<input type="hidden" id="house_no" name="house_no" value="${h.house_no }">
			<input type="hidden" id="img_fname" value="${i.img_fname }">
			<input type="hidden" id="state" value=${h.state }>
		</form>
	</c:forEach>
	</c:forEach>
	<form id="inter_form">
		<input type="hidden" id="inter_title" name="inter_title">
		<input type="hidden" id="inter_img" name="inter_img">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="house_id2" name="house_id2">
		<input type="hidden" id="house_no2" name="house_no2">
	</form>
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

	<nav></nav>

	<article>
		<!-- 첫 화면에 보이는 컨테이너 -->
		<div id="container">
			<div id="main_container">
				<div id="title">
					<a href="">< 돌아가기</a>
					<c:forEach items="${house_list }" var="h">
						<h1 id="house_name">${h.house_name }</h1>
						<div id="loc">${h.loc }</div>
					
					<hr>
				</div>
				<div id="house_img" style="height : 300px">
					<!-- 이미지 넣을 자리 -->
					<c:forEach items="${img_list }" var="i" begin="0" end="0">
						<img src="images/${i.img_fname }" height="300px" width= "60%">
					</c:forEach>
					<c:forEach items="${img_list }" var="i" begin="1" end="2">
						<img src="images/${i.img_fname }" height="300px" width= "18%">
					</c:forEach>
					<button class="btn-open-popup">사진 전체 보기</button>
				</div>
				<div id="mini_box">
					<div style="border:1px solid rgb(101, 101, 101); width: 100px; text-align: center; margin-top: 20px">매물번호 ${h.house_no }</div>
					<div style="margin-top: 20px; font-size: 1.5em"><h1>${h.house_name }</h1></div>
					<div style="margin-top: 5px"><h3>${h.loc }</h3></div>
					<div style="margin-top: 20px; "><h1>${h.type }</h1></div>
					<div style="margin-top: 20px; "><h1>${h.deposit}/${h.price }</h1></div>
					<div style="margin-top: 20px"><b>판매자</b> : ${h.id }</div>
					<div style="margin-top: 20px" id="phone"><b>연락처</b> : </div>
				</div>
				</c:forEach>
				<div id="house_info">
					<div id="price_info">
						<table width="300px">
							<tr>
								<td colspan="2"><h3 style="font-size: 27px">가격정보</h3></td>
							</tr>
							<tr>
								<c:forEach items="${house_list }" var="h" >
									<td id="deal_type"><b>${h.deal_type }</b></td>
									<td id="house_price">${h.price }만원</td>
							</tr>
							<tr>
								<td><b>관리비</b></td>
								<td id="mgr">${h.mgr }만원</td>
								

							</tr>
							<tr>
								<td id="mgr_list"></td>
							</tr>
							<tr>
								<td><b>보증금</b></td>
								<td id="deposit">${h.deposit }만원</td>

							</tr>
							<tr>
								<td><b>가까운 지하철역</b></td>
								<td id="month_price">홍대입구역</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<!-- 프라이스 인포 끝 -->
					<div id="detail_info" style="margin-left: 100px">
						<table width="300px" height="400px">
							<tr>
								<td colspan="2"><h3 style="font-size: 27px">매물 정보</h3></td>
							</tr>
							<tr>
								<td><b>방 형태</b></td>
								<c:forEach items="${house_list }" var="h">
									<td id="house_type">${h.type }</td>
							</tr>
							<tr>
								<td><b>층수</b></td>
								<td id="floor">${h.floor }층</td>
							</tr>
							<tr>
								<td><b>방향</b></td>
								<td id="aspect">${h.aspect }</td>
							</tr>
							<tr>
								<c:forEach items="${opt_list }" var="o">
									<td><b>주차 가능여부</b></td>
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
					</div>
					<!-- 디테일 인포 끝 -->
				</div>
				<!-- 하우스 인포 끝 -->
			</div>
			<!-- 메인 컨테이너 끝 -->
			<!-- 더보기 버튼 누를 때 화면에 보이는 컨테이너 -->
			<button id="btn_plus">더보기</button>
			<div id="add_container">
				<div id="house_detailInfo">
					<c:forEach items="${house_list }" var="h">
						<h3 style="font-size: 27px">매물 상세 정보</h3>
						<table width="600px">
							<tr>
								<td><b>방 종류</b></td>
								<td>${h.type }</td>
							</tr>
							<tr>
								<td><b>건물 층</b></td>
								<td>${h.floor }</td>
							</tr>
							<tr>
								<td><b>전용면적</b></td>
								<td>${h.area }</td>
							</tr>
							<tr>
								<td><b>방향</b></td>
								<td>${h.aspect }</td>
							</tr>
							<tr>
								<td><b>월/전세</b></td>
								<td>${h.deal_type }</td>
							</tr>
							<tr>
								<td><b>가격</b></td>
								<td>${h.price }</td>
							</tr>
							<tr>
								<td><b>보증금</b></td>
								<td>${h.deposit }</td>
							</tr>
							<tr>
								<td><b>입주 가능일</b></td>
								<td>${h.input_date }</td>
							</tr>
							
						</table>
					</c:forEach>
				</div>
				<div id="detail_loc">
					<h3 style="font-size: 27px">상세 위치</h3>

					<c:forEach items="${house_list }" var="h">
						<div id="house_loc">${h.loc }</div>
					</c:forEach>
					<div id="map" style="width: 50%; height: 350px;"></div>
				</div>
				<div id=opt>
					<c:forEach items="${opt_list }" var="o">
						<h3 style="font-size: 27px">옵션</h3>
						<span id="option_icon"> <c:if test="${o.opt_park eq 'Y' }">
								<img src="images/park.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_aircon eq 'Y' }">
								<img src="images/aircon.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_refrige eq 'Y' }">
								<img src="images/refrige.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_washer eq 'Y' }">
								<img src="images/washer.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_gas eq 'Y' }">
								<img src="images/gas.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_micro eq 'Y' }">
								<img src="images/micro.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_elevator eq 'Y' }">
								<img src="images/elevator.png" class="opt_icon">
							</c:if> <c:if test="${o.opt_builtin eq 'Y' }">
								<img src="images/biltin.png" class="opt_icon">
							</c:if>
						</span>
						<!-- 옵션 아이콘 줄줄이 넣을 곳 -->
					</c:forEach>
				</div>
				<div id=security style="margin-top: 30px">
					<c:forEach items="${seq_list }" var="s">
						<h3 style="font-size: 27px">보안시설</h3>
						<span id="option_icon"> <c:if test="${s.cctv eq 'Y' }">
								<img src="images/cctv.png" class="opt_icon">
							</c:if> <c:if test="${s.videophone eq 'Y' }">
								<img src="images/videophone.png" class="opt_icon">
							</c:if> <c:if test="${s.interphone eq 'Y' }">
								<img src="images/interphone.png" class="opt_icon">
							</c:if> <c:if test="${s.firealarm eq 'Y' }">
								<img src="images/firealarm.png" class="opt_icon">
							</c:if> <c:if test="${s.frontdoor eq 'Y' }">
								<img src="images/frontdoor.png" class="opt_icon">
							</c:if> 
						</span>
						<!-- 옵션 아이콘 줄줄이 넣을 곳 -->
					</c:forEach>
				</div>
				<div id="detail">
					<h3 style="font-size: 27px">상세 설명</h3>
					<c:forEach items="${house_list }" var="h">
						<div id="house_detail">${h.detail }</div>
						<div id="recoment_box">
							<h3 style="font-size: 27px">
								<b>댓글 리뷰</b>
							</h3>
							<div id="recoment">
							<hr>
								<form id = "recoment_form" style="margin-bottom: 10px; margin-top : 10px; margin-bottom: 30px;">
								<div style="display: inline; height: 100%;">
									<input type="text" id="re_content" name="re_content" placeholder="댓글 내용을 입력해주세요." style="width:250px;height:30px;"> 
									<input type="password" id="re_pwd" name="re_pwd" placeholder="비밀번호" style="width:100px;height:30px;">
									<input type="hidden" name="house_no" value="${h.house_no }">
									<input type="hidden" name="house_id" value="${h.id }">
								</form>
									<button id="btn_Recoment" style="width : 75px; height : 30px; text-align: center; ">댓글등록</button>
									<button id="btn_Redelete" style="width : 75px; height : 30px; text-align: center; ">댓글삭제</button>
								</div>
								<div id="recoment_print">
									<ul id="re_list">
										
									</ul>
								</div>
								<input type="hidden" id="re_del_content">
								<input type="hidden" id="re_del_pwd">
								<input type="hidden" id="re_reno">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</article>
	<footer id="footer"> </footer>
</body>
</html>