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
	width: 800px;
	height: 900px;
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
	height: 750px;
	
}

.list-container .jumbotron .loginbtn {
	width: 480px;
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
}

.list-container .btn-info:hover {
	opacity: .8;
}

.info {
	
	width: 400px;
	margin-left: 180px;
}

.btnArea {
	margin-top: 40px;
}

</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- list-container 시작 -->
	<div class="list-container" style="margin-top: -50px;">
		<div class="page-header">
			<h1>서비스업체 회원가입</h1>
			<!-- <div class="well well-sm" style="float:left;">총 <b>5</b>개의 자유게시판 글이 등록되어 있습니다.</div> -->
		</div>

		<div class="jumbotron">
			<!-- 로그인 form 시작 -->
			<form method="POST" action="/sybang/service/servicejoinok.do" id="join-form" enctype="multipart/form-data">
				
			<div class="form-group info">
				<lable>업체명</lable>
				<input type="text" name="id" class="form-control" required>
			</div>
			<div class="form-group info">
				<label>서비스 종류</label>
				<select class="form-control" name="categorySeq">
					<option value="1">청소</option>
					<option value="2">시공</option>
				</select>
			</div>

			<div class="form-group info">
				<label>E-mail</label>
				<input type="email" name="email" id="email" class="form-control" required>
				<input type="button" value="중복검사" id="btn1" class="btn btn-default">
				<span id="result" style="color: red;"></span>
			</div>

			
			<div class="form-group info">
				<label>PW</label>
				<input type="password" name="pw" class="form-control" required>
			</div>
			
			<div class="form-group info">
				<label>업체 주소</label>
				<input type="text" name="address" class="form-control" required>
			</div>
			<div class="form-group info">
				<label>업체 연락처</label>
				<input type="text" name="tel" class="form-control" required>
			</div>			
			<div class="form-group info">
				<label>한줄 소개글</label>
				<input type="text" name="introduction" class="form-control" required>
			</div>			
			<div class="form-group info">
				<label>업체 포트폴리오 이미지(JPG, JPEG)</label>
				<input type="file" name="portfolio" class="form-control" placeholder="Picture" required>
			</div>
						
			<div class="btnArea">			
			<button type="submit" class="btn btn-primary">회원가입</button>
			</div>

			</form>
			<!-- 로그인 form 끝 -->





		</div>



	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
	
	$("#btn1").click(function() {
		
		$.ajax({
			type: "GET",
			url: "/sybang/service/servicedata.do",
			data: "email=" + $("#email").val(),
			success: function(result) {
				//콜백 함수
				if (result == 1) {
					$("#result").css("color", "red");
					$("#result").text("이미 사용중인 아이디입니다.");
				} else {
					$("#result").css("color", "blue");
					$("#result").text("사용 가능한 아이디입니다.");
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});
	</script>
	
</body>
</html>