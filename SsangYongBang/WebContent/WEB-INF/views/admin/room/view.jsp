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
				<span>작성자: ${rdto.name}</span>
				<span>연락처: ${rdto.phone}</span>
				<span>등록일: ${rdto.regDate}</span>
			</div>
			
			<div class="address">
				<span><span>&ldquo;</span>${rdto.subject}<span> &bdquo;</span></span>
				<span>${rdto.address}<span class="glyphicon glyphicon-home"></span></span>
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
			<table class="table-type-view-detail" style="width: 100%">
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
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034&libraries=services"></script>
	<script>
		var postLat = 37.499343405328595;
		var postLng = 127.03321257686713;
		var roomLocation = "<c:out value='${rdto.address}'/>";
	
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(postLat, postLng),
			level : 4
		};

		var map = new kakao.maps.Map(container, options);
		
		/*marker1 = new daum.maps.Marker({
			position: new daum.maps.LatLng(postLat, postLng)
		});
		
		marker1.setMap(map);*/
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(roomLocation, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        //인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		       	    content: '<div style="width:150px;text-align:center;padding:6px 0;">${rdto.bType}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		
	</script>
	
	<script type="text/javascript">
		
	</script>

</body>
</html>
