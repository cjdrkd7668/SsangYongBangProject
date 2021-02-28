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
<title>등록된 방 정보</title>
<style type="text/css">
.carousel-inner > .item > img, 
.carousel-inner > .item > a > img {
	max-width: 50%;
}
.carousel-inner {
	margin-top: 20px;
	border-top: 3px solid #486BB8;
	border-bottom: 3px solid #486BB8;
}
.table-type-view-detail {
	border-bottom: 1px solid #CCC
}

.carousel-control.right{
    background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .25) 100%);
}

.carousel-control.left {
    background-image: linear-gradient(to left, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .25) 100%);
}

.container-view .form-control {
	font-size: 1.3em;
	color: #486BB8;
}

.container-view .table-type-view .form-control {
	padding: 5px;
	font-size: 0.9em;
	float: left;
}

.container-view .table-type-view-detail #detail {
	resize: none;
	width: 780px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>
	<div class="container mg-view">
	
		<form method="POST" action="/sybang/broker/house/registerok.do">
		<div class="container-view">
			<div class="panel panel-danger">
				<div class="panel-heading" style="font-size: 1.1em;">매물 등록하기</div>
				<div class="panel-body"  style="font-size: 1.1em;">해당 글을 작성한 회원과 협의 후 수정한 뒤에 등록하기 버튼을 눌러주세요.</div>
			</div>
			
			
			<div class="post-info">
				<span>작성자: ${rdto.name}</span>
				<span>연락처: ${rdto.phone}</span>
				<span>등록일: ${rdto.regDate}</span>
			</div>
			
			<div class="address">
				<div class="input-group">
					<span class="input-group-addon">제목</span> <input id="subject"
						type="text" class="form-control" name="subject" value="${rdto.subject}">
				</div>
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
						<th colspan="2">
						
							<div class="input-group">
								<span class="input-group-addon" style="width: 150px;">가격(보증금)(만원)</span> <input id="price"
									type="text" class="form-control" name="price"
									value="${rdto.price}">
							</div>
							<c:if test="${rdto.dType == '월세'}">
							<div class="input-group">
								<span class="input-group-addon" style="width: 150px;">월세(만원)</span> <input id="rent"
									type="text" class="form-control" name="rent"
									value="${rdto.rent}">
							</div>
							</c:if> 
						</th>
					</tr>
					<tr>
						<th>관리비(만원)</th>
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
						<th colspan="2">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">상세설명</span>
								<textarea id="detail" class="form-control" name="detail">${rdto.detail}</textarea>
							</div>
						</th>
					</tr>
				</tbody>
			</table>

	
			<!-- 부트스트랩 캐러셀 시작-->
			<div id="carousel-room" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-room" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-room" data-slide-to="1"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="/sybang/images/${iList[0]}" alt="${iList[0]}"
							class="img-responsive center-block">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="/sybang/images/${iList[1]}" alt="${iList[1]}"
							class="img-responsive center-block">
						<div class="carousel-caption"></div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-room"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-room"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<!-- 부트스트랩 캐러셀 끝-->
			
			<!-- 등록된 방 게시글 번호 -->
			<input type="hidden" id="bseq" name="bseq" value="${approBrokerSeq }">
			<input type="hidden" id="rseq" name="rseq" value="${rdto.seq }">
			
			<div class="buttons">
				<button type="submit" class="btn btn-info">등록하기</button>
				<a class="btn btn-default" href="/sybang/broker/room/view.do?seq=${rdto.seq}&page=${nowPage}" role="button">뒤로가기</a>
			</div>
			
		</div>
		</form>
		
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
		
		window.onload = function() {
			$("#subject").focus();
		};
		
	</script>
	
	<script type="text/javascript">
		
	</script>

</body>
</html>
