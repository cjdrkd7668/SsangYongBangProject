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
					Ajax
				</h1>
				<div style="min-height: 747px">

					<table class="table table-bordered">
						<tr>
							<th>아이디: </th>
							<td>
								<input type="text" id="id" class="form-control">
								<input type="button" value="중복검사" id="btn1" class="btn btn-default">
								<span id="result" style="color: red;"></span>
							</td>
						</tr>
						<tr>
							<th>이름: </th>
							<td><input type="text" id="name" class="form-control"></td>
						</tr>
						<tr>
							<th>주소: </th>
							<td><input type="text" id="address" class="form-control"></td>
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
	
		$("#btn1").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/codestudy/ajax/ex03data.do",
				//data: "key=value&key=value&key=value"
				data: "id=" + $("#id").val(),
				success: function(result) {
					//콜백 함수
					if (result == 1) {
						$("#result").css("color", "red");
						$("#result").text("이미 사용중인 아이디입니다.");
					} else {
						$("#result").css("color", "blue");
						$("#result").text("사용 가능한 아이디입니다.");
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
		});
    
    </script>
</body>

</html>













