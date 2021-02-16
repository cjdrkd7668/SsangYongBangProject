<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/sybang/css/board.css">
</head>
<body>

   	<!-- header 가져오기######## -->
   	<%@include file="/WEB-INF/views/inc/header.jsp"%>
   	
	<!-- container 시작 -->
    <main class="container">
    	
    	<!-- 페이지 제목 -->
    	<div class="page-header">
  		<h1>공지사항 <small>개인정보처리방침 변경과 서비스 개선</small></h1>
		</div>
    
    <!-- 게시판 -->
	    <table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" class="text-center">제목</th>
					<th scope="col" class="text-center">글쓴이</th>
					<th scope="col" class="text-center">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-center">제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
			</tbody>
		</table>
	    
	    <!-- pagination -->
	    <nav class="nav-pagination">
		  	<ul class="pagination">
			    <li>
			    	<a href="#" aria-label="Previous">
				   		<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
					<a href="#" aria-label="Next">
				    	<span aria-hidden="true">&raquo;</span>
			      	</a>
			    </li>
		  	</ul>
		</nav>
	    
    </main>
    <!-- container 끝 -->
    
   	<!-- footer 가져오기######## -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
   
</body>
</html>