<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.pw').focusout(function(){
		var pwd = $("#pwd").val();
		var pwdOK = $("#pwdOK").val();
		
		if(pwd != '' && pwdOK == ''){
			null;
		}else if(pwd !=''|| pwdOK != ''){
			if(pwd == pwdOK){
				alert("비밀번호가 일치합니다.");
				$("#alert-success").css('display','inline-block');
				$("#alert-discordance").css('display','none');
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#alert-success").css('display','none');
				$("#alert-discordance").css('display','inline-block');
			}		
		}
	
	});
	
	

	$("#btnid").on("click",function(){
		$.ajax({
			url:"Id/Check",
			type:"post",
			data:{ id: $("#id").val()},
			success:function(data){
				console.log(data);
				
				if(data == 1){
					alert("사용가능한 아이디 입니다.");
				}else if(data == 0){
					alert("이미 사용 중인 아이디 입니다.");
					$('#id').select();
				}
			},
			error:function(){
				console.log("error");
			}
		})
	});
	
	
	
	
		$("#address_kakao").on("click",function(){
			new daum.Postcode({
				oncomplete: function(data){
					var roadAddr = data.roadAddress;// 도로명주소
					
					document.getElementById("address_kakao").value = roadAddr;
					
				}
			}).open();
		});
});
</script>
</head>
<body>
	<table>
		<tr>
		<th>아이디</th>
		<td><input type="text" name="id" id="id" >
			<button id="btnid">중복확인</button>
		</td>
		</tr>
		<tr>
		<th>이름</th>
		<td><input type="text" name="name" ></td>
		</tr>
		<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pwd" id="pwd" class="pw" required="required" ></td>
		<span id="alert-success" style="display:none">비밀번호가 일치합니다.</span>
		<span id="alert-discordance" style="display:none">비밀번호가 일치하지 않습니다.</span>
		</tr>
		<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="pwdOK" id="pwdOK" class="pw" ></td>
		</tr>
		<tr>
		<th>주민번호</th>
		<td><input type="text" name="jumin1" >-
			<input type="text" name="jumin2">
		</td>
		</tr>
		<tr>
		<th>주소</th>
		<td><input type="text" name="m_addr" id="address_kakao" readonly="readonly"></td>
		</tr>
		<tr>
		<th>email</th>
		<td><input type="text" name="email" ></td>
		</tr>
		<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone1" >-
			<input type="text" name="phone2" >-
			<input type="text" name="phone3" >
		</td>
		</tr>
	</table>
</body>
</html>