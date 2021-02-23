<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Board</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/board.css">

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
			
				<h1>자유 게시판 <small>Board</small></h1>
				
				
				<c:if test="${not empty search}">
                <div class="message well well-sm">
                    '${search}'(으)로 ${list.size()}건의 게시물을 검색했습니다.
                </div>
                </c:if>
                
                <!-- 검색은 주로 GET을 사용한다.(상태 유지를 위해서) -->
                <form id="searchForm" method="GET" action="/codestudy/board/list.do">
                <div class="input-group search">
                
                    <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon2" id="search" name="search" required value="${search}">
                    
                    <span class="input-group-addon" id="basic-addon2" style="cursor:pointer;" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></span>
                </div>
                </form>
                <div style="clear:both;"></div>
                
                
                <table class="table table-hover list">
                    <thead>
                        <tr>
                            <th>추천</th>
                            <th>제목</th>
                            <th>이름</th>
                            <th>날짜</th>
                            <th>읽음</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    	<c:if test="${list.size() == 0}">
                    	<tr>
                    		<td colspan="5" style="text-align:center;">게시물이 없습니다.</td>
                    	</tr>
                    	</c:if>
                    	
                    	<c:forEach items="${list}" var="dto">
                        <tr>
                            <td>1</td>
                            <td>
                            	
                            	
                            	<a href="/codestudy/board/view.do?seq=${dto.seq}&search=${search}&page=${nowPage}" 
                       	style="margin-left: ${dto.depth * 30}px;">
                       			
                       			<c:if test="${dto.depth > 0}">
                       			<span class="glyphicon glyphicon-share-alt"></span>
                       			</c:if>
                       			${dto.subject}
                       			
                       			</a>
                            	
                            	<!-- 첨부파일 유무 -->
                            	<c:if test="${not empty dto.filename}">
                            		<span class="glyphicon glyphicon-floppy-disk"></span>
                            	</c:if>
                            	
                            	<!-- 댓글 수 -->
                            	<c:if test="${dto.ccount > 0}">
                            	<span class="badge">${dto.ccount}</span>
                            	</c:if>
                            	
                            	<!-- 최신글 -->
                            	<c:if test="${dto.gap < 1}">
                            		<span class="label label-danger">new</span>
                            	</c:if>
                            	
                            </td>
                            <td>${dto.name}</td>
                            <td>${dto.regdate}</td>
                            <td>${dto.readcount}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

				<!-- 
                <div class="btn-group fbtns" role="group" aria-label="...">
                    <button type="button" class="btn btn-default active"><span class="glyphicon glyphicon-th-list"></span></button>
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span></button>
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-heart"></span></button>
                </div>
 				-->
 				
                <nav class="pagebar">
                    <ul class="pagination">
                        ${pagebar}
                    </ul>
                </nav>
                

                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do';">
                        <span class="glyphicon glyphicon-th-list"></span>
                        목록
                    </button>
                    
                    <!-- 로그인 O -> 버튼 출력 -->
                    <c:if test="${not empty id}">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/write.do?reply=n';">
                        <span class="glyphicon glyphicon-plus"></span>
                        쓰기
                    </button>
                    </c:if>
                    
                    
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
    
    </script>
</body>

</html>