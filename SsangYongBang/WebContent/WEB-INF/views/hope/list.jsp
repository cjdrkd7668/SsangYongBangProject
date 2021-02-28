<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 입주 정보</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopelist.css">

<style type="text/css">
	.list-container{height:auto;}
</style>

</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- list-container 시작 -->
	<div class="list-container" style="margin-top: -50px;">
		<div class="page-header">
			<h1>희망 입주 정보</h1>
			<div class="well well-sm" style="float:left;">총 <b>5</b>개의 희망 입주글이 등록되어 있습니다.</div>
		</div>

		<table class="table table-hover">   
			<tr>
				<th><input type="checkbox"></th>
				<th>번호</th>
				<th>거래 유형</th>
				<th>가격</th>
				<th>지역</th>
				<th>면적</th>
				<th>방 개수</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr onclick="location.href='/sybang/hope/view.do'">
					<td><input type="checkbox"></td>
					<td>${dto.seq}</td>
					<td>${dto.hDType}</td>
					<td>${dto.hDType=="월세"?dto.hRentPrice:dto.hPrice}</td>
					<td>${dto.hAddress}</td>
					<td>${dto.hArea}</td>
					<td>${dto.hRoomNum}</td>
				</tr>
			</c:forEach>
		</table>
	

	<!-- page-bar 시작 -->
	<nav class="page-bar">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="active"><a href="/sybang/house/list.do">1</a></li>
			<li><a href="/sybang/house/list.do">2</a></li>
			<li><a href="/sybang/house/list.do">3</a></li>
			<li><a href="/sybang/house/list.do">4</a></li>
			<li><a href="/sybang/house/list.do">5</a></li>
			<li><a href="#" aria-label="Next"> <span
					aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
	<!-- page-bar 끝 -->

	<div class="btns btn-group">
		<button type="button" class="btn btn-default" onclick="location.href='/sybang/hope/post.do'">

			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</button>
		<button type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-trash"></span> 삭제하기
		</button>
	</div>

</div>
<!-- list-container 끝 -->
	
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>