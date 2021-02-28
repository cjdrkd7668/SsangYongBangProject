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
<title>내가 등록한 매물</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>
	<div class="container">
	
		<h1 class="welcome">내가 등록한 매물</h1>
		
		<table class="table table-hover table-type-list">
			<thead class="board-table-head">
				<tr>
					<th scope="col" class="text-center col-md-6">제목</th>
					<th scope="col" class="text-center col-md-3">주소</th>
					<th scope="col" class="text-center col-md-1">거래 상태</th>
					<th scope="col" class="text-center col-md-2">작성일</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
				<c:forEach items="${hlist}" var="hdto">
				<tr>
					<td class="text-left">
						<a href="/sybang/broker/house/view.do?seq=${hdto.seq}&page=${nowPage}">
						${hdto.subject}
						</a>
					</td>
					<td class="text-center">${hdto.address}</td>
					<td class="text-center">${hdto.state}</td>
					<td class="text-center">${hdto.regdate}</td>
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
