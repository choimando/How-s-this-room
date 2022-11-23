<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방내놓기 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25dea637bdd3402e64237f2c2499c097"></script>

<script type="text/javascript">
	$(function(){
		$("#my_button").click(function() {
		    //alert($("input[class='chk0']").length); // 전체 개수
		    var count = 0;
		    $('.chk0').filter(function() {
		        if(this.value.trim().length > 0){ // 체크한 것의 개수
		            count++;
		        }
		    });
		    alert(count);
		});
		
		
		$("#btnRegister").click(function(){
			
			var str = $('#insert_all').serializeArray();//모든 input값 
			console.log(str);
			$.ajax({
				url:"insertHouse",
				data:str,
				success:function(re){
					if(re>=1){
						alert("성공");
						//location.href="loadHouseAction.do?house_no="+house_no;
						//location.href="insertHouseOK.do?house_no="+house_no;
						//입력한 no out.print해서 값 나오는지 확인하고
					}
					else{
						alert("실패");
					}
				}
			});
			var t = $("#insert_area").val();//입력해야 하는 input type = number 중 평수 입력
			var optSelect = $('#insert_floor option:selected').val(); //층수 선택
			var input_mgr = $("#insert_mgr").val();
			
			var arr_mgr = [];
		    // 체크한 항목만 취득
		    var checked_mgr = $("input[name='mgr_check']:checked");
		    $(checked_mgr).each(function() {
		    	arr_mgr.push($(this).val());
		    });
		    
		    // 변수로 다이렉트로 담을 경우에는 가장 위에 체크한 항목이 들어감
			var checked1_mgr = $("input[name='mgr_check']:checked").val();
		    
			$("#result_mgr").text(arr_mgr);
			var arr_opt = [];
		    // 체크한 항목만 취득
		    var checked_opt = $("input[name='opt_check']:checked");
		    $(checked_opt).each(function() {
		    	arr_opt.push($(this).val());
		    });
		    
		    // 변수로 다이렉트로 담을 경우에는 가장 위에 체크한 항목이 들어감
			var checked1_opt = $("input[name='opt_check']:checked").val();
		    
		    $("#result_opt").text(arr_opt);
		    
		   // var fileTest = $("#input_file").files;
		    //console.log(fileTest);
		
			});
		$("#btnTest").click(function(){
			
			});
		$('#dealType_wol').on('click', function() {
			 var typeCheck = $('#dealType_wol:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.

			    if ( typeCheck == '월세' ) {
			        $('.radio-value-detail').attr('disabled', false); // 과일 종류를 입력하는 input 을 활성화합니다.
			        $('.radio-value-detail').focus(); // 과일 종류를 입력하는 input 에 커서를 이동시킵니다.
			    }
			    else {
			        $('.radio-value-detail2').val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
			        $('.radio-value-detail2').attr('disabled', true);// 과일 종류를 입력하는 input 을 비활성화합니다.
			        $('.radio-value-detail2').focus();
			    }
		}); 
	});	
</script>
<style type="text/css">
	
	body {
		margin :0 auto;
		width:1536px;
	    font-size: 14px;
	    font-weight: 400;
	}
	html, body {
	    display: flex;
	    flex-direction: column;
	    margin: 0px;
	    padding: 0px;
	    width: 100%;
	    height: 100%;
	    overscroll-behavior-y: contain;
	}
	/* 전체 article min-width: 80% */
	#AllWrap{
		margin :0 auto;
		-webkit-box-flex: 1;
	    flex-grow: 1;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    min-width: 20%;
	    min-height: 100%;
	    position: relative;
		
	}
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, menu, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, main, menu, nav, output, ruby, section, summary, time, mark, audio, video{
		margin: 0px;
	    padding: 0px;
	    border: 0px;
	    <!--font: inherit;
	    vertical-align: baseline;
	}
	div {
    	display: inline-block;
    }
	/* 위에는 main.jsp css(수린님꺼) */
	/* 여기서부터는 내 css */
	#menu_bigtitle{
		display: block;
	    font-size: 2em;
	    margin-block-start: 0.67em;
	    margin-block-end: 0.67em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	}
	/*내방관리 */
	#menu_btitle {
	flex: 0 0 ;
    display: flex;
    width: 1180px;
    height: 64px;
    margin: 0 auto;
	 }
	ul{
		list-style: none;
	}
	#menu_btitle > li {
		-webkit-box-flex: 1;
	    flex-grow: 1;
	    width: 100%;
	    height: 100%;
	}
	#menu_btitle > li > a{
		display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    justify-content: center;
	    height: 100%;
	    font-size: 16px;
	    line-height: 26px;
	    border: 1px solid rgb(237, 237, 237);
	}
	a{
		color: inherit;
	    text-decoration: none;
	    cursor: pointer;
	}
	#menu_btitle > li > a.active{
		color: rgb(255, 255, 255);
	    background-color: #F6323E;
	    border: 0px;
	}
	
	#ul_room_info {
		width: 100%;
	    margin-top: 30px;
	    margin-bottom: 30px;
	    padding: 21px 35px;
	    border-radius: 4px;
	    background-color: rgb(255, 255, 255);
	    border: 1px solid rgb(226, 226, 226);
	}
	#div_input_info{
		width: 100%;
	    margin-bottom: 50px;
	    border-radius: 4px;
	    box-shadow: rgb(0 0 0 / 5%) 0px 1px 5px 0px;
	    border: 1px solid rgb(226, 226, 226);
	    background-color: rgb(255, 255, 255);
	    overflow: hidden;
	}
	div {
    display: block;
	}
    
