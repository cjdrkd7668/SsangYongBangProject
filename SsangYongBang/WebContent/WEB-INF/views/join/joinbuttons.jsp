<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/memberlogin.css">
<style>
.login-buttons .jumbotron div:first-child {
	width: 100%;
    padding-top: 86px;
    display: inline-block;
}

.login-buttons .btn-lg, .btn-group-lg>.btn {
	width: 200px;
	height: 100px;
	margin: 10px 20px;
}

#mlogin {
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
  				<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/sybang/broker/join.do'">부동산 중개사 회원가입</button>
  				<button type="button" class="btn btn-info btn-lg" id="mlogin" onclick="location.href='#'">회원 회원가입</button>
  				<button type="button" class="btn btn-success btn-lg" onclick="location.href='/sybang/service/servicejoin.do'">서비스업체 회원가입</button>
			</div>
            
            
                
            
            
        </div>

    

	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>