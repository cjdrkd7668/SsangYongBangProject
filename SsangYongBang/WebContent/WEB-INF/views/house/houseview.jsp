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
<title>쌍용방 :: ${dto.subject}</title>
<style type="text/css">
.modal-open{overflow:auto;padding-right:0 !important;}

.mg-view {
	text-align: center;
}

.container-view {
	display: inline-block;
	text-align: initial;
}

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

.member-buttons {
	float: right;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
	<div class="container mg-view">
	
		<div class="container-view">
			
			<div class="post-info">
				<span>작성자: ${dto.bname}</span>
				<span>연락처: ${dto.tel}</span>
				<span>등록일: ${dto.regdate}</span>
			</div>
			
			<div class="address">
				<span>
					<span>&ldquo;</span>
					${dto.subject}
					<span> &bdquo;</span>
					<span class="member-buttons">
						<a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-chat" role="button">1:1 문의</a>
						<a class="btn btn-danger btn-lg" data-toggle="modal" data-target="#delete-room" role="button">허위 매물 신고</a>
					</span>
				</span>
				<span>${dto.address}<span class="glyphicon glyphicon-home"></span></span>
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
						<td>${dto.btype}</td>
						<th>거래 유형</th>
						<td>${dto.dtype}</td>
						<th>가격</th>
						<td>${dto.price}(만원)
						<c:if test="${dto.dtype == '월세'}">
						 / ${dto.rent}(만원)
						</c:if>
						</td>
					</tr>
					<tr>
						<th>관리비</th>
						<td>${dto.monthlyFee}</td>
						<th>면적(공급/전용)</th>
						<td>${dto.supplyArea}&#13217; / ${dto.exclusiveArea}&#13217;</td>
						<th>층/총층</th>
						<td>${dto.selectedFloor} / ${dto.totalFloor}</td>
					</tr>
					<tr>
						<th>방/욕실 개수</th>
						<td>${dto.roomNum} / ${dto.bathroomNum}</td>
						<th>방향</th>
						<td>${dto.direction}</td>
						<th>준공년도</th>
						<td>${dto.completionYear}년</td>
					</tr>
					<tr>
						<th>주차여부</th>
						<td>${dto.parkingFlag}</td>
						<th>엘레베이터</th>
						<td>${dto.elevator}</td>
						<th>반려동물거주</th>
						<td>${dto.pet}</td>
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
						<td>${dto.content}</td>
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
			
			<!-- 1:1 문의와 허위 매물 신고 모달 -->
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
			<div class="modal fade" id="delete-room" tabindex="-1" role="dialog" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">허위 매물 신고</h4>
			      </div>
			      <div class="modal-body">
					<textarea class="form-control" cols="50" rows="10" placeholder="신고 사유를 입력해주세요."
						style="resize: none; overflow: visible;"></textarea>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				  </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034&libraries=services"></script>
	<script>
		var postLat = 37.499343405328595;
		var postLng = 127.03321257686713;		
		var roomLocation = "<c:out value='${dto.address}'/>";
	
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
		       	    content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.btype}</div>'
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
