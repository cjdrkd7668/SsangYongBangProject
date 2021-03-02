<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/memberlogin.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

.list-container {
	width: 1000px;
	height: 600px;
	margin: 30px auto;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1px;
	padding: 20px;
}

.list-container .page-header {
	text-align: center;
}

.list-container .jumbotron {
	position: relative;
	top: 0;
	left: 0;
	height: 400px;
	text-align: center;
}

.list-container .jumbotron .loginbtn {
	width: 500px;
	padding-top: 80px;
	display: inline-block;
}

.list-container .jumbotron .loginbtn input[type="text"], .list-container .jumbotron .loginbtn input[type="password"]
	{
	text-align: left;
	margin: 10px;
	width: 250px;
	float: left;
}

.list-container .jumbotron .checkbox-inline {
	width: 150px;
	height: 60px;
	margin-left: 240px;
	padding-top: 20px;
	float: left;
}

.list-container .jumbotron .checkbox-inline input[type="checkbox"] {
	display: inline-block;
}

.list-container .jumbotron .btns {
	width: 300px;
	height: 60px;
	margin-left: 23px;
	float: left;
	padding-top: 15px;
}

.list-container .btn-info {
	width: 150px;
	height: 100px;
	font-size: 1.3em;
	background-color: #3B79BC;
	opacity: .8;
}

.list-container .btn-info:hover {
	width: 150px;
	height: 100px;
	font-size: 1.3em;
	background-color: #3B79BC;
	opacity: 1;
}
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- list-container 시작 -->
	<div class="list-container" style="margin-top: -50px;">
		<div class="page-header">
			<h1>로그인</h1>
		</div>

		<div class="jumbotron">
			<!-- 로그인 form 시작 -->
			<form method="POST" action="/sybang/member/loginok.do"
				id="login-form">
				<div class="loginbtn">
					<input type="text" name="email" id="email" class="form-control"
						placeholder="아이디" required> <input type="password"
						name="pw" id="pw" class="form-control" placeholder="비밀번호" required>
					<button type="submit" class="btn btn-info"
						style="background-color: #486BB8; font-size: 1.3em;">로그인</button>
				</div>
				<div>
					<label class="checkbox-inline"><input type="checkbox">아이디
						저장</label>

					<div class="btns">

						<button type="button" class="btn btn-default">회원 가입</button>
						<button type="button" class="btn btn-default">
							아이디 찾기
							<button type="button" class="btn btn-default">비밀번호 찾기</button>
							<!-- 간편 로그인 -->
						<!-- <button type="button" class="btn btn-default" onclick="test('star23@naver.com','star23');">1번회원</button> -->
					</div>
				</div>
			</form>
			<!-- 로그인 form 끝 -->





		</div>



	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>