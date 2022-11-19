<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="style.css">
<!-- css 파일 -->
<!-- 검색버튼 아이콘 제공 태그 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 이미지 슬라이더 플러그인 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- 이미지 슬라이더 플러그인 -->
<!-- 화살표 아이콘 -->
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<!-- 화살표 아이콘 -->
<script type="text/javascript">
	$(function(){
		$("#all").addClass("btn_active");
		
		/* 스크롤, 헤더 변경 */
		$(window).scroll(function(){
			var scroll = $(window).scrollTop();
			if(scroll > 1){
				$("#forMain_header").css("background","white");
				$("#main_link").css("color","#F6323E");
				$(".menu_link").css("color","#F6323E");
			}else{
				$("#forMain_header").css("background","#F6323E");
				$("#main_link").css("color","white");
				$(".menu_link").css("color","white");
			}
		});
		
		/* 검색컬럼 클릭 함수 */
		$(".searchCol").click(function(){
			$(".searchCol").removeClass("btn_active");
			$(this).addClass("btn_active");
			
			var name = $(this).attr("name");
			$("#searchCol").val(name);
		});
		
		/* 슬라이더 함수 */
		$('.post-wrapper').slick({
			 slidesToShow: 3,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 2000,
			  nextArrow:$('.next'),
			  prevArrow:$('.prev')
		});
	});
</script>
</head>
<body>
	<header id="forMain_header">
		<h1><a id="main_link" href="main.jsp">이방어때</a></h1>
		<nav id="topMenu">
			<ul>
				<li><a class="menu_link" href="loadHouse.do">지도</a></li>
				<li><a class="menu_link" href="#">관심목록</a></li>
				<li><a class="menu_link" href="#">방내놓기</a></li>
				<li><a class="menu_link" href="#">알림</a></li>
				<li><a class="menu_link" href="#">로그인/회원가입</a></li>
			</ul>
		</nav>
	</header>
	
	
	<main>
		<div class="searchDiv">
			<form action="search.do" method="post" class="searchBox">
				<div class="searchMenu">
					<span class="searchCol" id="all">전체</span>
					<span class="searchCol" id="oneRoom" name="원룸">원룸</span>
					<span class="searchCol" id="twoRoom" name="투룸">투룸</span>
					<span class="searchCol" id="officetel" name="오피스텔">오피스텔</span>
				</div>
				<input type="hidden" name="searchCol" id="searchCol">
				<input type="text" name="searchWord" id="searchWord" placeholder="원하는 지역을 입력해 주세요">
				<button type="submit" id="searchBtn"><i class="fas fa-search"></i></button>
			</form>
			
		</div>
		
		<!-- 추천 매물 -->
		<div class="page-wrapper" style="position:relative;">

	      <!--page slider -->
	      <div class="post-slider">
	        <h3 class="silder-title">홍대입구역 근처 방</h3>
	        <!-- <i class="fas fa-chevron-left prev" aria-hidden="true"></i> 
	        <i class="fas fa-chevron-right next" aria-hidden="true"></i>  -->
	        <i class="fa-solid fa-chevron-left prev"></i>      
	        <i class="fa-solid fa-chevron-right next"></i>
	        <div class="post-wrapper">
	          <div class="post">
	            <img src="images/house1.jpg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#" class="post-subject">홍대풍광맛집1호</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="images/house2.jpg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">홍대원룸</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="images/house3.jpg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">쌍용투룸</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="images/house4.jpg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">서교오피스텔</a></h4>
	            </div>
	          </div>
	        </div>
	      </div>
	      <!--post slider-->
    	</div>
		
		<!-- <div class="slider-wrapper" style="position:relative;">
			<div class="post-slider">
				<h3 class="slider-title">홍대입구역 주변 추천 매물</h3>
				<i class="fa-solid fa-chevron-left prev"></i>      
       			<i class="fa-solid fa-chevron-right next"></i>
       			<div class="post-wrapper">
       				<div class="post">
       					<img src="images/house1.jpg" class="slider-image">
       					<div class="post-info">
       						<h4>원룸</h4>
       						<h5>월세 1000/60</h5>
       					</div>
       				</div>
       				<div class="post">
       					<img src="images/house2.jpg" class="slider-image">
       					<div class="post-info">
       						<h4>원룸2</h4>
       						<h5>월세 1000/60</h5>
       					</div>
       				</div>
       				<div class="post">
       					<img src="images/house3.jpg" class="slider-image">
       					<div class="post-info">
       						<h4>투룸</h4>
       						<h5>월세 1000/60</h5>
       					</div>
       				</div>
       				<div class="post">
       					<img src="images/house4.jpg" class="slider-image">
       					<div class="post-info">
       						<h4>오피스텔</h4>
       						<h5>월세 1000/60</h5>
       					</div>
       				</div>
       			</div>
			</div>
		</div> -->
		
	</main>
	
	<footer>
	
	</footer>
</body>
</html>