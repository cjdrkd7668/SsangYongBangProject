<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/housedetail.css">
<style>
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- detail-container 시작 -->
	<div class="detail-container" style="margin-top: -50px;">
		<div class="page-header">
			
			<h1>&ldquo;매물 게시물에 대한 제목입니다.&bdquo;</h1>
		</div>

		<!-- head-container 시작 -->
		<div class="head-container">
			
			<!-- 매물 이미지 시작 -->
			<div class="col-md-4 thumbnail" id="head-img">
				<img src="/sybang/images/room01.jpg">
				<img src="/sybang/images/room03.jpg">
			</div>
			<!-- 매물 이미지 끝 -->

			<div class="col-md-8">
				<h4 style="color: #2F71B8;;">서울시 강남구 역삼동 한독빌딩</h4>
				<h2 id="head-title">빌라/투룸&nbsp;<b><mark>매매 2억 5000만원&nbsp;</mark></b><small>26㎡ 5층</small></h2>
				<textarea id="head-content" class="form-control well" cols="50" rows="5"
					style="resize: none;">매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.
				</textarea>
				<div id="broker">부동산뱅크</div>
				<div id="broker-name">홍길동</div>

				<!-- 하트 버튼 시작 -->
				<div id="heart">
					<button type="button" class="btn btn-default">
						<!-- <span class="glyphicon glyphicon-heart-empty"></span> -->
						<span class="glyphicon glyphicon-heart" id="btn-heart"></span>
					</button>
				</div>
				<!-- 하트 버튼 끝 -->

					<!-- 1:1 문의 modal 시작 -->
				<button id="btn-detail1" type="button" class="btn btn-default" data-toggle="modal"
					data-target="#modal-chat">
					<span class="glyphicon glyphicon-user"></span> 1:1 문의하기
				</button>

				<div class="modal fade" role="diaglog" data-keyboard="true" id="modal-chat">
					<div class="modal-dialog">

						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title" style="text-align: center;">1:1 문의하기</h3>
							</div>

							<!-- 문의 내용 -->
							<div class="modal-body">
								<div style="font-size: 1.2em;">제목</div><input type="text" class="form-control" placeholder="제목을 입력해주세요.">
								<div style="font-size: 1.2em;">내용</div><textarea class="form-control" cols="50" rows="10" placeholder="문의 내용을 입력해주세요."
									style="resize: none; overflow: visible;"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success" data-dismiss="modal">등록</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>

				</div>
				<!-- 1:1 문의 modal 끝 -->

				
				<!-- 허위 매물 신고 modal 시작 -->
				<button id="btn-detail2" type="button" class="btn btn-default" data-toggle="modal"
					data-target="#modal-false" style="border: 3px solid hotpink;">
					<span class="glyphicon glyphicon-warning-sign"></span> 허위 매물 신고
				</button>

				<div class="modal fade" role="diaglog" data-keyboard="true" id="modal-false">
					<div class="modal-dialog">

						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title" style="text-align: center;">허위 매물 신고</h3>
							</div>

							<!-- 신고 사유 -->
							<div class="modal-body">
								<textarea class="form-control" cols="50" rows="10" placeholder="신고 사유를 입력해주세요."
									style="resize: none; overflow: visible;"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success" data-dismiss="modal">등록</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>

				</div>
				<!-- 허위 매물 신고 modal 끝 -->


			</div>

		</div>
		<!-- head-container 끝 -->
		<hr>
		<table class="table table-bordered">
			<tr>
				<th>거래 유형</th>
				<td>월세</td>
				<th>건물 유형</th>
				<td>오피스텔</td>
				<th>가격</th>
				<td>5000(만원)/110(만원)</td>
			</tr>
			<tr>
				<th>관리비</th>
				<td>8(만원)</td>
				<th>면적(공급/전용)</th>
				<td>54.23㎡/47.67㎡</td>
				<th>층/총층</th>
				<td>8/18</td>
			</tr>
			<tr>
				<th>방/욕실 개수</th>
				<td>1/2</td>
				<th>방향</th>
				<td>남향</td>
				<th>준공년도</th>
				<td>2011년</td>
			</tr>
			<tr>
				<th>주차 가능</th>
				<td>가능</td>
				<th>엘리베이터</th>
				<td>가능</td>
				<th>반려동물</th>
				<td>불가능</td>
			</tr>
		</table>

		<button type="button" class="btn btn-default" id="btn-back">
			<span class="glyphicon glyphicon-triangle-left"></span>&nbsp;뒤로 가기
		</button>



	</div>
	<!-- detail-container 끝 -->
    
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>