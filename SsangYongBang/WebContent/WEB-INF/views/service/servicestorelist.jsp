<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicestorelist</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/sybang/css/servicemain.css">

<style>

</style>
</head>

<body>
	<!-- 헤더 가져오기 -->
	<!-- 아직 공통 양식 헤더가 정해지지 않아서 임시로 이곳에 헤더 넣음 -->
	
	<div class="header">
	<nav class="navbar nav-pills">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> 
					<img alt="Brand" src="../images/logo_transparent.png" style="width: 85px; margin-top:-25px">
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">홈
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
						</li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">방 찾기
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>


					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">희망 입주하기
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">방 내놓기
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>


					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
						</li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">청소/시공
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
							
					</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	</div>
	<!-- 헤더 끝 -->



	<!-- ########## 본문 시작 -->
	<div class="main">
	
	<!-- ########## 좌측 시작 -->
	<div class="menu col-sm-12 col-md-2">
`   <!-- 좌측 메뉴(회원정보?) 시작 이것도 공통양식 정해지면 파일 따로 빼기  -->
	<div class="login panel panel-default">
		<div class="panel-heading">
			비회원 <small>not-login</small>
		</div>
		<div class="panel-body">
			<div class="pic" style="background-image:url(/codestudy/pic/${pic});"></div>
			<div class="itemlist">
				<div class="item">${name}(${id})</div>
				<div class="item">${email}</div>
				<div class="item">${regdate.substring(0, 10)}</div>
				<div class="item">&nbsp;</div>
			</div>
		</div>
	</div>

	
	<!-- 좌측메뉴 회원정보 끝 -->


	<!-- 좌측 메뉴 사이드바  이것도 공통양식 정해지면 파일 따로 빼기-->

	 <ul class="list-group">
      <li class="list-group-item"><a href="#">메뉴1</a></li>
      <li class="list-group-item"><a href="#">메뉴2</a></li>
      <li class="list-group-item"><a href="#">메뉴3</a></li>
      <li class="list-group-item"><a href="#">메뉴4</a></li>
      <li class="list-group-item"><a href="#">메뉴5</a></li>
      <li class="list-group-item"><a href="#">메뉴6</a></li>
      <li class="list-group-item"><a href="#">메뉴7</a></li>
    </ul>
	

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
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
	

	

	<script>
    
    </script>
</body>

</html>