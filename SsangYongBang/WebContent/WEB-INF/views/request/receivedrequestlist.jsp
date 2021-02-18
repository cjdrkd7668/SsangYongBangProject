<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>receivedrequestlist</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%--datepicker를 쓰기 위해 CDN으로 가져온 플러그인들. --%>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    <script type='text/javascript'>

    $(function(){

        $('.input-group.date').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyy/mm/dd",

            language: "kr"

        });

    });

    </script>

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
	<h4> <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> 받은 요청서</h4>
	</div>
	
	<div class="row">
	<form method="get" action="./index.jsp" class="form-inline mt-3">
		<!-- 데이트피커 -->	
		<div class="input-group date">
            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>

		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>

	</form>
	</div>


	<!-- 본문 중간 -->


	
	<!-- 본문 중간 -->
	<hr></hr>
	
	<div class="row">
	    <div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
	
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="../images/interiormark.jpg" alt="...">
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
											<form action="./requestRegister.jsp" method="POST">
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
					<p>주소지</p>
					<p>가옥구조, 면적</p>
					<p>서비스 시작 희망일: 2020-01-01</p>
					<p>상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.</p>
				</div>



		
		
		
		
	</div>
	
	</div>
	<!-- 1줄에 받아본 견적서 1개씩 뜨도록 하기 -->
	
	<hr></hr>
	
	<div class="row">
	    <div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
	
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="../images/cleanmark.jpg" alt="...">
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
											<form action="./requestRegister.jsp" method="POST">
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
					<p>주소지</p>
					<p>가옥구조, 면적</p>
					<p>서비스 시작 희망일: 2020-01-01</p>
					<p>상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.상세전달내용입니다.</p>
				</div>



		
		
		
		
	</div>
	
	</div>
	<!-- 1줄에 받아본 견적서 1개씩 뜨도록 하기 -->

	

	
	
	
	
	
	</div>
	<!-- ########## 본문 끝 -->
	
	<!-- 푸터가져오기 -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>	
	

	<script>
	
	(function($){
		$.fn.datepicker.dates['kr'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		};
	}(jQuery));

	
    </script>
</body>

</html>