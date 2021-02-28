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
				
					<h2>1:1 채팅</h2>
					
					<table class="table table-bordered" style="width: 500px;">
						<tr>
							<td>
								<input type="text" name="user" id="user" class="form-control" placeholder="유저명">
							</td>
							<td>
								<button type="button" id="btnConnect" class="btn btn-default">접속하기</button>
								<button type="button" id="btnDisconnect" class="btn btn-default" disabled>종료하기</button>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="output" style="width: 100%; height: 300px; padding: 15px; overflow: auto;"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="message" id="message" placeholder="대화내용을 입력하세요." class="form-control" disabled>
							</td>
						</tr>
					</table>
					
					
				
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
    
		//서버 주소
		const url = "ws://211.63.89.31:8090/codestudy/chatserver";
		let ws;
		
		$("#btnConnect").click(function() {
			
			//유저명 확인
			if ($("#user").val().trim().length != 0) {

				//서버와 소켓 연결하기
				ws = new WebSocket(url);
				
				ws.onopen = function(evt) {
					
					//연결 직후 해야 할일
					print($("#user").val(), "연결되었습니다.");
					
					$("#user").attr("disabled", true);
					$("#btnConnect").attr("disabled", true);
					$("#btnDisconnect").attr("disabled", false);
					$("#message").attr("disabled", false);
					$("#message").focus();
					
				};
				
				ws.onclose = function(evt) {
					print($("#user").val(), "종료되었습니다.");
				};
				
				ws.onerror = function(evt) {
					console.log(evt);
				};
				
				ws.onmessage = function(evt) {
					
					//홍길동#안녕하세요.
					var index = evt.data.indexOf("#");
					var user = evt.data.substring(0, index);
					var txt = evt.data.substring(index + 1);
					
					print(user, txt);
					
					$("#output").scrollTop($("#output").prop("scrollHeight"));
					
				};
				
			} else {
				alert("유저명을 입력하세요.");
				$("#user").focus();
			}
			
		});
		
		$("#btnDisconnect").click(function() {
			ws.close();
		});
		
		$("#message").keyup(function() {
			
			//서버에 메시지 보내기
			//강아지#안녕하세요.
			if (event.keyCode == 13) {
				ws.send($("#user").val() + "#" + $("#message").val());
				
				print($("#user").val(), $("#message").val());
				
				$("#message").val("");
				$("#message").focus();
				
				//스크롤바를 가장 밑으로 내려라
				$("#output").scrollTop($("#output").prop("scrollHeight"));
			}
			
		});
		
		$("#user").keydown(function() {
			if (event.keyCode == 13) {
				$("#btnConnect").click();
			}
		});
		
		function print(user, msg) {
			
			let temp = "";
			
			temp += "<div>";
			temp += "[" + user + "] ";
			temp += msg;
			temp += "<span style='font-size:11px; color: #777;'>";
			temp += (new Date()).toLocaleTimeString();
			temp += "</span>";
			temp += "</div>";
			
			$("#output").append(temp);
			
		}
		
	
    </script>
</body>

</html>













