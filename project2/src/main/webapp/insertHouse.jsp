<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방내놓기 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btnRegister").click(function(){
			$.ajax({
				url:"",
				success:function(){
					$("")
				}
			})
		});
	});
</script>
<style type="text/css">
	*{
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
	
	/* 위에는 main.jsp css(수린님꺼) */
	/* 여기서부터는 내 css */
	#AllWrap{
		margin: auto;
  		
	}
	#btn_roomOut{
		/*position:absolute;
		top:50%;
		left:50%;*/
		width:250px;
		height:50px;
		
	}
	#btn_myRoom{
		/* position:absolute;
		top:60%;
		left:60%; */
		width:250px;
		height:50px;
	}
	#myroom_info_div{
		
		border-color: black;
		border: 1px solid gold;
		width:510px;
		height:180px;
		}
    
    #big_menu {
   		
		text-align: center;
		width: 600px;
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
<div id="AllWrap">
<form action="insertHouse.do">
	<div class="test" name="test" id="test"></div>
	<a href="insertHouse.do">insertHouse.do가기</a>
</form>
<form action="insertHouseOK.do" >
	<a href="insertHouseOK.do">insertHouseOK.do가기</a>
</form>
<section id="big_menu">
	<h1 id="menu_bigtitle">방내놓기</h1>
	<button id="btn_roomOut"><a href="insertHouse3.jsp">방내놓기</a></button>
	<button id="btn_myRoom"><a href="insertHouse3_2.jsp">내방관리</a></button>
</section>
<section id="myroom_info">
	<div id="myroom_info_div">여기는 방내놓기 첫번째칸입니다 방내놓기를 위한 설명란이죠</div>
</section>
<section id="type">
	<table>
		<tr><td><h2>매물 종류</h2></td></tr>
		<tr>
			<th>종류 선택
				<td><input type="radio" name="roomType" checked>원룸</td>
				<td><input type="radio" name="roomType" >투룸</td>
				<td><input type="radio" name="roomType" >오피스텔</td>
			</th>
			<th>유형
				<td>월세<input type="radio" name="dealType" checked></td>
				<td>전세<input type="radio" name="dealType" ></td>
			</th>
		</tr>
	</table>
</section>

<section id="basic_info">
	<table>
		<tr><td><h2>기본 정보</h2></td></tr>
	
		<tr>
			<td>면적&nbsp;<input type="number">&nbsp;평&nbsp;&nbsp;</td><br>
			<td>건물층수
				<select>
					<option>&nbsp;건물층수선택</option>
					<option>1층</option>
					<option>2층</option>
					<option>3층</option>
					<option>4층</option>
					<option>5층</option>
					<option>6층</option>
					<option>7층</option>
					<option>8층</option>
					<option>9층</option>
					<option>10층</option>
				</select>
			 </td>
			 <td>
			 	<select>
					<option>해당층수선택</option>
					<option>1층</option>
					<option>2층</option>
					<option>3층</option>
					<option>4층</option>
					<option>5층</option>
					<option>6층</option>
					<option>7층</option>
					<option>8층</option>
					<option>9층</option>
					<option>10층</option>
				</select>
			 </td>
		</tr>
	</table>
</section>

