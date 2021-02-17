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
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- 헤더 끝 -->



	<!-- ########## 본문 시작 -->
	<div class="main">
	
	<!-- ########## 좌측 시작 -->
	<div class="menu col-sm-12 col-md-2">

	<!-- 좌측 메뉴 사이드바-->

	<%@include file="/WEB-INF/views/inc/service_left.jsp"%>	
	
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
   

	<script type="text/javascript">
		
	</script>


</body>

</html>