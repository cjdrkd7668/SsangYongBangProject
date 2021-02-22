<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<span>작성자: 쌍용공인중개사</span>
				<span>연락처: 02-6677-8899</span>
				<span>등록일: 2021-02-15</span>
			</div>
			

			<div class="panel" id="house-post-state-panel">
  				<div class="panel-heading">
    				<h3 class="panel-title">거래중인 매물</h3>
  				</div>
  				<div class="panel-body">
    				본 부동산 매물은 중개사에 의해 거래중입니다. 해당 매물은 사이트 방문자에 의해 조회될 수 있습니다.
  				</div>
			</div>
			
			
			<div class="address">
				<span><span>&ldquo;</span>★강남 시내 내부 오피스텔★ 주요 역 1분 이내 초대박 매물! 놓치지 마세요~<span> &bdquo;</span></span>
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
						<td>강남역과 역삼역 바로 앞에 위치한 초특급 매물입니다. 바로 전화상담 주시거나 저희 중개사 사무실에 방문해주세요. 02-6677-8899. 평일 11:00 ~ 19:00 유선 상담 가능합니다. 강남역과 역삼역 바로 앞에 위치한 초특급 매물입니다. 바로 전화상담 주시거나 저희 중개사 사무실에 방문해주세요. 02-6677-8899. 평일 11:00 ~ 19:00 유선 상담 가능합니다. 강남역과 역삼역 바로 앞에 위치한 초특급 매물입니다. 바로 전화상담 주시거나 저희 중개사 사무실에 방문해주세요. 02-6677-8899. 평일 11:00 ~ 19:00 유선 상담 가능합니다.</td>
					</tr>
				</tbody>
			</table>
			
			<div class="buttons">
				<a class="btn btn-default" href="/sybang/admin/house/boardlist.do" role="button">목록</a>
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
		
		if(false){
			$("#house-post-state-panel").addClass("panel-primary");
		}else{
			$("#house-post-state-panel").addClass("panel-danger");			
			$("#house-post-state-panel").children().children().eq(0).text("거래 완료된 매물");
			$("#house-post-state-panel").children().eq(1).text("본 부동산 매물은 거래 완료된 매물입니다. 해당 매물은 관리자만 조회할 수 있으며, 만일 사이트 방문자에 의해 조회된다면 허위 매물로써 삭제해야 합니다.")
		}
		
	</script>

</body>
</html>
