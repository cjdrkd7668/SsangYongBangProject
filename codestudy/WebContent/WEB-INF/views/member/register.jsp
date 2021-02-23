<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Register</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/register.css">

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
				<h1>가입 <small>Register</small></h1>
                
                <form method="POST" action="/codestudy/member/registerok.do" enctype="multipart/form-data" id="form1">
                
                <div class="registerbox panel panel-default">
                    <div class="panel-heading">Register</div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" id="name" name="name" placeholder="Name" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="text" id="id" name="id" placeholder="ID" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="email" id="email" name="email" placeholder="Email" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="password" id="pw" name="pw" placeholder="Password" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="password" id="cpw" name="cpw" placeholder="Confirm Password" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="file" id="pic" name="pic" placeholder="Picture" class="form-control">
                            </li>
                            <li class="list-group-item">
                                <button type="submit" class="btn btn-default">
                                    <span class="glyphicon glyphicon-ok"></span>
                                    	가입
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
                
                </form>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
    
		//<form onsubmit="">
		// - 폼이 전송되기 바로 직전에 발생하는 이벤트
		$("#form1").submit(function(evt) {
			
			//암호 & 암호 확인이 일치하는지?
			if ($("#pw").val() != $("#cpw").val()) {
				alert("암호가 일치하지 않습니다.");
				
				//폼 전송을 취소
				//evt == window.event
				evt.preventDefault(); //발생한 이벤트의 동작을 없던일로 취소
				return false; //발생한 이벤트의 동작을 없던일로 취소
			}
			
		});
	
    </script>
</body>

</html>