<section id="addtitional_info">
	<table>
		<tr><td><h2>추가 정보</h2></td></tr>
		<tr>
			<td>관리비&nbsp;&nbsp;
			<input type="number">만원&nbsp;&nbsp;&nbsp;
			협의 가능<input type="radio" name="insert_mgr">
			관리비 없음<input type="radio" name="insert_mgr"><br><br>
			<hr>
			<label>관리비항목</label>
			<label>&nbsp;&nbsp;<input type="checkbox">&nbsp;전기세</label>
			<label>&nbsp;&nbsp;<input type="checkbox">&nbsp;수도세</label>
			<label>&nbsp;&nbsp;<input type="checkbox">&nbsp;가스비</label>
			<label>&nbsp;&nbsp;<input type="checkbox">&nbsp;주차이용료</label>			
			<label>&nbsp;&nbsp;<input type="checkbox">&nbsp;기타</label>			
			</td>
		<tr><br>
		
		<tr>
			<td>엘리베이터&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>가능&nbsp;<input type="radio" name="insert_elevator"></label>
			<label>불가능&nbsp;<input type="radio" name="insert_elevator"></label>
			</td>
		</tr>
		<br>
		<tr>
			<td>발코니&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>가능&nbsp;<input type="radio" name="insert_valcony"></label>
			<label>불가능&nbsp;<input type="radio" name="insert_valcony"></label>
			</td>
		</tr><br>
		<tr><td>주차여부&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>가능&nbsp;<input type="radio" name="insert_park_possible"></label>
			<label>불가능&nbsp;<input type="radio" name="insert_park_possible"></label>
			</td>
		</tr><br>
		<tr><td>빌트인&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>있음&nbsp;<input type="radio" name="insert_builtin" value="Y"></label>
			<label>없음&nbsp;<input type="radio" name="insert_builtin" value="N"></label>
			</td>
		</tr>
		<tr><td>옵션항목&nbsp;&nbsp; 
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>주차장&nbsp;<input type="checkbox"></label>
			<label>에어컨&nbsp;<input type="checkbox"></label>
			<label>냉장고&nbsp;<input type="checkbox"></label>
			<label>세탁기&nbsp;<input type="checkbox"></label>
			<label>가스레인지&nbsp;<input type="checkbox"></label>
			<label>전자레인지&nbsp;<input type="checkbox"></label>
			<label>엘리베이터&nbsp;<input type="checkbox"></label>
			<label>빌트인&nbsp;<input type="checkbox"></label>
			</td>
		</tr>
	</table>	
</section>
<section id="loc">
	<table>
		<tr><td><h2>위치 정보</h2></td></tr>
		<tr>
			<th>주소</th>
			<td>
				<p>도로명,지번주소 모두 검색 가능합니다.</p>
				<input type="text"><button>검색</button><br>
				<textarea rows=10 cols=50></textarea>
				 <a href="https://map.kakao.com/?urlX=482094&urlY=1127083&urlLevel=1&map_type=TYPE_MAP&map_hybrid=false" target="_blank">
				 	<img width="250" height="150" src="https://map2.daum.net/map/mapservice?FORMAT=PNG&SCALE=0.625&MX=482094&MY=1127083&S=0&IW=504&IH=310&LANG=0&COORDSTM=WCONGNAMUL&logo=kakao_logo" style="border: 1px solid #ccc"></a>
					<div class="hide" style="overflow: hidden; padding: 7px 11px; border: 1px solid #dfdfdf; border-color: rgba(0, 0, 0, .1); border-radius: 0 0 2px 2px; background-color: #f9f9f9; width: 482px;">
							<strong style="float: left;">
							<img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵"></strong>
							<div style="float: right; position: relative">
								<a style="font-size: 12px; text-decoration: none; float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000" target="_blank"
									href="https://map.kakao.com/?urlX=482094&urlY=1127083&urlLevel=1&map_type=TYPE_MAP&map_hybrid=false">지도 크게 보기</a>
							</div>
					</div>
			</td>
		</tr>
	</table>
</section>
<section id="detail">
	<tr><td><h2>위치 정보</h2></td></tr>
	<tr>
		<th>제목</th>
		<td><textarea rows="1" cols="100"></textarea> </td>
	</tr><br>
	<tr>
		<th>상세 설명</th>
		<td><textarea rows="5" cols="100"></textarea> </td>
	</tr>
</section>
<section id="insert_pic">
	<tr><td><h2>사진 등록</h2></td></tr>
	<tr>
		<td>
			<p>사진은 가로로 찍은 사진을 권장합니다.</p>
			<p>사진 용량은 최대 10MB입니다.</p>
			<p>사진은 최소 3장 이상 등록해야하며, 최대 10장까지 등록 가능합니다.</p>
		</td>
	</tr>
</section>
<section id="agree"></section><br>
<button id="btnRegister">등록하기</button><br>
</div>
</body> 
</html>