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
	<div class="detail-container">
		<div class="page-header">
			<h1>빌라/투룸&nbsp;<b><mark>매매 2억 5000만원&nbsp;</mark></b><small>26㎡ 5층</small></h1>
		</div>

		<!-- head-container 시작 -->
		<div class="head-container">
			<div class="col-md-4 thumbnail" id="head-img"><img src="/sybang/images/room01.jpg"></div>
			<div class="col-md-8">
				<h2 id="head-title">매물 게시물에 대한 제목입니다.</h2>
				<p id="head-content">매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한
					설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.</p>
					<div id="btn-detail1">
                        <button type="button" class="btn btn-default">
							<!-- <span class="glyphicon glyphicon-heart-empty"></span> -->
                            <span class="glyphicon glyphicon-heart" id="btn-heart"></span>
                        </button>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-user"></span> 1:1 문의하기
                        </button>
					</div>
					<div id="btn-detail2" class="list-inline-item">
						<button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-warning-sign"></span> 허위 매물 신고
                        </button>
                    </div>
			</div>

		</div>
		<!-- head-container 끝 -->

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
			<tr>
				<th>상세 설명</th>
				<td colspan="5">매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.매물 게시물에 대한 설명입니다.</td>
			</tr>
		</table>

		<button type="button" class="btn btn-default"  id="btn-back">
			<span class="glyphicon glyphicon-triangle-left"></span>&nbsp;뒤로 가기
		</button>


	</div>
	<!-- detail-container 끝 -->
    
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>