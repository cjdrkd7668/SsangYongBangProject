<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>requestlist</title>

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
	<h4> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 고객 요청서 전체 리스트</h4>
	</div>
	
	<div class="row">
	<form method="GET" action="/sybang/request/requestlist.do" class="form-inline mt-3">
		<select name="search" id="search" class="form-control mx-1 mt-2">
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
						<c:if test="${dto.stype == '시공'}">
						<img src="../images/interiormark.jpg" alt="...">
						</c:if>
						<c:if test="${dto.stype == '청소'}">
						<img src="../images/cleanmark.jpg" alt="...">
						</c:if>
					</div>
					<div>
																<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary btn-lg"
								data-toggle="modal" data-target="#myModal">견적서 보내기</button>
				
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
											<h4 class="modal-title" id="myModalLabel">견적서 작성하기</h4>
										</div>
										<div class="modal-body">
											<form action="/sybang/request/writeok.jsp" method="POST">
												<div class="form-row">
													<div class="form-group col-sm-12">
														<label>예상비용(숫자만 입력하세요)</label> <input type="text" name=""
															class="form-control" maxlength="30">
													</div>
												</div>
												
												<div class="form-row">
												<div class="form-group">
													<label>견적서 상세 내용</label>
													<textarea name="evaluationContent" class="form-control"
														maxlength="2000" style="height: 180px;"></textarea>
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
							<!-- 모달 끝 -->
					</div>
				</div>

				<div>
					<h3>서비스 요청&nbsp;&nbsp;<span class="label label-success">2019-08-08</span></h3>
					<p>${dto.address}</p>
					<p>${dto.shape}, ${dto.area}</p>
					<p>서비스 시작 희망일: ${dto.desiredDay }</p>
					<p>${dto.detail}</p>
				</div>



		
		
		
		
	</div>
	
	</div>
	</c:forEach>
	
	
				<!-- 하단 페이지 넘기기 -->
                <nav class="pagebar">
                    <ul class="pagination">
                        ${pagebar}
                    </ul>
                </nav>
                

                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/sybang/request/requestlist.do';">
                        <span class="glyphicon glyphicon-th-list"></span>
                        목록
                    </button>
	
				<!-- 페이지 넘기기 끝 -->
	
	
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>		

	

	<script>
    
    </script>
</body>

</html>