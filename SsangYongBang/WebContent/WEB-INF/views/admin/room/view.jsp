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
						<td>오피스텔</td>
						<th>거래 유형</th>
						<td>월세</td>
						<th>가격</th>
						<td>5000(만원) / 110(만원)</td>
					</tr>
					<tr>
						<th>관리비</th>
						<td>8(만원)</td>
						<th>면적(공급/전용)</th>
						<td>54.23&#13217; / 47.67&#13217;</td>
						<th>층/총층</th>
						<td>8 / 18</td>
					</tr>
					<tr>
						<th>방/욕실 개수</th>
						<td>1 / 2</td>
						<th>방향</th>
						<td>남향</td>
						<th>준공년도</th>
						<td>2011년</td>
					</tr>
					<tr>
						<th>주차여부</th>
						<td>가능</td>
						<th>엘레베이터</th>
						<td>가능</td>
						<th>반려동물거주</th>
						<td>불가능</td>
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
						<td>강남역과 역삼역에 위치한 오피스텔입니다. 주변에 많은 회사의 본사가 위치하고 있고, 교통의 요지입니다. 두말 할 것 없는 강남/역삼권 오피스텔, 중개도 금방 될겁니다. 다만 건물의 관리비 정책이 바뀌어 주변보다 관리비가 높은 편입니다. 이 점에 유의해주세요.강남역과 역삼역에 위치한 오피스텔입니다. 주변에 많은 회사의 본사가 위치하고 있고, 교통의 요지입니다. 두말 할 것 없는 강남/역삼권 오피스텔, 중개도 금방 될겁니다. 다만 건물의 관리비 정책이 바뀌어 주변보다 관리비가 높은 편입니다. 이 점에 유의해주세요.강남역과 역삼역에 위치한 오피스텔입니다. 주변에 많은 회사의 본사가 위치하고 있고, 교통의 요지입니다. 두말 할 것 없는 강남/역삼권 오피스텔, 중개도 금방 될겁니다. 다만 건물의 관리비 정책이 바뀌어 주변보다 관리비가 높은 편입니다. 이 점에 유의해주세요.</td>
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
