<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중개사 공간</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/broker.css">

<style>
</style>


</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>

	<div class="container">
		<h1>내 프로필</h1>
		<hr>

		<form method="POST" action="">

			<table class="table table-bordered" id="profile">
				<tr>
					<th>아이디</th>
					<td>hong123</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password"></input></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password"></input></td>
				</tr>
				<tr>
					<th>사업자 대표명</th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th>사업자 상호</th>
					<td><input type="text" value="좋은집공인중개사사무소"></input></td>
				</tr>
				<tr>
					<th>중개등록 번호</th>
					<td>38473298318273</td>
				</tr>
				<tr>
					<th>주소지</th>
					<td><input type="text" value="서울특별시 강남구 역삼동 735-1"></input></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="023451234"></input></td>
				</tr>
				<tr>
					<th>사업자 등록번호</th>
					<td>4821238496</td>
				</tr>
			</table>
			
			<div class="btns" style='float: right;'>
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-ok"></span> 수정하기
				</button>
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button>
			</div>

		</form>

	</div>







	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>