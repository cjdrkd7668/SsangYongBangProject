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

	<!-- 헤더가 codestudy 양식대로 쓰면.. 참조가 안됨... 어쩔수 없이 여기 헤더 코드 넣음.. -->
	
	<div class="container">
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
	
	<div class="container">
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
							<h4 class="modal-title" id="myModalLabel">내 요청서 작성하기</h4>
						</div>
						<div class="modal-body">
							<form action="./evaluationRegisterAction.jsp" method="POST">
								<div class="form-row">
									<div class="form-group col-sm-6">
										<label>강의명</label> <input type="text" name="lectureName"
											class="form-control" maxlength="20">
									</div>
									<div class="form-group col-sm-6">
										<label>교수명</label> <input type="text" name="pName"
											class="form-control" maxlength="20">
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-sm-4">
										<label>수강 년도</label> <select name="lectureYear"
											class="form-control">
											<option value="2011">2011</option>
											<option value="2012">2012</option>
											<option value="2013">2013</option>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
										</select>
									</div>
									<div class="form-group col-sm-4">
										<label>수강 학기</label> <select name="semesterDivide"
											class="form-control">
											<option value="1학기" selected>1학기</option>
											<option value="2학기">2학기</option>
										</select>
									</div>
									<div class="form-group col-sm-4">
										<label>강의 구분</label> <select name="lectureDivide"
											class="form-control">
											<option value="전공" selected>전공</option>
											<option value="교양">교양</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label>제목</label> <input type="text" name="evaluationTime"
										class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea name="evaluationContent" class="form-control"
										maxlength="2000" style="height: 180px;"></textarea>
								</div>
								<div class="form-row">
									<div class="form-group col-sm-3">
										<label>총합</label> <select name="totalScore"
											class="form-control">
											<option value="5" selected>5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1">1</option>

										</select>
									</div>
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
	</div>
          
            
    <!-- 본문 중간 -->



	<div class="container pt-3">   
	
		<div class="well well-sm">후기</div>

	
		<div class="row">
			<!-- left content -->
			<div class="col-sm-6">
				<h4>청소 <span class="label label-default">New</span></h4>
								
				<div class="row">
				  
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      <img src="..." alt="...">
				      <div class="caption">
				        <h3>Thumbnail label</h3>
				        <p>...</p>
				        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
				      </div>
				    </div>
				  </div>
				
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      <img src="..." alt="...">
				      <div class="caption">
				        <h3>Thumbnail label</h3>
				        <p>...</p>
				        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
				      </div>
				    </div>
				  </div>
				</div>	

			</div>
			<!-- right content -->
			<div class="col-sm-6">
				<h4>시공 <span class="label label-default">New</span></h4>
		<!-- 
				<p>생생 후기</p>
				<p>너무나 만족스럽습니다.</p>
		
		 -->
				<div class="row">

					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="..." alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="..." alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
		
	</div>
	
	
	
	
	<!-- ########## 본문 끝 -->
	
	<!-- 이것도.. codesudy처럼 가져오는 게 안됨.. -->
	<script>
    
    </script>
</body>

</html>