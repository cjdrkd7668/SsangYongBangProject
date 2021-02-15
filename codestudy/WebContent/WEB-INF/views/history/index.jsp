<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::History</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/history.css">

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
				<h1>작업 히스토리 <small>History</small></h1>
                
                <div class="history">
v0.5
- 자유 게시판 인터페이스 추가
v0.4.1
- 작업 히스토리 스크립트 구현                
v0.4
- 작업 히스토리 인터페이스 추가
v0.3
- 인증 인터페이스 추가
v0.2
- 주 메뉴 구현
v0.1
- 레이아웃 구현</div>
                <textarea class="txtHistory"></textarea>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
		var txt, lines;
	
	    function showHistory() {
	        txt = $(".history").text().trim();
	        $(".history").text("");
	
	        //라인 분리
	        lines = txt.split("\n");
	        
	        lines.forEach(function(item) {
	
	            item = item.trim();
	
	            //버전 찾기
	            if (item.startsWith("v")) {
	                $(".history").append("<h3>" + item + "</h3>");  
	            }
	
	            if (item.startsWith("-")) {
	                $(".history").append("<div>" + item + "</div>");  
	            }
	        });
	    } 
	
	    showHistory();
	
	    function syncSize() {
	        $(".txtHistory").width($(".history").width());
	        $(".txtHistory").height($(".history").height());
	    }
	
	    //크기 동기화
	    $(window).resize(function() {
	        syncSize();
	    });
	    
	
	
	    //전환
	    $(".history").dblclick(function() {
	        syncSize();
	        $(".txtHistory").val(txt);
	        $(".history").hide();
	        $(".txtHistory").show();
	    });
	
	    $(".txtHistory").keyup(function() {
	        if (event.ctrlKey && event.keyCode == 13) {
	            syncSize();
	            $(".history").text($(".txtHistory").val());
	            showHistory();
	            $(".history").show();
	            $(".txtHistory").hide();
	        }
	        event.cancelBubble = true;
	    });
    </script>
</body>

</html>