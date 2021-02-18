<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicechat</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>

	
	#roomWrap {
	    width: 200px;
	}
	
	#roomList {
	    border: 1px solid #0084FF;
	    border-radius: 5px;
	}
	
	#roomHeader {
	    background-color: #0084FF;
	    color: #fff;
	    height: 40px;
	    font-size: 18px;
	    line-height: 40px;
	    text-align: center;
	    border-radius: 5px;
	}
	
	.roomEl {
	    text-align: center;
	    border-bottom: 1px solid #f0f0f0;
	    padding: 10px 0px;
	    cursor: pointer;
	}
	
	.roomEl:hover{
	    background: #f0f0f0;
	}
	
	.roomEl.active{
	    background: #f0f0f0;
	}
	
	
	
	#chatWrap {
	    width: 600px;
	    border: 1px solid #ddd;
	}
	
	#chatHeader {
	    height: 60px;
	    text-align: center;
	    line-height: 60px;
	    font-size: 25px;
	    font-weight: 900;
	    border-bottom: 1px solid #ddd;
	}
	
	#chatLog {
	    height: 700px;
	    overflow-y: auto;
	    padding: 10px;
	}
	
	.myMsg {
	    text-align: right;
	}
	
	.anotherMsg {
	    text-align: left;
	    margin-bottom: 5px;
	}
	
	.msg {
	    display: inline-block;
	    border-radius: 15px;
	    padding: 7px 15px;
	    margin-bottom: 10px;
	    margin-top: 5px;
	
	}
	
	.anotherMsg > .msg {
	    background-color: #f1f0f0;
	
	}
	
	.myMsg > .msg {
	    background-color: #0084FF;
	    color: #fff;
	}
	
	.anotherName {
	    font-size: 12px;
	    display: block;
	}
	
	#chatForm {
	    display: block;
	    width: 100%;
	    height: 50px;
	    border-top: 2px solid #f0f0f0;
	}
	
	#message {
	    width: 85%;
	    height: calc(100% - 1px);
	    border: none;
	    padding-bottom: 0;
	}
	
	#message:focus {
	    outline: none;
	}
	
	#chatForm > input[type=submit] {
	    outline: none;
	    border: none;
	    background: none;
	    color: #0084FF;
	    font-size: 17px;
	}

	#memberWrap{
    width: 200px;
}

	#memberList {
	    border: 1px solid #aaaaaa;
	    border-radius: 5px;
	}
	
	#memberHeader {
	    height: 40px;
	    font-size: 18px;
	    line-height: 40px;
	    padding-left: 15px;
	    border-bottom: 1px solid #f0f0f0;
	    font-weight: 600;
	}
	
	.memberEl {
	    border-bottom: 1px solid #f0f0f0;
	    padding: 10px 20px;
	    font-size: 14px;
	}
	
	
	#contentCover{
    width: 1280px;
    margin: 0 auto;
    padding-top: 20px;
    display: flex;
    justify-content: space-around;
}



</style>



</head>

<body>
	<!-- 헤더 가져오기 -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- 헤더 끝 -->



	<!-- ########## 본문 시작 -->
	<div class="main">
	
	<!-- ########## 좌측 시작 -->
	<div class="menu col-sm-12 col-md-2">

	<!-- 좌측 메뉴 사이드바 -->
	 
	<%@include file="/WEB-INF/views/inc/service_left.jsp"%>	

	</div>
	<!--좌측화면 끝 ##########  -->
	
	
	
	<!-- ########## 내용 시작 -->
	<div class="content col-sm-12 col-md-10">
	
	<!-- 본문 상단 -->
	<div class="row">
	<h4> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 전문업체 찾기</h4>
	</div>
	
	<div class="row">
	<form method="get" action="./index.jsp" class="form-inline mt-3">
		<select name="" class="form-control mx-1 mt-2">
			<option value="청소">청소</option>
			<option value="시공">시공</option>

		</select> <input type="text" name="search" class="form-control mx-1 mt-2"
			placeholder="찾으시는 지역을 입력하세요">
		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>

	</form>
	</div>


	<!-- 본문 중간 -->
	
	<!-- 방목록
	
						<div id="roomWrap">
						<div id="roomList">
							<div id="roomHeader">채팅 방 목록</div>
							<div id="roomSelect">
								<div class="roomEl active" data-id="1">Everyone</div>
								<div class="roomEl" data-id="2">VueJS</div>
								<div class="roomEl" data-id="3">ReactJS</div>
								<div class="roomEl" data-id="4">AngularJS</div>
							</div>
						</div>
					</div>
	
	 -->

	
	<div class="row">
    	<div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			<!-- 
			<div id="contentWrap">
				<nav>
					<span id="nav-header"> 1:1 온라인 상담 </span> <span id="logoutBtn">뒤로 가기</span>
				</nav>
				<div id="contentCover">
				
					<div id="chatWrap">
					
						<div id="chatHeader">Everyone</div>
						<div id="chatLog">
							<div class="anotherMsg">
								<span class="anotherName">Jo</span> <span class="msg">Hello,
									Nice to meet you.</span>
							</div>
							<div class="myMsg">
								<span class="msg">Nice to meet you, too.</span>
							</div>
						</div>
						
						<form id="chatForm">
							<input type="text" autocomplete="off" size="30" id="message"
								placeholder="메시지를 입력하세요"> <input type="submit"
								value="보내기">
						</form>
						
					</div>
					
					<div id="memberWrap">
						<div id="memberList">
							<div id="memberHeader">사람</div>
							<div id="memberSelect"></div>
						</div>
					</div>
					
				</div>
			</div>			
			
			
			 -->
				
			<!-- 채팅창 -->>

			<div class="text-center" id="contentWrap">

				<div id="contentCover">
				
					<div id="chatWrap">
					
						<div id="chatHeader">1 : 1 온라인 상담</div>
						
						<!-- 채팅말풍선이 보이는 사각형 -->
						<div id="chatLog">
						
							<div class="anotherMsg">
								<span class="anotherName">업체명</span> <span class="msg">안녕하세요</span>
							</div>
							
							<div class="myMsg">
								<span class="msg">내용입니다.</span>
							</div>
							
						</div>
						<!-- 채팅 말풍선 보이는 사각형 끝 -->
						
						<!-- 메시지 전송 박스 -->
						<form id="chatForm">
							<input type="text" autocomplete="off" size="30" id="message"
								placeholder="메시지를 입력하세요"> <input type="submit"
								value="보내기">
						</form>
						<!-- 메시지 전송박스 끝 -->
					</div>
					

					
				</div>
			</div>			
			<!-- 채팅창 끝 -->

	
			</div>
	
	</div>

	
	
	
	
	
	
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>	
	

	

	<script>
    
    </script>
</body>

</html>