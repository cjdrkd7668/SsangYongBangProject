<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ######### JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 수정</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freedetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>

/* 글 작성자 */
#content-name {
	padding-left: 20px;
	float: left;
	width: 220px;
}

/* 글 작성일 */
#content-date {
	float: left;
	width: 200px;
	padding-left: 20px;
}

/* 글 조회수 */
#content-readcount {
	float: left;
	width: 479px;
	padding-left: 20px;
}

.hidebtn {
	display: none;
}

.showbtn {
	display: block;
}
</style>
</head>
<body style="overflow-y: scroll;">

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- board-container 시작 -->
	<div class="board-container" style="height:100%;">
		

		<!-- form 태그 시작 -->
		<form method="POST" action="/sybang/board/freeeditok.do">
		<!-- 자유게시판 글 시작 -->
		<table class="table table-default tbl-content ">
			<tr>
				<td colspan="3"
					style="height: 30px; color: gray; padding-left: 20px;">자유게시판</td>
			</tr>
			<tr>
				<td colspan="3" id="content-title"
					style="height: 40px; font-weight: bold;"><input type="text" name="subject" id="subject" class="form-control" style="font-size: 1.2em;"value="${dto.subject}" required></td>
			</tr>
			<tr id="content-profile">
				<td id="content-name">${dto.authorname }</td>
				<td id="content-date">${dto.regdate }</td>
				<td id="content-readcount">조회&nbsp;&nbsp;<small class="blue">${dto.readcount }</small></td>
			</tr>
			<tr>
				<td colspan="3" id="content-content"><textarea type="text" name="detail" id="detail"
							class="form-control" style="height: 200px; width: 890px; font-size: 1.1em; resize: none; box-shadow: 1px 0px 3px #486BB8;"
							required>${dto.detail }</textarea></td>
			</tr>
			
		</table>
		

		<hr style="width: 850px;">
		
		<div class="btns btn-group btn2" style="float: right;">

			<!-- 본인이 쓴 글일 경우 -->
			<c:if test="${dto.authorseq.equals(seq)}">
				<button type="submit" class="btn btn-info"
					style="background-color: #486BB8;">
					<span class="glyphicon glyphicon-ok"></span> 수정하기
				</button>
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/board/freedetail.do?seq=${dto.seq}';">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button>
			</c:if>
		</div>
		
		<!-- 현재 글 번호 넘겨 주기 -->
			<input type="hidden" name="seq" value="${dto.seq }">
		<!-- 자유게시판 글 끝 -->
		</form>

	</div>
	<!-- board-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
		var cmtbtn = document.getElementById("cmtbtn");
		var cmtform = document.getElementById("cmtform");

		cmtform.classList.toggle("hidebtn");

		cmtbtn.onclick = function() {
			cmtform.classList.toggle("showbtn");
		};
	</script>
</body>
</html>