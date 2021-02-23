<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
				<h1>쪽지 <small>Message</small></h1>
                
                <table class="message table table-bordered">
                	<tr>
                		<th style="width: 200px;">보낸회원</th>
                		<td>${dto.sname}(${dto.sid})</td>
                	</tr>
                	<tr>
                		<th>보낸날짜</th>
                		<td>${dto.regdate}</td>
                	</tr>
                	<tr>
                		<th>내용</th>
                		<td>${dto.content}</td>
                	</tr>
                </table>
                
                <div class="btns">
                	<button type="button" class="btn btn-default" onclick="location.href='/codestudy/member/message.do';">
                	돌아가기</button>
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
    
		let flag = true;
	
		$("#btnAll").click(function() {
			
			if (flag) {
				$("input[name=mseq]").prop("checked", true);
				$("input[name=mseq]").parent().css("background-color", "#EEE");
				$("input[name=mseq]").parent().next().css("background-color", "#EEE");
			} else {
				$("input[name=mseq]").prop("checked", false);
				$("input[name=mseq]").parent().css("background-color", "transparent");
				$("input[name=mseq]").parent().next().css("background-color", "transparent");
			}
			
			flag = !flag;
			
		});
		
		$("input[name=mseq]").change(function() {
			
			if ($(this).prop("checked")) {
				$(this).parent().css("background-color", "#EEE");
				$(this).parent().next().css("background-color", "#EEE");
			} else {
				$(this).parent().css("background-color", "transparent");
				$(this).parent().next().css("background-color", "transparent");
			}
			
		});
		
		
		$("#btnSend").click(function() {
			
			//최소 1명이상 체크?
			//alert($("input[name=mseq]:checked").length);
			
			if ($("input[name=mseq]:checked").length == 0) {
				alert("최소 1명 이상 선택하세요.");
				return;
			}
			
			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력하세요.");
				$("#content").focus();
				return;
			}
			
			//쪽지 보내기
			this.form.submit();	
		
			
		});
		
		
	
    </script>
</body>

</html>









