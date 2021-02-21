<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>editschedule</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>


.upperBar {
	margin-left: 200px;
	width: 750px;
}

.wrapper {
	margin-left: 355px;
	margin-bottom: 30px;
	width: 550px;
	height: 400px;
	padding: 17px;
	border-bottom: 2px solid #999;
	border-right: 2px solid #999;
	border-radius: 10px;

}

.btns {
	margin-left: 690px;
	margin-bottom: 100px;
	
}

.serveceInfo {
	width: 400px;
	
	margin-bottom: 25px;
	padding-left: 90px;
	
	
}


.serviceinfobtn {

	margin-right: 15px;
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
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 일정 등록하기</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="wrapper">
			<div class="email serveceInfo">
				<label>일자</label><input type="text" class="form-control">
			</div>
			<div class="serviceTel serveceInfo">
				<label>일정 진행 상태</label><input type="text" class="form-control">
			</div>
			<div class="portfolio serveceInfo">
				<label>견적서 사본</label><input type="text" class="form-control">
			</div>
			
		</div>

		<div class="btns">
			<button type="button" class="btn btn-default serviceinfobtn">취소하기</button>
			<button type="button" class="btn btn-success serviceinfobtn">등록하기</button>
			
		</div>
   


   
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>