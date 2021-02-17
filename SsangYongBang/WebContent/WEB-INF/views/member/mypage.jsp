<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/mypage.css">
<style>
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<div class="container">
		<div class="page-header">
			<h1>회원정보 수정</h1>
		</div>

		<table class="table">
			<tr>
				<td>아이디
				</td>
				<td>hong</td>
			</tr>
			<tr>
				<td>비밀번호
				</td>
				<td><input type="password"> <label><input
						type="checkbox">비밀번호 변경</label></td>
			</tr>
			<tr>
				<td>이름
				</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td>생년월일
				</td>
				<td>1999년 9월 9일</td>
			</tr>
			<tr>
				<td>휴대폰번호
				</td>
				<td><input type="text" value="010-1234-5678"></td>
			</tr>
			<tr>
				<td>이메일
				</td>
				<td><input type="text" value="hong@test.com"></td>
			</tr>
			<tr>
				<td>주소
				</td>
				<td><input type="button" class="btn btn-default"
					value="우편번호 찾기"> <input type="text">
					<p>
						<input type="text">
					</p></td>
			</tr>
		</table>

		<div class="container">
			<button class="btn btn-default">정보 수정</button>
			<button class="btn btn-default">취소</button>
		</div>

	</div>

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>