<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/admin.css">
<link rel="stylesheet" href="/sybang/css/board.css">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>	
	<div class="container">
	
		<h1 class="welcome">방 관리<small> 회원이 게시한 방 정보</small></h1>
		
		<table class="table table-hover table-type-list">
			<thead class="board-table-head">
				<tr>
					<th scope="col" class="text-center">제목</th>
					<th scope="col" class="text-center ">글쓴이</th>
					<th scope="col" class="text-center">작성일</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
				<c:forEach items="${armList}" var="armdto">
				<tr>
					<td class="text-left">
						<a href="/sybang/admin/room/view.do?seq=${armdto.seq}&page=${nowPage}">
						${armdto.subject}
						</a>
					</td>
					<td class="text-center">${armdto.name}</td>
					<td class="text-center">${armdto.regDate}</td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>
		
		<!-- pagination -->
	    <nav class="nav-pagination">
		  	<ul class="pagination">
			    ${pageBar}
		  	</ul>
		</nav>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>
