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

.login-buttons .jumbotron div:first-child {
    width: 500px;
    padding-top: 30px;
    display: inline-block;
}

.login-buttons .btn-lg, .btn-group-lg > .btn {
    width: 200px;
    height: 100px;
    margin: 10px 20px;
}

</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	    <!-- list-container 시작 -->
    <div class="list-container login-buttons" style="margin-top: -50px;">
        <div class="page-header">
            <h1>로그인</h1>

        </div>

        <div class="jumbotron">
            
            <div class="buttons">
  				<button type="button" class="btn btn-primary btn-lg" onclick="location.href=''">부동산 중개사 로그인</button>
  				<button type="button" class="btn btn-info btn-lg" onclick="location.href='/sybang/member/login.do'">회원 로그인</button>
  				<button type="button" class="btn btn-success btn-lg" onclick="location.href=''">서비스업체 로그인</button>
  				<button type="button" class="btn btn-danger btn-lg" onclick="location.href=''">관리자 로그인</button>
			</div>
            
            
                
            
            
        </div>

    

	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>