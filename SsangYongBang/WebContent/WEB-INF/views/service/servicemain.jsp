<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicemain</title>

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
		<div class="jumbotron">
		  <h2>청소/시공 업체</h2>
		  <p>요청서를 작성하면 무료 견적을 받아보실 수 있습니다.</p>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">무료 견적 받아보기</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">내 요청서</h4>
						</div>
						<div class="modal-body">
							<form action="./requestRegister.jsp" method="POST">
								<div class="form-row">
									<div class="form-group col-sm-6">
										<label>주소</label> <input type="text" name=""
											class="form-control" maxlength="20">
									</div>
									<div class="form-group col-sm-6">
										<label>서비스 종류</label>
										<select name="serviceCategory"
											class="form-control">
											<option value="1">청소</option>
											<option value="2">시공</option>
										</select>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-sm-6">
										<label>가옥구조</label> <select name=""
											class="form-control">
											<option value="1">아파트</option>
											<option value="2">빌라주택</option>
											<option value="3">전원주택</option>
											<option value="4">오피스텔</option>
											<option value="5">기타</option>
										</select>
									</div>
									<div class="form-group col-sm-6">
										<label>면적</label> <select name=""
											class="form-control">
											<option value="15">15평</option>
											<option value="16">16평</option>
											<option value="17">17평</option>
											<option value="18">18평</option>
											<option value="19">19평</option>
											<option value="20">20평</option>
											<option value="21">21평</option>
											<option value="22">22평</option>
											<option value="23">23평</option>
											<option value="24">24평</option>
											<option value="25">25평</option>
											<option value="26">26평</option>
											<option value="27">27평</option>
											<option value="28">28평</option>
											<option value="29">29평</option>
											<option value="30">30평</option>
											<option value="31">31평</option>
											<option value="32">32평</option>
											<option value="33">33평</option>
											<option value="34">34평</option>
											<option value="35">35평</option>
											<option value="36">36평</option>
											<option value="37">37평</option>
											<option value="38">38평</option>
											<option value="39">39평</option>
											<option value="40">40평</option>
											<option value="41">40평 이상</option>
										</select>
									</div>
									
								</div>
								<div class="form-group">
									<label>희망 날짜(데이터피커 필요)</label> <input type="text" name=""
										class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>상세내용</label>
									<textarea name="evaluationContent" class="form-control"
										maxlength="2000" style="height: 180px;"></textarea>
								</div>


								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">등록</button>
								</div>

							</form>


						</div>

					</div>
				</div>
			</div>



		</div>
		
		
          
            
    <!-- 본문 중간 -->



	<div class="container pt-3">   
	
			<div class="row">
			<!-- col-sm-6 -->
			<div class="container">
				<h4>후기</h4>
								
				<div class="row">
				  
				  <div class="col-sm-6 col-md-3">
				    <div class="thumbnail">
				      <img src="../images/clean0001.jpg" alt="...">
				      <div class="caption">
				        <h3>후기제목</h3>
				        <p>내용입니다.</p>
				       
				      </div>
				    </div>
				  </div>
				
				  <div class="col-sm-6 col-md-3">
				    <div class="thumbnail">
				      <img src="../images/interior0001.jpg" alt="...">
				      <div class="caption">
				        <h3>후기제목</h3>
				        <p>내용입니다</p>
				     
				      </div>
				    </div>
				  </div>
				  
				  <div class="col-sm-6 col-md-3">
				    <div class="thumbnail">
				      <img src="../images/interior0001.jpg" alt="...">
				      <div class="caption">
				        <h3>후기제목</h3>
				        <p>내용입니다</p>
				     
				      </div>
				    </div>
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