<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Auth</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/auth.css">

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
				<h1>인증 <small>Auth</small></h1>
                
                <form method="POST" action="/codestudy/member/login.do" id="form1">
                
                <div class="loginbox panel panel-default">
                    <div class="panel-heading">Auth</div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" id="id" name="id" placeholder="ID" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="password" id="pw" name="pw" placeholder="Password" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <button type="submit" class="btn btn-default">
                                    <span class="glyphicon glyphicon-lock"></span>
                                   	로그인
                                </button>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- 테스트용 -->
	                <button type="button" onclick="test('hong','111');">홍길동</button>
	                <button type="button" onclick="test('test','111');">테스트</button>
	                <button type="button" onclick="test('hohoho','111');">호호호</button>
                    
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
    
		function test(id, pw) {
			$("#id").val(id);
			$("#pw").val(pw);
			$("#form1").submit();//에뮬레이터 함수
			
		}
	
    </script>
</body>

</html>









