<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이방어때</title>
<style type="text/css">
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, menu, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, main, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
}
* {
    box-sizing: border-box;
}
*, html, body {
    font-family: NanumGothic, -apple-system, sans-serif;
}
div {
    display: block;
}

body {
    display: block;
    margin: 8px;
}

body {
    -webkit-box-flex: 1;
    flex-grow: 1;
    font-size: 14px;
    font-weight: 400;
}

body {
    line-height: 1;
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

header {
    display: block;
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section {
    display: block;
}

h1, h2, h3, h4, h5, h6, strong, b {
    font-weight: 700;
}

h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

menu, ol, ul {
    list-style: none;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}


select, input, textarea, a {
    outline: none;
    
}

a {
    color: inherit;
    text-decoration: none;
    cursor: pointer;
    list-style:none

    
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    list-style:none
   
}
#root {
    width: 100%;
    height: 100%;
}

#content {
    -webkit-box-flex: 1;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    -webkit-box-pack: justify;
    justify-content: space-between;
    min-width: 1200px;
    min-height: 100%;
    position: relative;
}



.gTKzxs {
    width: 100%;
    -webkit-box-flex: 1;
    flex-grow: 1;
}

.GKbby {
    width: 100%;
    flex: 0 0 auto;
}
.GKbby > div {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    flex-direction: column;
    height: 278px;
    position: relative;
}

.GKbby > div {
    width: 1200px;
    height: 100%;
    margin: 0px auto;
    padding: 0px 10px;
}

.gcERMH {
    margin: 80px 0px 64px;
    font-size: 46px;
    line-height: 70px;
    letter-spacing: -1px;
    font-weight: 700;
}

.bVcIUf {
    flex: 0 0 auto;
    display: flex;
    width: 1180px;
    height: 64px;
    margin: 0px auto;
}

.bVcIUf > li {
    -webkit-box-flex: 1;
    flex-grow: 1;
    width: 100%;
    height: 100%;
}	
li {
    display: list-item;
    text-align: -webkit-match-parent;
    list-style:none
}

.bVcIUf > li > a.active {
    color: rgb(255, 255, 255);
    background-color: rgb(34, 34, 34);
    border: 0px;
}

.bVcIUf > li > a {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 100%;
    font-size: 16px;
    line-height: 26px;
    border: 1px solid rgb(237, 237, 237);
    text-decoration: none;
    
}

.bVcIUf > li + li > a {
    border-left: 0px;
}



.gTKzxs > div {
    width: 1200px;
    height: 100%;
    margin: 0px auto;
    padding: 0px 10px;
}

.hSQrIK {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    justify-content: space-between;
    margin-top: 50px;
}

.jIytUb {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 500px;
}




</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">



$(function(){
	
	
	sessionStorage.setItem("id","lee");
	
	
	var al_no = sessionStorage.getItem("id");
	//var obj = JSON.parse(al_no);
	//console.log(obj);
	
	
	
	$.ajax({
		url:"alarm_inter",
		data:{id:id},
		success:function(arr){
			console.log(arr)
	 	$.each(arr, function(){
			 	var li = $("<li></li>");
				var p = $("<p></p>").html(this.al_content);
				
				$(li).append(p);
				$(ul).append(li);
				
	 	});	
				
			 	/* $(li).append(div);
				$(div).append(Heart);
				$(Heart).append(button);
				$(div).append(a);
				$(a).append(room_img);
				$(room_img).append(room_img2);
				$(room_img2).append(img);
				$(room_img2).append(room_end);
				$(a).append(room_title);
				$(room_title).append(room_title2);
				$(room_title).append(room_end2);
				$(".kgYtxa").append(li); 
					
				}); */
				
	
			
			
		}
	})
	
	
});






</script>
</head>
<body>
	<div id ="root">
		<div id="content">
			<div class ="gTKzxs">
				<header class ="GKbby">
					<div>
						<h1 class= "gcERMH">알림</h1>
						<ul class ="bVcIUf">
							<li>
								<a  href="alram.jsp">전체 알림</a>
			
							</li>
							<li>
								<a  href="alram2.jsp">댓글 알림</a>
								
							</li>
							<li>
								<a  aria-cuttent="page" class="active" href="alram3.jsp">찜한 방 알림</a>
								
							</li>	
						</ul>
					</div>
				
				</header>
				<div>
					<div>
						<div class="jIytUb">
							<ul>
								<li>
									<p>자신의 매물이 찜한 방에 등록 되었습니다.</p>
								<li>
							</ul>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
		
	
</body>
</html>