<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ######### JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 삭제</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freedelete.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.board-container .delete .divider {
	width: 450px;
	height: 5px;
	margin-left: auto;
	margin-right: auto;
	margin-top: -10px;
	background-color: #3273B9;
}
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- board-container 시작 -->
	<div class="board-container">
		<table class="table delete">
			<tr>
				<td><h1>
						정말로 삭제하시겠습니까?&nbsp;<i class="far fa-sad-tear"></i>
					</h1>
					<div class="divider"></div></td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-default"
						onclick="location.href='/sybang/notice/detail.do?seq=${seq}';">
						<i class="fas fa-arrow-left"></i> 돌아가기
					</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='/sybang/notice/deleteok.do?seq=${seq}';">
						<i class="fas fa-trash-alt"></i> 삭제하기
					</button>
				</td>
			</tr>
		</table>

	</div>
	<!-- board-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
		
	</script>
</body>
</html>