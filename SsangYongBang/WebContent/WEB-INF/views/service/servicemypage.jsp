<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicemypage</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>


.upperBar {
	margin-left: 200px;
	width: 750px;
}

.wrapper {
	margin-left: 285px;
	width: 750px;
	height: 700px;

	padding: 17px;
}

.mypageMenu {
	
	font-size: 1.7em;
	padding-top: 10px;
}


.mypage {

	width: 600px;
	list-style: none;
	
}

.mypageItem {

	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 18px;
	border-bottom: 1px solid #ddd;
	margin-bottom: 40px;
	color: #666;
}



</style>



</head>

<body>



   <!-- 헤더 가져오기 -->
   <%@include file="/WEB-INF/views/inc/header.jsp"%>
   <!-- 헤더 끝 -->



   <!-- ########## 본문 시작 -->
   <div class="main">
   
   <!-- ########## 좌측 시작 -->
	

		<!--좌측화면 끝 ##########  -->
    
   <!-- 본문 상단 -->
   
   	<div class="upperBar">
   
		<div class="row">
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 마이 서비스</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="wrapper">
			<ul class="mypage">
				<li class="mypageItem"><span class="mypageMenu">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 프로필 관리</span>
				</li>
				<li class="mypageItem"><span class="mypageMenu"><a href="/sybang/request/receivedrequestlist.do">
				<span class="glyphicon glyphicon-pencil aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;받은 요청서</span></li>
				<li class="mypageItem"><span class="mypageMenu">
				<span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정 관리</span>
				</li>
				<li class="mypageItem"><span class="mypageMenu">
				<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매출 조회</span>
				</li>
				<li class="mypageItem"><span class="mypageMenu">
				<span class="glyphicon glyphicon-pencil aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;후기 관리</span></li>
			</ul>
		</div>
      
   


   
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>