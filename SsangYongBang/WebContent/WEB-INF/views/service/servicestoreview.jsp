<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicestoreview</title>


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

.thumbnailWrapper {
	margin-left: 300px;
	float: left;
}

.store {
	
	width: 300px;
}

.storeInfo {
	display: inline-block;
	float: left;
	margin-top: 15px;
	margin-left: 190px;
	margint-bottom: 15px;
	border-left: 4px solid #ddd;
	border-right: 4px solid #ddd;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 20px;
	border-radius: 10px;
	
}

.intro {
	width: 500px;
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
	
	<%@include file="/WEB-INF/views/inc/service_left.jsp"%>	

	<!-- 좌측 메뉴 사이드바 -->

	

	</div>
	<!--좌측화면 끝 ##########  -->
	
	
	
	<!-- ########## 내용 시작 -->
	<div class="content col-sm-12 col-md-10">
	
	<!-- 본문 상단 -->
	<div class="row">
	<h4> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 전문업체 찾기</h4>
	</div>
	
	<!-- 
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
	-->

	<!-- 본문 중간 -->
	<hr></hr>
	
	<div class="row">
	    <div class="col-sm-10 text-center"><!-- 전체 컨테이너(12-2)의 8 크기로 띄우게 됨 -->
			
	
				<div class="thumbnailWrapper">
					<div class="thumbnail store">
						<img src="../images/${dto.portfolio}" alt="...">
					</div>
				</div>
				<div style="clear: both"></div>
			<div class="storeInfo">
				<h3>${dto.id}</h3>
				<p>${dto.address}</p>
				<p>후기 등록 개수</p>
				<p class="intro">${dto.introduction}</p> <!--  회사소개글 -->
			


			<div> <!-- 모달을 감싼 div -->
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
									<label>희망 날짜</label>
											<!-- 데이트피커 -->	
									<div class="input-group date">
							            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							        </div>
									
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
			<!-- 모달 끝 -->
			
			</div>
		
			</div> <!-- storeInfo끝 -->
		
		
	</div>
	
	</div>
	
	<hr></hr>
	
	<div class="row">
		<div class="col-sm-10">
			<h3>후기</h3>
			<p>서비스를 이용한 고객님의 생생한 후기입니다.</p>
		</div>
	
	</div>
	
	<c:forEach items="${rlist}" var="rdto"> <!-- 넘긴 리뷰 목록을 돌기 -->
	<hr></hr>
	<div class="row">
		<div class="col-sm-9">
			<h4>${rdto.memberName}<span>${rdto.regDate}</span></h4>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/${rdto.contentURL}" alt="...">
				</a>
			</div>
			<p>${rdto.reviewContent}</p>

		</div>
	
	</div>	
	</c:forEach>
	
	</div>
	
	
	
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