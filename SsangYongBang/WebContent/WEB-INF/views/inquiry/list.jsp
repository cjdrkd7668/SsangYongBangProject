<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
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
            <h1><strong>문의게시판 <i class="far fa-question-circle blue"></i>&nbsp;&nbsp;&nbsp;</strong><small></small></h1>
            <div class="divider"></div>
        </div>
        
        <!-- searchTable 시작 -->
        <!-- 검색 결과 알려줄 창 -->
        <table class="searchTable table table-default">
            <tr>
                <th class="col-md-6">
                	<!-- 검색 안내문 시작 -->
                	<c:if test="${not empty search }">
	                    <div class="well well-sm">
	                        <b class="blue">'${search}'</b>(으)로 검색 결과 총 <b class="blue">${list.size() }</b>개의 게시글이 있습니다.
	                    </div>
                    </c:if>
                    <!-- 검색 안내문 끝 -->
                </th>
                <th class="col-md-6">
                	<!-- 검색 form 태그 시작 -->
                	<form method="GET" action="/sybang/inquiry/list.do" id="searchForm">
	                    <input type="text" name="search" id="search" class="input-group-lg form-control" value="${search }" placeholder="검색어를 입력하세요">
	                    <button type="button" class="input-group-lg form-control submitBtn" onclick="$('#searchForm').submit();">
							<i class="fas fa-search"></i>
					    </button>
				    </form>
				    <!-- 검색 form 태그 끝 -->
                </th>
            </tr>

        </table>
        <!-- searchTable 끝 -->

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
                <td class="col-md-6 title" style="text-align:left;">
                	
                	<c:if test="${(dto.authorseq == authorseq && dto.zerobonem == access) || dto.openflag == 1 || access == 3}">
                	<a href="/sybang/inquiry/detail.do?seq=${dto.seq}&search=${search}&page=${nowPage}">
                	
					${dto.subject }&nbsp;
					<!-- 댓글 수 시작 -->
					<c:if test="${dto.ccount > 0 }">
						<span class="badge" style="background-color: #486BB8;">${dto.ccount }</span>
					</c:if>
					<!-- 댓글 수 끝 -->
					<!-- 최신 글 시작 -->
					<c:if test="${dto.gap < 1 }">
						<span class="badge" style="background-color: red;">N</span>
					</c:if>
					<!-- 최신 글 끝 -->
					</a>
					</c:if>
					
					<c:if test="${!((dto.authorseq == authorseq && dto.zerobonem == access) || dto.openflag == 1 || access == 3)}">
					<a style="cursor: not-allowed;">
					${dto.subject }&nbsp;
					<!-- 댓글 수 시작 -->
					<c:if test="${dto.ccount > 0 }">
						<span class="badge" style="background-color: #486BB8;">${dto.ccount }</span>
					</c:if>
					<!-- 댓글 수 끝 -->
					<!-- 최신 글 시작 -->
					<c:if test="${dto.gap < 1 }">
						<span class="badge" style="background-color: red;">N</span>
					</c:if>
					<!-- 최신 글 끝 -->
					</a>
					</c:if>
					
				</td>
                <td class="col-md-2">${dto.authorname }</td>
                <td class="col-md-2">${dto.regdate }</td>
                <td class="col-md-1">${dto.readcount }</td>
                
                <input type="hidden" id="authorseq" name="authorseq" value="${dto.authorseq }">
				<input type="hidden" id="zerobonem" name="zerobonem" value="${dto.zerobonem }">
				<input type="hidden" id="openflag" name="openflag" value="${dto.openflag }">
				<input type="hidden" id="seq" name="seq" value="${seq}">
				<input type="hidden" id="access" name="access" value="${access }">
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
		
		<c:if test="${not empty email && access != 3 && access != 2 }">
			<button type="button" class="col-md-4 btn btn-default writeBtn bluebg" onclick="location.href='/sybang/inquiry/post.do'">
				<i class="fas fa-pencil-alt"></i> 글쓰기
			</button>
		</c:if>

		<div style="clear: both;"></div>
		
    </div>
    <!-- listContainer 끝 -->
    
    <!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

    <script>

        window.onload = function() {
            $("#search").focus();
        };

    </script>
	

	
</body>
</html>