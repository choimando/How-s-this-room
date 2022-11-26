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
			var str = $('#insert_all').serializeArray();//모든 input값 
			console.log(str);
			//var t = $("#insert_area").val();//입력해야 하는 input type = number 중 평수 입력
			//var optSelect = $('#insert_floor option:selected').val(); //층수 선택
			//var input_mgr = $("#insert_mgr").val();
			
			
			var arr_mgr = [];
		    // 체크한 항목만 취득
		    var checked = $("input[name='mgr_check']:checked");
		    $(checked).each(function() {
		    	arr_mgr.push($(this).val());
		    });
		    
		    // 변수로 다이렉트로 담을 경우에는 가장 위에 체크한 항목이 들어감
			var checked1_mgr = $("input[name='mgr_check']:checked").val();
		    
		    $("span").text(arr_mgr);
		    
		    
		    
			
		})
		$("#btnTest").click(function(){
			var test = this.insert_all.val();
			console.log(test);
		});
	});
</script>
<style type="text/css">
	/*단추 1180 64*/
	 body{
	 	position: absolute;
	    /*top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    max-width: 100%;
	    height: auto;
		margin :0 auto;*/
	-webkit-box-flex: 1;
    flex-grow: 1;
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
*, html, body {
    font-family: NanumGothic, -apple-system, sans-serif;
}
	
	 #AllWrap{
		margin :0 auto;
		}
	
	#menu_bigtitle{
	    font-size: 2em;
	    font-weight: bold;
	    text-align: center;
	}
	/*내방관리 */
	#menu_btitle {
		display: flex;
	    width: 1180px;
	    height: 64px;
	    margin: 0 auto;
    
	 }
	ul{
		
		list-style: none;
	}
	#menu_btitle > li {
		
	    width: 80%;
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
		color:inherit;
	    text-decoration: none;
	    cursor: pointer;
	}
	#menu_btitle > li > a.active{
		color: rgb(255, 255, 255);
	    background-color: #000000;
	    border: 0px;
	}
	input[type="radio"]{
		display:none;
	}
	input[type="checkbox"]{
		display:none;
	}
	input[type="radio"]+span{
		display: inline-block;
        padding: 10px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
	}
	
	input[type="checkbox"]+span{
		display: inline-block;
        padding: 10px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
	}
	  input[type="radio"]:checked + span {
        background-color: #000000;
        color: #ffffff;
        
        }
        input[type="checkbox"]:checked + span {
        background-color: #cccccc;
        color: #333333;
        
        }
	#btnRegister{
		margin-bottom: 50px;
	}
	
	#ul_room_info {
		width: 1180px;
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
	<section id="big_menu">
		<h1 id="menu_bigtitle">방내놓기</h1>
			<ul id="menu_btitle">
			<li><a href="insertHouse.jsp" class="">방내놓기</a></li>
			<li><a href="insertHouse2.jsp" aria-current="page" class="active">내방관리</a></li>
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
</div>
</body> 
</html>