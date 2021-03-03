<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>중개사 회원가입</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/join.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

.list-container {
	width: 815px;
	height: 750px;
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
	height: 625px;
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
}

.list-container .btn-info:hover {
	opacity: .8;
}



.table-boardered-join {
	width: 500px;
    position: relative;
    left: 23%;
}

.btn-default-check {
	position: relative;
    right: 141px;
    bottom: 10px;
}

#result {
	color: blue;
    width: 160px;
    position: absolute;
    left: 220px;
    top: 58px;
}
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- list-container 시작 -->
	<div class="list-container" style="margin-top: -50px;">
		<div class="page-header">
			<h1>중개사 회원가입</h1>
		</div>

		<div class="jumbotron">
			<!-- 회원가입 form 시작 -->
			<form method="POST" action="/sybang/broker/joinok.do" id="login-form" enctype="multipart/form-data" style="position: relative; right: 34px;">
				<table class="table table-boardered table-boardered-join">
		            <tr>
		                <th style="height: 100px">아이디</th>
		                <td>
		                	<input type="email" class="form-control" name="email" id="email" placeholder="email주소를 입력하시오." required>
		                	<br>
 			                <input type="button" value="중복검사" id="btn1" class="btn btn-default btn-default-check">
			            	<span id="result" style="color: red;"></span>
		                </td> 
		            </tr>
		            
		            <tr>
		                <th>패스워드</th>
		                <td><input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호를 입력하시오." required></td>      
		            </tr>
		             
		            <tr>
		                <th>사업자 대표명</th>
		                <td><input type="text" class="form-control" name="name" id="name" placeholder="ex) 홍길동" required></td>        
		            </tr>
		            
		            <tr>
		                <th>사업자 상호</th>
		                <td><input type="text" class="form-control" name="businessName" id="businessName" placeholder="ex) 대박부동산" required></td>        
		            </tr>
		            
		            <tr>
		                <th>중개 등록번호</th>
		                <td><input type="text" class="form-control" name="brokerNum" id="brokerNum" placeholder="ex)38473298318273" required></td>        
		            </tr>
		             
		            <tr>
		                <th>주소</th>
		                <td><input type="text" class="form-control" name="address" id="address" placeholder="ex) 서울특별시 강남구 역삼동 735-1(역삼동, 한독빌딩)" required></td>        
		            </tr>
		            
		            <tr>
		                <th>전화번호</th>
		                <td><input type="text" class="form-control" name="tel" id="tel" placeholder="ex) 023451234" required></td>        
		            </tr>
	
		            <tr>
		                <th>사업자 등록번호</th>
		                <td><input type="text" class="form-control" name="businessNum" id="businessNum" placeholder="ex) 4821238496" required></td>        
		            </tr>
		             	   
		            <tr>
		                <th>서류 첨부</th>
		                <td> <input type="file" class="form-control" id="documentURL" name="documentURL" required></td>       
		            </tr>	                   	 
		             
		            <tr>
		                <td colspan="2"><input type="submit" class="btn btn-primary" value="회원가입"></td>
		            </tr>           
	       		</table>
			</form>
			<!-- 회원가입 form 끝 -->
		</div>
	</div>
	<!-- <div style="clear: both"></div> -->
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
	
	//중복검사
	$("#btn1").click(function() {
		
		$.ajax({
			type: "GET",
			url: "/sybang/broker/brokerdata.do",
			data: "email=" + $("#email").val(),
			success: function(result) {
				//콜백 함수
				console.log(result);
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