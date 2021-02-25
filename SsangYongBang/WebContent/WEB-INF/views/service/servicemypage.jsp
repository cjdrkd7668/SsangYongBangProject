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
	margin-left: 130px;
	width: 750px;
	display: inline-block;
}

.leftSide {
	margin-top: 30px;
	width: 150px;
	float: left;
	
}

.wrapper {
	margin-left: 300px;
	width: 680px;
	height: 800px;
	padding: 17px;
}

.mypageMenu {
	
	padding-top: 10px;
}


.mypage {

	width: 600px;
	list-style: none;
	
}

.mypageItem {
	font-size: 1.7em;
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
	<div class="leftSide">
	<%@include file="/WEB-INF/views/inc/service_left.jsp"%>	
	</div>	

		<!--좌측화면 끝 ##########  -->
    
   <!-- 본문 상단 -->
   
   	<div class="upperBar">
   
		<div class="row">
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 마이 페이지</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="wrapper">
			<ul class="mypage">
				<li class="mypageItem"><span class="mypageMenu"><a href="/sybang/service/editserviceinfo.do">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 프로필 관리</a></span>
				</li>
				<li class="mypageItem"><span class="mypageMenu"><a href="/sybang/request/receivedrequestlist.do">
				<span class="glyphicon glyphicon-pencil aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;받은 요청서</a></span>
				</li>
				<li class="mypageItem"><span class="mypageMenu"><a href="/sybang/servicescheduler/servicescheduler.do">
				<span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정 관리</a></span>
				</li>
				<li class="mypageItem"><span class="mypageMenu"><a href="/sybang/servicesales/saleschart.do">
				<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매출 조회</a></span>
				</li>
				<li class="mypageItem"><span class="mypageMenu">
				<span class="glyphicon glyphicon-pencil aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 충전</span></li>
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