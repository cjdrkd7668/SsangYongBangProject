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


	<!-- 본문 중간 -->

	
	<div class="row">
	    <div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
		<div>
		
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="../images/interior0001.jpg" alt="...">
			      <div class="caption">
			        <h3>업체명</h3>
			        <p>주소</p>
			        <p>소개글</p>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="../images/interior0001.jpg" alt="...">
			      <div class="caption">
			        <h3>업체명</h3>
			        <p>주소</p>
			        <p>소개글</p>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="../images/interior0001.jpg" alt="...">
			      <div class="caption">
			        <h3>업체명</h3>
			        <p>주소</p>
			        <p>소개글</p>
			      </div>
			    </div>
			  </div>

	    </div>
	    
	</div>
	
	</div>
	<!-- 한 줄에 3개의 업체가 뜨게끔 하기 -->
	
	
	<div class="row">
	    <div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
		<div>
		
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="../images/interior0001.jpg" alt="...">
			      <div class="caption">
			        <h3>업체명</h3>
			        <p>주소</p>
			        <p>소개글</p>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="../images/interior0001.jpg" alt="...">
			      <div class="caption">
			        <h3>업체명</h3>
			        <p>주소</p>
			        <p>소개글</p>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src="../images/interior0001.jpg" alt="...">
			      <div class="caption">
			        <h3>업체명</h3>
			        <p>주소</p>
			        <p>소개글</p>
			      </div>
			    </div>
			  </div>

	    </div>
	    
	</div>
	
	</div>	
	<!-- 한 줄에 3개의 업체가 뜨게끔 하기 -->
	
	
	
	
	
	
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	

	

	<script>
    
    </script>
</body>

</html>