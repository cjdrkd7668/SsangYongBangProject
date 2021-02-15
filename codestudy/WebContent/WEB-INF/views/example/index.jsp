<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Example</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/example.css">

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
				<h1>수업 예제 <small>Example</small></h1>
                
                <div class="list">
                    <div class="folder"><span class="glyphicon glyphicon-folder-close"></span> sub</div>
                    <div class="file"><span class="glyphicon glyphicon-file"></span> ex01.jsp</div>
                    <div class="file"><span class="glyphicon glyphicon-file"></span> ex02.jsp</div>
                    <div class="file"><span class="glyphicon glyphicon-file"></span> ex03.jsp</div>
                    <div class="folder"><span class="glyphicon glyphicon-folder-close"></span>member</div>
                    <div class="file"><span class="glyphicon glyphicon-file"></span> add.jsp</div>
                    <div class="file"><span class="glyphicon glyphicon-file"></span> addok.jsp</div>
                    <div class="file"><span class="glyphicon glyphicon-file"></span> remove.jsp</div>
                </div>

                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-refresh"></span>
                        	새로고침
                    </button>
                </div>
                <div style="clear:both;"></div>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
		$(".list .file").each(function(index, item) {
	        $(this).click(function() {
	            window.open("", "view", "left=20, top=20, width=" + (screen.availWidth - 70) + ", height=" + (screen.availHeight - 120));         
	        });
	    });
    </script>
</body>

</html>