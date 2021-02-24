<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freelist.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.list-container .num {
	width: 70px;
}

.list-container .title {
	width: 500px;
	margin-left: 10px;
	text-align: left;
}

.list-container .writer {
	width: 180px;
}

.list-container .date {
	width: 120px;
}

.list-container .readcount {
	width: 80px;
}
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- list-container 시작 -->
	<div class="list-container">
		<div class="page-header">
			<h2>
				<strong> <span class="blue">&nbsp;&nbsp;&nbsp;&nbsp;공지사항</span>&nbsp;<i class="fas fa-flag"></i></strong>
			</h2>
			<div class="divider"></div>

		</div>
		
		<%-- <!-- 검색했을 때 출력 -->
		<c:if test="${not empty search }">
			<div class="well well-sm">
				<div class="blue">'${search}'</div>
				(으)로 검색 결과 총 ${list.size() }개의 게시글이 있습니다.
			</div>
		</c:if>


		<!-- 검색 form 태그 시작 -->
		<form method="GET" action="/sybang/notice/freelist.do" id="search-form">
			<div class="search">
				<input type="text" name="search" id="search" class="form-control"
					value="${search }" placeholder="검색어를 입력하세요.">
				<button type="button" class="form-control"
					onclick="$('#search-form').submit();">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- 검색 form 태그 끝 --> --%>

		<table class="table table-hover table-default">
			<tr>
				<th class="num">번호</th>
				<th class="title" style="text-align: center;">제목</th>
				<th class="writer">글쓴이</th>
				<th class="date">작성일</th>
				<th class="readcount">조회</th>
			</tr>
			
			<!-- 게시글이 하나도 없을 때 -->
			<c:if test="${list.size() == 0 }">
				<tr>
					<td colspan="5" style="text-align: center;">게시물이 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach items="${list }" var="dto">
				<tr>
					<td class="num">${dto.seq }</td>
					<td class="title">
					<a href="/sybang/notice/detail.do?seq=${dto.seq}&page=${nowPage}">
					${dto.subject }&nbsp;
					<%-- <!-- 댓글 수 -->
					<c:if test="${dto.ccount > 0 }">
						<span class="badge" style="background-color: #486BB8;">${dto.ccount }</span>
					</c:if> --%>
					
					<!-- 최신 글일 경우 -->
					<c:if test="${dto.gap < 1 }">
						<span class="badge"
							style="background-color: red;">N</span>
					</c:if>
					
						</a>
						</td>
					<td class="writer">${dto.adminname } <b>관리자</b></td>
					<td class="date">${dto.regdate }</td>
					<td class="readcount">${dto.readcount }</td>
				</tr>
			</c:forEach>

		</table>


		<!-- page-bar 시작 -->
		<nav class="page-bar">
			<ul class="pagination">
				${pagebar }
			</ul>
		</nav>
		<!-- page-bar 끝 -->

		<div class="btns btn-group">

			<c:if test="${not empty email && access == 3 }">
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/notice/post.do'">
					<i class="fas fa-pencil-alt"></i> 글쓰기
				</button>
			</c:if>
			<!-- <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-trash"></span> 삭제하기
        </button> -->
		</div>

	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>