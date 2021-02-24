<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>estimatelist</title>


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
	<h4> <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> 받은 견적서</h4>
	</div>
	
	<div class="row">
	<form method="get" action="./index.jsp" class="form-inline mt-3">
		<select name="" class="form-control mx-1 mt-2">
			<option value="청소">청소</option>
			<option value="시공">시공</option>
		</select>
		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>

	</form>
	</div>


	<!-- 본문 중간 -->


	
	<!-- 본문 중간 -->
	<c:forEach items="${list}" var="dto">
	<hr></hr>
	
	<div class="row">
	    <div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
	
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="../images/${dto.portfolio}" alt="...">
					</div>
				</div>

				<div>
					<h3>${dto.firmName} 견적서번호: ${dto.seq}</h3>
					<p>${dto.estimatedCost}</p>
					<p>${dto.eContent }</p>
				</div>


			<div>
							<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">채택 & 1:1 상담</button>

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
							<h4 class="modal-title" id="myModalLabel">채택 확인</h4>
						</div>
						<div class="modal-body">
						
							<!-- 모달창 상태에서 별도의 쓰기화면 이동없이 바로 정보가 전송된다. 채택ok로 이동시키기 -->
							<form action="/sybang/estimate/adoptok.do" method="POST">
								<div class="form-row">
									<p>정말 채택하시겠습니까?</p>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">채택</button>
								</div>
								<!-- 채택 시, 들고갈 정보들 hidden 태그로 가져가지 -->
								<!--  지금작성해놓은 것은.. 제일 맨처음에 만들어졌던 것의 정보가 가져와지는 셈임... 그러면 안되고 해당 정보를 가져와야 함 -->
								<input type="hidden" name="approvalFSeq" value="${dto.approvalFSeq}"> <!-- 업체승인번호 -->
								<input type="hidden" name="estimate1thSeq" value="${dto.seq}"> <!-- 받은견적서의 번호 -->
								<input type="hidden" name="firmName" value="${dto.firmName}"> <!--업체 이름 -->
							</form>

						</div>

					</div>
				</div>
			</div>
			<!-- 모달 끝 -->
			
			</div>
		
		
		
		
	</div>
	
	</div>
	</c:forEach>
	<!-- 1줄에 받아본 견적서 1개씩 뜨도록 하기 -->

	
	
	
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>	
	
	

	

	<script>
    
    </script>
</body>

</html>