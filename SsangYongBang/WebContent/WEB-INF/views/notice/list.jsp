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
<link rel="stylesheet" href="/sybang/css/globallist.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.listContainer .noticeTable {
	width: 450px;
	height: 300px;
	float: left;
	margin: 20px;
}

.listContainer .noticeTable {
	border: 0px;
}

.listContainer .noticeTable tr:nth-child(1) {
	height: 40px;
	overflow: scroll;
}

.listContainer .noticeTable tr:nth-child(1) th {
	text-align: center;
	font-size: 1em;
}

.listContainer .noticeTable tr:nth-child(2) img {
	display: block;
	
	height: 120px;
	margin: 5px auto;
}

.listContainer .noticeTable tr:nth-child(3), .listContainer .noticeTable tr:nth-child(4),
	.listContainer .noticeTable tr:nth-child(5) {
	text-align: center;
	font-size: 1em;
	color: #444;
}
.listContainer .page-header small {
	position: relative;
	top: 5px;
	font-size: 0.6em;
}
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- listContainer 시작 -->
    <div class="listContainer">

        <div class="page-header">
            <h1><strong>공지사항 <i class="fas fa-user-alt blue"></i> <i class="fas fa-flag blue"></i>&nbsp;&nbsp;&nbsp;</strong><small>사진을 클릭하시면 자세한 공지사항을 확인하실 수 있습니다.</small></h1>
            <div class="divider"></div>
        </div>


		<!-- 게시글이 하나도 없는 경우 -->
		<c:if test="${list.size() == 0 }">
		<table class="noticeTable table table-bordered table-hover item">
        	<tr>
        		<td style="text-align: center;">게시물이 없습니다.</td>
        	</tr>	
        </table>
        </c:if>
        <!-- noticeTable 시작 -->
        <c:forEach items="${list }" var="dto">
        <table class="noticeTable table table-bordered table-hover item">
            <tr>
                <th class="well bluebg">${dto.subject }
                	<!-- 최신 글 시작 -->
	                <c:if test="${dto.gap < 1 }">
	                	<span class="badge" style="background-color: red;">N</span>
	                </c:if>
	                <!-- 최신 글 끝 --></th>
            </tr>
            <tr>
                <td>
	                <a href="/sybang/notice/detail.do?seq=${dto.seq}&page=${nowPage}">
	                <img class="thumbnail" src="../images/${dto.imageurl }">&nbsp;
	                
	                </a>
                </td>
            </tr>
            <tr>
                <td>${dto.adminname } <small>관리자</small></td>
            </tr>
            <tr>
                <td>${dto.regdate }</td>
            </tr>
            <tr>
                <td>조회 (<b class="blue">${dto.readcount }</b>)</td>
            </tr>
        </table>
        </c:forEach>
        <!-- noticeTable 끝 -->

		<div style="clear: both;"></div>
		<!-- page-bar 시작 -->
        <!-- <nav class="col-md-8 page-bar" style="text-align:right;"> -->
        <nav class="page-bar">
			<ul class="pagination">
				${pagebar }
			</ul>
		</nav>
		<!-- page-bar 끝 -->
		
		<c:if test="${not empty email && access == 3 }">
			<!-- <button type="button" class="col-md-4 btn btn-default writeBtn" onclick="location.href='/sybang/notice/post.do'"> -->
			<button type="button" class="btn btn-default writeBtn bluebg" onclick="location.href='/sybang/notice/post.do'">
				<i class="fas fa-pencil-alt"></i> 글쓰기
			</button>
		</c:if>
		
		<div style="clear: both;"></div>
		
    </div>
    <!-- listContainer 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>

    </script>
	

	
</body>
</html>