</style>
</head>
<body>
<div id="AllWrap">
<form id="insert_all" class="insert_all" method="post" action="insertHouseOK.do">
<!--  <a href="insertHouseOK.do">ok do바로가기</a>-->
<input type='button' id='my_button' value='개수 카운트' />
<section id="big_menu">
	<h1 id="menu_bigtitle">방내놓기</h1>
		<ul id="menu_btitle">
		<li><a href="insertHouse.jsp" class="active">방내놓기</a></li>
		<li><a href="insertHouse2.jsp" aria-current="page" class="">내방관리</a></li>
	</ul>
</section>
<section id="myroom_info">
		<div id="myroom_info_div">
			<ul id="ul_room_info">
				<li>전/월세 매물만 등록할 수 있습니다.<br></li>
				<li>1개의 매물만 등록 가능하며, 다방에서 직거래로 표시됩니다.</li>
				<li>등록한 매물은 30일 간 노출됩니다.</li>
				<li>여기는 방내놓기 네번째칸입니다 내방관리 위한 설명</li>
			</ul>
		</div>
</section>
<section id="type">
	<div id="div_input_info">
		<h2>매물 종류</h2>
		<table>
			<tr>
				<td>house_no:<input type="number" name="house_no" class='input_chk'></td>
				<td>종류 선택<td>
				<td><input type="radio" name="roomType" class='input_chk' value="원룸" checked>원룸</td>
				<td><input type="radio" name="roomType" class='input_chk' value="투룸">투룸</td>
				<td><input type="radio" name="roomType" class='input_chk' value="오피스텔">오피스텔</td>
			</tr>
			
			<tr>
				<td>건물 유형<td>
					<td>월세<input type="radio" class='input_chk' id="dealType_wol" name="dealType" value="월세" checked></td>
					<td><input type="text" class='input_chk' placeholder="보증금을 입력해주세요." value="" />/</td>
					<td><input type="text" class='input_chk' placeholder="월세가격을 입력해주세요." value="" /></td>
					<td>전세<input type="radio" class='input_chk' id="dealType_jeon" name="dealType" value="전세"></td>
					<td><input type="text" class='input_chk' placeholder="전세가격을 입력해주세요." value="" /></td>
			</tr>
		</table>
	</div>
</section>

<section id="basic_info">
<div id="div_input_info">
	<table>
		<h2>기본 정보</h2>
	
		<tr>
			<td>면적&nbsp;<input type="number" name="insert_area" id="insert_area">&nbsp;평&nbsp;&nbsp;</td><br>
			 <td>
			 
			 	<select id="insert_floor" name="insert_floor" class='input_chk'>
					<option>해당층수선택</option>
					<option value="1">1층</option>
					<option value="2">2층</option>
					<option value="3">3층</option>
					<option value="4">4층</option>
					<option value="5">5층</option>
					<option value="6">6층</option>
					<option value="7">7층</option>
					<option value="8">8층</option>
					<option value="9">9층</option>
					<option value="10">10층</option>
				</select>
			 </td>
			 <br>
			 <td>방향:<input type="text" id="insert_aspect" name="insert_aspect" class='input_chk' value=""placeholder="동,서,남,북 등 방향 작성">
			 <td>입주가능일:<input type="date" id="insert_date" class='input_chk' name="insert_date" value=""placeholder="">
			 </td>
		</tr>
	</table>
	</div>
</section>

