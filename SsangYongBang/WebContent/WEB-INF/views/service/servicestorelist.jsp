<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicestorelist</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">
<%@include file="/WEB-INF/views/inc/asset.jsp" %>


<style>

.row {
	margin-left: 50px;
	margin-bottom: 30px;
}

.wrapperUp {
	margin-left: 60px;
	margin-bottom: 60px;
}

.wrapper {
	margin-left: 70px;
	margin-bottom: 70px;
}

.subwrapper {
	width: 900px;
	margin-bottom: 40px;
}

.storeInfo {
	width: 230px;
	height: 400px;
	display: inline-block;
	margin-right: 40px;
	margin-bottom: 30px;
	padding-top: 15px;
	padding-bottom: 15px;
	float: left;
	
}

.thumbnail {
	height: 370px;
	
}

.introduction {
	height: 80px;
	overflow: scroll;
}

.main {
	margin-bottom: 100px;
}

.pagebar {
	margin-left: 600px;
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
	<div class="menu col-sm-12 col-md-2">

	<!-- 좌측 메뉴 사이드바 -->
	 
	<%@include file="/WEB-INF/views/inc/service_left.jsp"%>	

	</div>
	<!--좌측화면 끝 ##########  -->
	
	
	
	<!-- ########## 내용 시작 -->
	<div class="content col-sm-12 col-md-10">
	
	<!-- 본문 상단 -->
	<div class="row">
	<h4> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 전문업체 찾기</h4>
	</div>
	
	<div class="wrapperUp">
	<form id="searchForm" method="get" action="/sybang/service/ServicestoreList.do" class="form-inline mt-3">
		<select name="categoryNum" id="categoryNum" class="form-control mx-1 mt-2">
			<option value="청소">청소</option>
			<option value="시공">시공</option>

		</select> <input type="text" name="search" id="search" class="form-control mx-1 mt-2"
			placeholder="찾으시는 지역을 입력하세요">
		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
		
	</form>
	</div>


	<!-- 본문 중간 -->

	
	<div class="wrapper">
	    <div class="subWrapper"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
		<div>
			
			<c:forEach items="${list}" var="dto">
			  <div class="storeInfo">
			    <div class="thumbnail">
			      <img src="../images/${dto.portfolio}" alt="...">
			      <!-- 더미 정보의 이미지 경로 수정 필요. ../images/ 글을 붙이거나 서비스 이용 이미지폴더 따로만들어 해당 경로 붙이기 -->
			      <div class="caption">
			        <h3>${dto.id}</h3>
			        <p>${dto.address}</p>
			        <p class="introduction">${dto.introduction}</p>
			      </div>
			    </div>
			  </div>
			 
			  
			</c:forEach>

	    </div>
	    
	</div>
	
	</div>
	<!-- 한 줄에 3개의 업체가 뜨게끔 하기 -->
	
		
	
	</div>
	
	 				
	    <nav class="pagebar">
	        <ul class="pagination">
	            ${pagebar}
	        </ul>
	    </nav>
	
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	

	

	<script>
    
    </script>
</body>

</html>