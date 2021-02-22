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
	<div class="container mg-ad">
	
		<h1 class="welcome">광고중인 중개사 목록<small> 매물에 대한 광고 권한을 구매한 중개사</small></h1>
		
		<table class="table table-hover table-type-list">
			<colgroup>
				<col width="px">
				<col width="px">
				<col width="px">
				<col width="px">
				<col width="px">
			</colgroup>
			<thead class= "board-table-head">
				<tr>
					<th scope="col" class="text-center">중개사</th>
					<th scope="col" class="text-center">결제수단</th>
					<th scope="col" class="text-center">가격(원)</th>
					<th scope="col" class="text-center">구매일</th>
					<th scope="col" class="text-center">종료일</th>
					<th scope="col" class="text-center">광고 권한</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
				<tr>
					<td class="text-left">대박공인중개사사무소</td>
					<td class="text-center">삼성카드</td>
					<td class="text-center">88000</td>
					<td class="text-center">2021-02-08</td>
					<td class="text-center">2021-03-09</td>
					<td class="text-center bg-positive">활성</td>
				</tr>
				<tr>
					<td class="text-left">센트럴부동산공인중개사사무소</td>
					<td class="text-center">NH농협카드</td>
					<td class="text-center">264000</td>
					<td class="text-center">2021-01-04</td>
					<td class="text-center">2021-02-02</td>
					<td class="text-center bg-negative">비활성</td>
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
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
	</script>

</body>
</html>