<section id="addtitional_info">
<div id="div_input_info">
	<table>
		<h2>추가 정보</h2>
		<tr>
			
			<td>
				관리비&nbsp;&nbsp;
				<input type="number" id="insert_mgr" class='input_chk'>만원&nbsp;&nbsp;&nbsp;
				협의 가능<input type="radio" name="insert_mgr" class='input_chk' value="Y">
				관리비 없음<input type="radio" name="insert_mgr" class='input_chk' value="N"><br><br>
				<hr>
				<div><label>관리비항목</label>
				<p>CheckData:<span id="result_mgr"></span></p>
				<label>&nbsp;&nbsp;<input type="checkbox" id="mgr_elec" name="mgr_check" value="전기세">전기세</label>
				<label>&nbsp;&nbsp;<input type="checkbox" id="mgr_water" name="mgr_check" value="수도세">수도세</label>
				<label>&nbsp;&nbsp;<input type="checkbox" id="mgr_gas" name="mgr_check" value="가스비">가스비</label>
				<label>&nbsp;&nbsp;<input type="checkbox" id="mgr_park" name="mgr_check" value="주차이용료">주차이용료</label>			
				<label>&nbsp;&nbsp;<input type="checkbox" id="mgr_etc" name="mgr_check" value="기타">기타</label></div>			
			</td>
		<tr><br>
		
		<tr>
			<td>엘리베이터&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>가능&nbsp;<input type="radio" name="insert_elevator" value="Y"></label>
			<label>불가능&nbsp;<input type="radio" name="insert_elevator" value="N"></label>
			</td>
		</tr>
		<br>
		<tr>
			<td>발코니&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>가능&nbsp;<input type="radio" name="insert_valcony" value="Y"></label>
			<label>불가능&nbsp;<input type="radio" name="insert_valcony" value="N"></label>
			</td>
		</tr><br>
		<tr><td>주차여부&nbsp;&nbsp;
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<label>가능&nbsp;<input type="radio" name="insert_park" value="Y"></label>
			<label>불가능&nbsp;<input type="radio" name="insert_park" value="N"></label>
			</td>
		</tr><br>
		<tr><td>빌트인&nbsp;&nbsp;
			<label>있음&nbsp;<input type="radio" name="insert_builtin" value="Y"></label>
			<label>없음&nbsp;<input type="radio" name="insert_builtin" value="N"></label>
			</td>
		</tr>
		<tr><td>옵션항목&nbsp;&nbsp; 
			<!-- checkbox 한개만 하려고 할땐 prop함수 이용하기 -->
			<p>CheckData:<span id="result_opt"></span></p>
			<input type="checkbox" name="opt_check" value="주차장"><label>주차장&nbsp;</label>
			<input type="checkbox" name="opt_check" value="에어컨"><label>에어컨&nbsp;</label>
			<input type="checkbox" name="opt_check" value="냉장고"><label>냉장고&nbsp;</label>
			<input type="checkbox" name="opt_check" value="세탁기"><label>세탁기&nbsp;</label>
			<input type="checkbox" name="opt_check" value="가스레인지"><label>가스레인지&nbsp;</label>
			<input type="checkbox" name="opt_check" value="전자레인지"><label>전자레인지&nbsp;</label>
			<input type="checkbox" name="opt_check" value="엘리베이터"><label>엘리베이터&nbsp;</label>
			<input type="checkbox" name="opt_check" value="빌트인"><label>빌트인&nbsp;</label>
			</td>
		</tr>
	</table>	
	</div>
</section>
<section id="loc">
<div id="div_input_info">
	<table>
		<h2>위치 정보</h2>
		<tr>
			<th>주소</th>
			<td>
				<p>도로명,지번주소 모두 검색 가능합니다.</p>
				
				<input type="text" name="insert_loc" class='input_chk'value=""><label><a href="">검색</a></label><br>
				<div id="map" style="width:300px; height:200px;"></div>
				<!--  <a href="https://map.kakao.com/?urlX=482094&urlY=1127083&urlLevel=1&map_type=TYPE_MAP&map_hybrid=false" target="_blank">
				 	<img width="250" height="150" src="https://map2.daum.net/map/mapservice?FORMAT=PNG&SCALE=0.625&MX=482094&MY=1127083&S=0&IW=504&IH=310&LANG=0&COORDSTM=WCONGNAMUL&logo=kakao_logo" style="border: 1px solid #ccc"></a>
					--  <div class="hide" style="overflow: hidden; padding: 7px 11px; border: 1px solid #dfdfdf; border-color: rgba(0, 0, 0, .1); border-radius: 0 0 2px 2px; background-color: #f9f9f9; width: 482px;">
							<strong style="float: left;">
							<img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵"></strong>
							<div style="float: right; position: relative">
								<a style="font-size: 12px; text-decoration: none; float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000" target="_blank"
									href="https://map.kakao.com/?urlX=482094&urlY=1127083&urlLevel=1&map_type=TYPE_MAP&map_hybrid=false">지도 크게 보기</a>
							</div>
					</div>
					-->
			</td>
		</tr>
	</table>
	</div>
</section>

<section id="detail">
<div id="div_input_info">
<table>
	<h2>상세 정보</h2>
	<tr>
		<th>제목</th>
		<td><textarea class='input_chk'rows="1" cols="100" name="title" value="input_dTitle"></textarea> </td>
	</tr><br>
	<tr>
		<th>상세 설명</th>
		<td><textarea  class='input_chk' rows="5" cols="100" name="detail" value="input_detail"></textarea> </td>
	</tr>
</table>
	</div>
</section>
<section id="insert_pic">
	<div id="div_input_info">
		<table>
			<tr><td><h2>사진 등록</h2></td></tr>
			<tr>
				<td>
					<p>사진은 가로로 찍은 사진을 권장합니다.</p>
					<p>사진 용량은 최대 10MB입니다.</p>
					<p>사진은 최소 3장 이상 등록해야하며, 최대 10장까지 등록 가능합니다.</p>
				</td>
			</tr>
		</table>
		<input type=file id='input_file' class='input_chk' name="input_file" value="" multiple/><label>사진 추가하기 </label>
		<div id="uploadForm"></div>
	</div>
</section>
<section id="agree"></section><br>
</form>

<button id="btnRegister">등록하기</button><br>
<button id="btnTest">input 값 받아오기</button>
</div>
</body> 
</html>