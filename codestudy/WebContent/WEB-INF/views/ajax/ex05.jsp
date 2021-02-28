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
					
					<input type="button" value="Text" id="btn1" class="btn btn-default">
					<hr>
					<div id="result1"></div>
					
					<hr>
					
					<input type="button" value="XML" id="btn2" class="btn btn-default">
					<hr>
					<div id="result2"></div>
					
					<hr>
					
					<input type="button" value="JSON" id="btn3" class="btn btn-default">
					<hr>
					<div id="result3"></div>
					
					<hr>
					
					<select id="selBuseo">
						<option value="">부서를 선택하세요.</option>
						<c:forEach items="${list}" var="buseo">
						<option value="${buseo}">${buseo}</option>
						</c:forEach>
					</select>					
					<hr>					
					<table id="tblList" class="table table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>부서</th>
								<th>직위</th>
								<th>급여</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
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
	
		//text
		$("#btn1").click(function() {
			$.ajax({
				type: "GET",
				url: "/codestudy/ajax/ex05textdata.do",
				dataType: "text", //**** 돌려받는 데이터를 XML 형식으로 받겠다.
				success: function(result) {
					
					//$("#result1").text(result);
					
					//홍길동,20,서울시 강남구 역삼동
					let temp = result.split(",");
					$("#result1").append("<div>" + temp[0] + "</div><div>" + temp[1] + "</div><div>" + temp[2] + "</div>");
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
		
		//xml
		$("#btn2").click(function() {
			$.ajax({
				type: "GET",
				url: "/codestudy/ajax/ex05xmldata.do",
				dataType: "xml", //**** 돌려받는 데이터를 XML 형식으로 받겠다.
				success: function(result) {
					
					//result -> <data>홍길동</data>
					//result -> XMLDocument 객체 -> DOM or jQuery
					
					//$("#result2").text($(result).find("data").text());
					
					
					//result
					/*
					<data>
						<name>홍길동</name>
						<age>22</age>
						<address>서울시 강동구 천호동</address>
					</data>
					
					
					
					<data>
						<user>
							<name>홍길동</name>
							<age>22</age>
							<address>서울시 강동구 천호동</address>
						</user>
					</data>
					*/
					
					//console.log($(result).find("name").text());
					//console.log($(result).find("age").text());
					//console.log($(result).find("address").text());
					
					$(result).find("user").each(function(index, item) {
						//alert($(item).html());
						console.log($(item).find("seq").text());
						console.log($(item).find("name").text());
						console.log($(item).find("id").text());
						console.log($(item).find("email").text());
						console.log(" ");
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});	
		
		//json
		$("#btn3").click(function() {
			$.ajax({
				type: "GET",
				url: "/codestudy/ajax/ex05jsondata.do",
				dataType: "json", //**** 돌려받는 데이터를 XML 형식으로 받겠다.
				success: function(result) {
					//result -> {"name":"홍길동", "age":"20", "address":"서울"}
										
					//console.log(result.name);
					//console.log(result.age);
					//console.log(result.address);
					
					$(result).each(function(index, item) {
						console.log(item.seq);
						console.log(item.name);
						console.log(item.id);
						console.log(item.email);
						console.log(" ");
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});	
		
		
		
		$("#selBuseo").change(function() {
		
			if ($(this).val() != "") {
				
				$.ajax({
					type: "GET",
					url: "/codestudy/ajax/ex05jsondata.do",
					data: "buseo=" + $(this).val(),
					dataType: "json",
					success: function(result) {
						
						$("#tblList tbody").html("");// 초기화
						
						$(result).each(function(index, item) {
							
							let temp = "";
							
							temp += "<tr>";
							temp += "<td>" + item.num + "</td>";
							temp += "<td>" + item.name + "</td>";
							temp += "<td>" + item.buseo + "</td>";
							temp += "<td>" + item.jikwi + "</td>";
							temp += "<td>" + item.basicpay + "</td>";
							temp += "</tr>";
							
							$("#tblList tbody").append(temp);
							
						});
						
						
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
				
			}
			
		});
		
		
	
    </script>
</body>

</html>













