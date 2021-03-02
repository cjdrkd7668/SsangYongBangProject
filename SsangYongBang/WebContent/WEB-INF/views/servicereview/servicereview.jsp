<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicereview</title>


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


.reviews {
	margin-left: 275px;
	width: 750px;
	height: 1050px;

	padding: 17px;
}

.review {
	width: 700px;
	height: 300px;
	box-shadow: 4px 4px 4px 4px #ddd;
	padding: 20px;
	position: relative;
	margin-bottom: 27px;
}

.reviewPic {
	width: 250px;
	height: 250px;
	text-align: left;
	display: inline-block;
	border: 1px solid #ddd;
	position: absolute;
	top: 18px;
}

.reviewContent {
	width: 350px;
	height: 170px;
	border: 1px solid #ddd;
	display: inline-block;
	position: absolute;
	left: 310px;
	padding-left: 15px;
	border-radius: 5px;
	
}


.reviewText {
	height: 76px;
	overflow: scroll;

}

.storeInfo {
	width: 200px;
	position: absolute;
	top: 200px;
	left: 390px;
	text-align: center;
	padding-bottom: 8px;
	border-radius: 5px;
}


.main {
	
	margin-bottom: 80px;
	
}

.end {
	height: 100px;
}

.reviewbtn {
	margin-left: 670px;
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
	<h4> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 후기 게시판</h4>
	</div>
	<button type="button" class="btn btn-default reviewbtn"><a href="/sybang/servicereview/ablelist.do">후기 쓰러 가기</a></button>
	<div class="row">
	<form method="get" action="./index.jsp" class="form-inline mt-3">
		<select name="" class="form-control mx-1 mt-2">
			<option value="청소">청소</option>
			<option value="시공">시공</option>

		</select> <input type="text" name="search" class="form-control mx-1 mt-2"
			placeholder="찾으시는 지역을 입력하세요">
		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>

	</form>			
	</div>   
	
	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="reviews">
		
			<!-- 리뷰 1개 박스 -->
			<c:forEach items="${list}" var="dto" varStatus="status">
			<div class="review">
			
			<img src="../images/clean0001.jpg" class="reviewPic">
	
			<div class="reviewContent">
			
				<h4 class="serviceCategory">서비스 후기</h4>
				<h4 class="serviceArea">${dto.address}</h4>
				<p class="reviewText">${dto.reviewContent}</p>
				
			</div>
			<div class="storeInfo">
				<h4>${dto.firmName}</h4>
				<a href="/sybang/service/ServicestoreView.do?approvalFseq=${dto.approvalFSeq}">
				<button type="submit" class="btn btn-primary mx-1 mt-2">
					상세조회
				</button>
				</a>
			</div>
			
			</div>
			</c:forEach>
			<!-- 리뷰 1개 박스 끝 -->
			
		
	
		
		
		</div>
      
   


   
   
   
   
   
   
   </div>
   <div class="end"></div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>