<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중개사 공간</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/broker.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/roomlist.css">

<style>
.title {
	text-align: left;
    padding-left: 15px;
}



</style>

</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>

	<div class="container">
		<h1>등록된 매물</h1>

		<div class="list-container">
			<div class="well well-sm" style="float: left;">
				총 <b>5</b>개의 방이 등록되어 있습니다.
			</div>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" class="text-center">번호</th>
					<th scope="col" class="text-center" style="width: 250px;">제목</th>
					<th scope="col" class="text-center">작성자</th>
					<th scope="col" class="text-center">날짜</th>
					<th scope="col" class="text-center">거래 상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td class="title"><a href="/sybang/broker/house/housedetail.do">🟥🟥단기방1등👍최저가약속🟥🟥단독테라스/고급형복층</a></td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>거래 완료</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="title">방 올립니다.</td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>미거래</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="title">방 올립니다.</td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>미거래</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="title">방 올립니다.</td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>미거래</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="title">방 올립니다.</td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>미거래</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="title">방 올립니다.</td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>거래완료</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="title">방 올립니다.</td>
					<td>홍길동</td>
					<td>2020.02.18</td>
					<td>거래완료</td>
				</tr>
			</tbody>
		</table>
		<!-- pagination -->
		<nav class="nav-pagination">
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>


	</div>







	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>