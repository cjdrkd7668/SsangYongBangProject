<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/admin.css">
<link rel="stylesheet" href="/sybang/css/board.css">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>	
	<div class="container mg-view">
	
		<div class="container-view">
			
			<div class="post-info">
				<span>작성자: 홍길동</span>
				<span>연락처: 010-2233-4455</span>
				<span>등록일: 2021-02-11</span>
			</div>
			
			<div class="address">
				<span><span>&ldquo;</span>깨끗한 오피스텔이고, 사무실로도 사용가능합니다. 역삼/강남역 1분 거리!!<span> &bdquo;</span></span>
				<span>서울특별시 강남구 역삼동, 한독빌딩 6층<span class="glyphicon glyphicon-home"></span></span>
			</div>
		
			<!-- map 시작 -->
        	<div id="map" style="width:100%;height:400px;"></div>
        	<!-- map 끝 -->
        	
			
			<table class="table-type-view">
				<colgroup>
					<col style="width: 100px;">
					<col style="width: 180px;">
					<col style="width: 100px;">
					<col style="width: 180px;">
					<col style="width: 100px;">
					<col style="width: 180px;">
				</colgroup>
				<tbody>
					<tr>
						<th>방 유형</th>
						<td>${rdto.bType}</td>
						<th>거래 유형</th>
						<td>${rdto.dType}</td>
						<th>가격</th>
						<td>${rdto.price}(만원)
						<c:if test="${rdto.dType == '월세'}">
						 / ${rdto.rent}(만원)
						</c:if>
						</td>
					</tr>
					<tr>
						<th>관리비</th>
						<td>${rdto.monthlyFee}</td>
						<th>면적(공급/전용)</th>
						<td>${rdto.supplyArea}&#13217; / ${rdto.exclusiveArea}&#13217;</td>
						<th>층/총층</th>
						<td>${rdto.selectedFloor} / ${rdto.totalFloor}</td>
					</tr>
					<tr>
						<th>방/욕실 개수</th>
						<td>${rdto.roomNum} / ${rdto.bathroomNum}</td>
						<th>방향</th>
						<td>${rdto.direction}</td>
						<th>준공년도</th>
						<td>${rdto.completionYear}년</td>
					</tr>
					<tr>
						<th>주차여부</th>
						<td>${rdto.parkingFlag}</td>
						<th>엘레베이터</th>
						<td>${rdto.elevator}</td>
						<th>반려동물거주</th>
						<td>${rdto.pet}</td>
					</tr>
				</tbody>
			</table>
			<table class="table-type-view-detail">
				<colgroup>
					<col style="width: 100px;">
					<col style="width: auto;">
				</colgroup>
				<tbody>
					<tr>
						<th>상세 설명</th>
						<td>${rdto.detail}</td>
					</tr>
				</tbody>
			</table>
			
			<div class="buttons">
				<a class="btn btn-default" href="/sybang/admin/room/boardlist.do" role="button">목록</a>
				<a class="btn btn-default" href="#" role="button">삭제</a>
			</div>
			
			
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034"></script>
	<script>
		var postLat = 37.499343405328595;
		var postLng = 127.03321257686713;
	
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(postLat, postLng),
			level : 4
		};

		var map = new kakao.maps.Map(container, options);
		
		marker1 = new daum.maps.Marker({
			position: new daum.maps.LatLng(postLat, postLng)
		});
		
		marker1.setMap(map);
	</script>
	
	<script type="text/javascript">
		
	</script>

</body>
</html>
