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
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- listContainer 시작 -->
    <div class="listContainer">

        <div class="page-header">
            <h1><strong>공지사항 <i class="fas fa-user-alt blue"></i> <i class="fas fa-flag blue"></i>&nbsp;&nbsp;&nbsp;</strong><small></small></h1>
            <div class="divider"></div>
        </div>

        <!-- listTable 시작 -->
        <table class="listTable table table-default table-hover">
            <tr>
                <th class="col-md-1">번호</th>
                <th class="col-md-6">제목</th>
                <th class="col-md-2">글쓴이</th>
                <th class="col-md-2">작성일</th>
                <th class="col-md-1">조회</th>
            </tr>
            
            <!-- 게시글이 하나도 없는 경우 -->
            <c:if test="${list.size() == 0 }">
            	<tr>
					<td colspan="5" style="text-align: center;">게시물이 없습니다.</td>
				</tr>
            </c:if>
            
            <c:forEach items="${list }" var="dto">
            <tr>
                <td class="col-md-1">${dto.seq }</td>
                <td class="col-md-6" style="text-align:left;">
                	<a href="/sybang/notice/detail.do?seq=${dto.seq}&page=${nowPage}">
					${dto.subject }&nbsp;
					
					<!-- 최신 글 시작 -->
					<c:if test="${dto.gap < 1 }">
						<span class="badge" style="background-color: red;">N</span></a>
					</c:if>
					<!-- 최신 글 끝 -->
					
				</td>
                <td class="col-md-2">${dto.adminname } <b>관리자</b></td>
                <td class="col-md-2">${dto.regdate }</td>
                <td class="col-md-1">${dto.readcount }</td>
            </tr>
            </c:forEach>

        </table>
        <!-- listTable 끝 -->

		<!-- page-bar 시작 -->
        <nav class="col-md-8 page-bar">
			<ul class="pagination">
				${pagebar }
			</ul>
		</nav>
		<!-- page-bar 끝 -->
		
		<c:if test="${not empty email && access == 3 }">
			<button type="button" class="col-md-4 btn btn-default writeBtn" onclick="location.href='/sybang/notice/post.do'">
				<i class="fas fa-pencil-alt"></i> 글쓰기
			</button>
		</c:if>

		<div style="clear: both;"></div>
		
    </div>
    <!-- listContainer 끝 -->

    <script>

        window.onload = function() {
            $("#search").focus();
        };
    </script>
	

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>