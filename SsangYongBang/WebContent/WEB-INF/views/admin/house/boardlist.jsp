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
	
		<h1 class="welcome">매물 관리<small> 중개사가 게시한 부동산 매물</small></h1>
		
		<table class="table table-hover table-type-list">
			<thead class= "board-table-head">
				<tr>
					<th scope="col" class="text-center">제목</th>
					<th scope="col" class="text-center ">글쓴이</th>
					<th scope="col" class="text-center">작성일</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">★강남 시내 내부 오피스텔★ 주요 역 1분 이내 초대박 매물! 놓치지 마세요~</a></td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-11</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">2021-02-17</td>
				</tr>
				<tr>
					<td class="text-left">제목입니다제목입니다</td>
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
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>
