<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Hello</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>

</style>
</head>

<body>

	<!-- ########## 상단 헤더 시작 -->	
	<%
		out.flush();
	    RequestDispatcher dheader = request.getRequestDispatcher("/inc/header.do");
	    dheader.include(request, response);
	%>
	<!-- ########## 상단 헤더 끝 -->


	<!-- ########## 본문 시작 -->
	<div class="main">

		<!-- ########## 좌측 시작 -->
		<div class="menu col-sm-12 col-md-3">
			<!-- ########## 메뉴 시작 -->
			<%
				out.flush();
			    RequestDispatcher dmenu = request.getRequestDispatcher("/inc/menu.do");
				dmenu.include(request, response);
			%>
			<!-- ########## 메뉴 끝 -->

			<!-- ########## 인증 시작 -->
			<%
				out.flush();
			    RequestDispatcher dauth = request.getRequestDispatcher("/inc/auth.do");
			    dauth.include(request, response);
			%>
			<!-- ########## 인증 끝 -->

			<!-- ########## 채팅 시작 -->
			<%
				out.flush();
			    RequestDispatcher dchat = request.getRequestDispatcher("/inc/chat.do");
				dchat.include(request, response);
			%>
			<!-- ########## 채팅 끝 -->
		</div>
		<!-- ########## 좌측 끝 -->



		<!-- ########## 내용 시작 -->
		<div class="content col-sm-12 col-md-9">
			<div>
				<h1>
					채팅 <small>Chat</small>
				</h1>
				<div style="min-height: 747px">
				
					<input type="button" id="btn1" value="클릭">
					<div id="output1"></div>
					
					<hr>
					
					<input type="button" id="btn2" value="연결하기">
					<input type="button" id="btn3" value="종료하기" disabled>
					<br><br>
					<input type="text" id="message" disabled>
					<br><br>
					<div id="output2"></div>
					
				
				</div>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	
	<script>
    
		//@ServerEndpoint("/server")
		const url = "ws://localhost:8090/codestudy/server";
		let ws;
		
		$("#btn1").click(function() {
			
			//웹소켓 -> 서버와 통신
			//1. 소켓 생성
			//2. 서버 접속
			//3. 통신(데이터 주고 받기)
			//4. 서버 접속 종료
			
			//1. + 2.
			ws = new WebSocket(url);
			
			//3. 비동기 사건 -> 이벤트 구현 + 콜백
			
			//서버와 연결되는 순간 발생
			ws.onopen = function(evt) {
				console.log("서버와 연결되었습니다.");	
				ws.send("Hello"); //나 -> 서버
			};
			
			//서버가 나에게 메시지를 보내는 순간 발생
			ws.onmessage = function(evt) {
				//서버 -> 나
				console.log("서버에서 클라이언트에게 메시지를 전송했습니다.");
				console.log(evt.data);
				
				//소켓 연결 종료
				ws.close();
			};
			
			//서버와 연결이 종료되는 순간 발생
			ws.onclose = function(evt) {
				console.log("서버와 연결이 끊겼습니다.");
			};
			
			//에러가 발생할때 발생
			ws.onerror = function(evt) {
				console.log("error", evt.data, "color: tomato");
			};
			
		});
	
		
		//연결하기
		$("#btn2").click(function() {
			
			ws = new WebSocket(url);//연결
			
			ws.onopen = function(evt) {
				
				print("연결되었습니다.");
				
				$("#btn2").attr("disabled", true);
				$("#btn3").attr("disabled", false);
				$("#message").attr("disabled", false);
				$("#message").focus();
				
			};
			
			ws.onclose = function(evt) {
				
				print("종료되었습니다.");
				
				$("#btn2").attr("disabled", false);
				$("#btn3").attr("disabled", true);
				$("#message").attr("disabled", true);
				
			};
			
			ws.onerror = function(evt) {};
			
			ws.onmessage = function(evt) {
				
				print("응답받은 데이터 : " + evt.data);
				
			};
			
		});
		
		//종료하기
		$("#btn3").click(function() {
			ws.close();
		});
		
		//메시지 보내기
		$("#message").keyup(function() {
			
			if (event.keyCode == 13) {
				
				print($("#message").val() + "를 전달했습니다.");
				
				ws.send($("#message").val()); //전송
				$("#message").val("");
				$("#message").focus();
								
			}
		});
		
		
		function print(msg) {
			$("#output2").prepend("<div>[" 
						+ (new Date()).toLocaleTimeString() + "] " + msg + "</div>");
		}
		
	
    </script>
</body>

</html>













