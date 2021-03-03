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

.estimate {
	margin-left: 20px;
}

</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- list-container 시작 -->
	<div class="list-container" style="margin-top: -50px;">
		<div class="page-header">
			<h1>해당 일정에 대한 견적서</h1>
			

		<div class="jumbotron">
	
			<div class="estimate">
				<img src="../files/${EstimateURL}" alt="" style="width:600px; height: 700px;">
			</div>
			
		</div>




		</div>



	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
	
	
	</script>
	
</body>
</html>