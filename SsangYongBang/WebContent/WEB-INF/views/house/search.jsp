<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 찾기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/house.css">
<!-- 토글 스위치 참조 -->
<link rel="stylesheet" href="/sybang/asset/css/switchery.css">
<script src="/sybang/asset/js/switchery.js"></script>
<!-- jquery-ui 참조 -->
<link rel="stylesheet" href="/sybang/asset/css/jquery-ui.css">
<script src="/sybang/asset/js/jquery-ui.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
        integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 
<style>
.modal-open{overflow:auto;padding-right:0 !important;}
.infowindow a {color:#486BB8;}
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

<!-- list-container 시작 -->
    <div class="list-container">

        <!-- search-box 시작 -->
        <div class="search-box">

			<!-- form 태그 시작 -->
            <form method="POST" action="/sybang/house/searchok.do">
            <div class="row">
                <!-- dealtype 시작 -->
                <div class="col-md-6 dealtype">
                    <h2 class="title">거래 유형</h2>
                    <div class="btn-group" data-toggle="buttons" id="dType" name="dType">

                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;">
                        	<input type="checkbox" value="매매" name="dType">매매</label>
                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;">
                        <input type="checkbox" value="전세" name="dType">전세</label>
                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;">
                        <input type="checkbox" value="월세" name="dType">월세</label>
                    </div>
                </div>
                <!-- dealtype 끝 -->

                <!-- address 시작 -->
                <div class="col-md-6 address">
                    <h2 class="title">지역</h2>
                    <select class="form-control" style="width: 130px; padding: 5px; font-size: 1.2em;" id="sido">
                        <option value="">시/도</option>
                        <option value="서울">서울특별시</option>
                        <option value="부산광역시">부산광역시</option>
                        <option value="대구광역시">대구광역시</option>
                        <option value="인천광역시">인천광역시</option>
                        <option value="광주광역시">광주광역시</option>
                        <option value="경기도">경기도</option>
                        <option value="강원도">강원도</option>
                        <option value="충청북도">충청북도</option>
                        <option value="충청남도">충청남도</option>
                        <option value="전라북도">전라북도</option>
                        <option value="전라남도">전라남도</option>
                        <option value="경상북도">경상북도</option>
                        <option value="경상남도">경상남도</option>
                        <option value="제주">제주특별자치도</option>


                    </select>
                    <select class="form-control" style="width: 120px; padding: 5px; font-size: 1.2em;" id="gungoo">
                        <option value="">시/군/구</option>
                        <option value="강남구">강남구</option>
                        <option value="강동구">강동구</option>
                        <option value="강북구">강북구</option>
                        <option value="강서구">강서구</option>
                        <option value="관악구">관악구</option>
                        <option value="광진구">광진구</option>
                        <option value="구로구">구로구</option>
                        <option value="금천구">금천구</option>
                        <option value="노원구">노원구</option>
                        <option value="도봉구">도봉구</option>
                        <option value="동대문구">동대문구</option>
                        <option value="동작구">동작구</option>
                        <option value="마포구">마포구</option>
                        <option value="서대문구">서대문구</option>
                        <option value="서초구">서초구</option>
                        <option value="성동구">성동구</option>
                        <option value="성북구">성북구</option>
                        <option value="송파구">송파구</option>
                        <option value="양천구">양천구</option>
                        <option value="영등포구">영등포구</option>
                        <option value="용산구">용산구</option>
                        <option value="은평구">은평구</option>
                        <option value="종로구">종로구</option>
                        <option value="중구">중구</option>
                        <option value="중랑구">중랑구</option>

                    </select>
                    <select class="form-control" style="width: 120px; padding: 5px; font-size: 1.2em;" id="dong">
                        <option value="">읍/면/동</option>
                        <option value="개포동">개포동</option>
                        <option value="논현동">논현동</option>
                        <option value="대치동">대치동</option>
                        <option value="도곡동">도곡동</option>
                        <option value="삼성동">삼성동</option>
                        <option value="세곡동">세곡동</option>
                        <option value="수서동">수서동</option>
                        <option value="신사동">신사동</option>
                        <option value="압구정동">압구정동</option>
                        <option value="역삼동">역삼동</option>
                        <option value="율현동">율현동</option>
                        <option value="일원동">일원동</option>
                        <option value="자곡동">자곡동</option>
                        <option value="청담동">청담동</option>

                    </select>
                </div>
                <!-- address 끝 -->
            </div>


            <div class="row">
                <!-- buildingtype 시작 -->
                <div class="col-md-6 buildingtype">
                    <h2 class="title">건물 종류</h2>
                    <div class="btn-group" data-toggle="buttons" id="bType" name="bType">
                        <label class="btn btn-default" style="width: 95px; font-size: 1.2em;"><input type="checkbox" value="아파트">아파트</label>
                        <label class="btn btn-default" style="width: 100px; font-size: 1.2em;"><input type="checkbox" value="빌라', '주택">빌라/주택</label>
                        <label class="btn btn-default" style="width: 100px; font-size: 1.2em;"><input type="checkbox" value="원룸', '투룸">원룸/투룸</label>
                        <label class="btn btn-default" style="width: 95px; font-size: 1.2em;"><input type="checkbox" value="오피스텔">오피스텔</label>
                    </div>
                </div>
                <!-- buildingtype 끝 -->

                <!-- area 시작 -->
                <div class="col-md-6 area">
                    <h2 class="title">면적</h2>
                    <button class="btn btn-default modal-button" type="button" data-toggle="modal"
                        data-target="#areamodal" style="width: 390px; font-size: 1.2em;">
                        === 면적을 설정하시려면 클릭하세요 ===
                    </button>

                    <!-- modal -->
                    <div class="modal fade" role="diaglog" id="areamodal" data-keyboard="true">
                        <div class="modal-dialog">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title" style="text-align: center; font-size: 1.4em;">면적을 설정하고 적용을 눌러주세요.</h3>
                                </div>

                                <!-- 방 크기/전용 면적 -->
                                <div class="modal-header">
                                    <h3 class="modal-title" style="font-size: 1.2em;">방 크기/전용 면적</h3>
                                </div>


                                <div class="modal-body">
                                    <small style="width: 180px; margin-right: 10px;">
                                        <div id="slider0value1" class="value" style="font-size: 1.2em;"></div> ㎡ ~
                                        <div id="slider0value2" class="value" style="font-size: 1.2em;"></div> ㎡
                                    </small>
                                    <div id="slider0" class="sliders" style="width: 300px;"></div>
                                </div>
                                <!-- 방 크기/전용 면적 끝 -->
                                <div class="modal-footer" style="margin-top: 40px;">
                                    <button type="button" class="btn btn-success" id="area" data-dismiss="modal">적용</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- modal 끝 -->

                </div>

                <!-- area 끝 -->
            </div>


            <div class="row">

                <!-- roomnum 시작 -->
                <div class="col-md-6 roomnum">
                    <h2 class="title">방 개수</h2>
                    <div class="btn-group" data-toggle="buttons" id="roomNum" name="roomNum">

                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;"><input type="checkbox" value="1">1개</label>
                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;"><input type="checkbox" value="2', '3', '4">2~4개</label>
                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;"><input type="checkbox" value="5', '6', '7', '8">5개 이상</label>
                    </div>
                </div>
                <!-- roomnum 끝 -->



                <!-- price 시작 -->
                <div class="col-md-6 price">
                    <h2 class="title">가격대</h2>
                    <button class="btn btn-default modal-button" type="button" data-toggle="modal"
                        data-target="#pricemodal" style="width: 390px; font-size: 1.2em;">
                        === 가격을 설정하시려면 클릭하세요 ===
                    </button>

                    <!-- modal -->
                    <div class="modal fade" role="diaglog" id="pricemodal" data-keyboard="true">
                        <div class="modal-dialog">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title " style="text-align: center; font-size: 1.4em;">가격을 설정하고 적용을 눌러주세요.</h3>
                                </div>

                                <!-- 보증금/전세가 -->
                                <div class="modal-header">
                                    <h3 class="modal-title">보증금/전세가/매매가</h3>
                                </div>


                                <div class="modal-body">
                                    <small style="width: 180px;">
                                        <div id="slider1value1" class="value"></div> 만원&nbsp;~
                                        <div id="slider1value2" class="value"></div>&nbsp;&nbsp; 만원
                                    </small>
                                    <div id="slider1" class="sliders" style="width: 300px;"></div>
                                </div>
                                <!-- 보증금/전세가 끝 -->

                                <!-- 월세 -->
                                <div class="modal-header">
                                    <h3 class="modal-title">월세</h3>
                                </div>

                                <div class="modal-body">
                                    <small style="width: 180px;">
                                        <div id="slider2value1" class="value"></div> 만원 ~
                                        <div id="slider2value2" class="value"></div>&nbsp;&nbsp; 만원
                                    </small>
                                    <div id="slider2" class="sliders" style="width: 300px;"></div>
                                </div>
                                <!-- 월세 끝 -->
                                <!-- 매매가 -->
								<!--
                                <div class="modal-header">
                                    <h3 class="modal-title">매매가</h3>
                                </div>

                                <div class="modal-body" >
                                    <small style="width: 180px;">
                                        <div id="slider3value1" class="value"></div> 억원 ~
                                        <div id="slider3value2" class="value"></div>&nbsp;&nbsp; 억원
                                    </small>
                                    <div id="slider3" class="sliders" style="width: 300px;"></div>
                                </div>
								-->
                                <!-- 매매가 끝 -->


                                <div class="modal-footer" style="margin-top: 40px;">
                                    <button type="button" class="btn btn-success" id="price" data-dismiss="modal">적용</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- modal 끝 -->
                </div>
                <!-- price 끝 -->
            </div>


            <!-- detail-search 시작 -->
            <div class="panel-group" id="accordion" style="clear: both; border-bottom: 5px solid #486BB8;">
                <div class="panel">
                    <!-- panel-heading 시작 -->
                    <div class="panel-heading btn-detail">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" style="color: #444; font-size: 1.1em;">
                            상세 검색&nbsp;&nbsp;<i class="fas fa-sort-down" style="color: #486BB8;"></i>
                        </a>
                    </div>
                    <!-- panel-heading 끝 -->

                    <div id="collapse1" class="panel-collapse collapse">
                        <!-- panel-body 시작 -->
                        <div class="panel-body">
                            <!-- 상세 검색 스위치 시작 -->
                            <div class="row detail well well-sm" style="box-shadow: none;">
                                <div class="col-md-4 well-detail">
                                    <label for="parking">주차가능</label><input type="checkbox" class="js-switch js-check-change"
                                        id="parkingFlag" />
                                </div>
                                <div class="col-md-4 well-detail">
                                    <label for="elevator">엘리베이터</label><input type="checkbox" class="js-switch js-check-change"
                                        id="elevator" />
                                </div>
                                <div class="col-md-4 well-detail">
                                    <label for="pet">반려동물</label><input type="checkbox" class="js-switch js-check-change" id="pet" />
                                </div>
                            </div>
                            <!-- 상세 검색 스위치 끝 -->
                        </div>
                        <!-- panel-body 끝 -->
                    </div>

                </div>

            </div>
            <!-- detail-search 끝 -->
            <div class="search-text">
            <hr>
            	<!--
            	<input type="text" name="search" id="search" class="form-control" value="" placeholder="리스트 내 검색 ex) 동 이름, 학교 이름, 역 이름"  style="font-size: 1.2em;">
            	<button type="submit" class="form-control" style="display: inline-block; text-align: center; padding: 3px; width: 35px; height: 35px; font-size: 1em;background-color: #486BB8; color: #EEE; outline: none; border-radius: 50%;">
            	<i class="fas fa-search"></i>
            	</button>
            	  -->
            </div>
            </form>
            <!-- form 태그 끝 -->


            </div>
            <!-- search-box 끝 -->

            <!-- map 시작 -->
			<div id="map" style="width:100%;height:600px;"></div>
            <!-- map 끝 -->
            
           	<input type="hidden" id="send" name="send">
           	<input type="hidden" id="mapping" name="mapping">
           	<input type="hidden" id="hide-markers" name="hide-markers">

        </div>
        <!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034"></script>

	<script src="/sybang/js/address.js"></script>
	<script>
		
		//############ 카카오맵 API 변수 선언 및 초기화 시작 ############
		
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.499426242183034, 127.03425370768977),
			level : 3
		};
	
		var map = new kakao.maps.Map(container, options);
		var geocoder = new kakao.maps.services.Geocoder();
		var markers = [];

		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
		$("#hide-markers").click(function hideMarkers() {
		    setMarkers(null); 
		})
		
		//############ 카카오맵 API 변수 선언 및 초기화 끝 ############
		
		//############ 조건 검색 변수 선언 및 초기화 시작 #############
		
		var where = "";
		var wheredType = ""; //"and dType in ('temp', '월세', '전세', '매매')"
		var wherebType = "";
		var whereRoomNum = "";
		var whereParkingFlag = "";
		var whereElevator = "";
		var wherePet = "";
		var whereAddress = "";
		var whereArea = "";
		var wherePrice = "";
		var whereRent = "";
		
		$("#send").click(function() {
			where = "where seq > 0" + " " + wheredType 
									+ " " + wherebType
									+ " " + whereParkingFlag
									+ " " + whereElevator
									+ " " + wherePet
									+ " " + whereRoomNum
									+ " " + whereAddress
									+ " " + whereArea
									+ " " + wherePrice
									+ " " + whereRent;
			
			if (where.trim() == "where seq > 0") {
				where = "where seq < 0";
			}
		
		});
		
		$("input[type=checkbox]").parent().mouseover(function() {
			$(this).children().eq(0).addClass("chosen");
		});
		
		$("input[type=checkbox]").parent().mouseleave(function() {	
			$(this).children().eq(0).removeClass("chosen");
		});
		
		//입력 받은 조건으로 맵에 마커를 띄웁니다.
		$("#mapping").click(function() {
			$.ajax({
				type: "GET",
				url: "/sybang/house/searchjsondata.do",
				data: "whereSearch=" + encodeURIComponent(where),
				dataType: "json",
				success: function(result) {
					
					//result -> {"name":"홍길동", "age":"20", "address":"서울"}
										
					$(result).each(function(index, item) {
						
						if (item.seq != 0) {
						
							var roomLocation = item.address;
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
							        
							        //마커를 배열에 추가합니다.
							        markers.push(marker);
									
								    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
								    var iwContent = '<div style="padding:5px;" class="infowindow">' + item.priceTag + '<br>' + item.bType + '<br>' + '<a href="/sybang/house/houseview.do?seq=' + item.seq + '" target="_blank">자세히 보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
								    // 인포윈도우를 생성합니다
								    var infowindow = new kakao.maps.InfoWindow({
								        content : iwContent,
								        removable : iwRemoveable
								    });
	
								    // 마커에 클릭이벤트를 등록합니다
								    kakao.maps.event.addListener(marker, 'click', function() {
								          // 마커 위에 인포윈도우를 표시합니다
								          infowindow.open(map, marker);  
								    });
							     }
							});
						}
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
		
		//############ 조건 검색 변수 선언 및 초기화 끝 #############
		
		
		//################## 조건별 검색 누적 시작 ##################
		
		//##### 거래 형태 조건 선택 시작 #####
		$("#dType").children().change(function() {
			
			//1. 조건 문자열 초기화 및 누적변수 생성
			wheredType = "and dType in ('temp'";
			let temp = "";
			
			//2. 선택한 조건 누적
			if (!$(this).hasClass("active")) {
				
				temp += ", '" + $(this).children().eq(0).val() + "'";
				
				for (let i=0; i<$("#dType").children().length; i++) {
					
					if ($("#dType").children().eq(i).hasClass("active")) {
						
						temp += ", '" + $("#dType").children().eq(i).children().eq(0).val() + "'";
					
					}
					
				}
				
				wheredType += temp + ")";
			
				//3. 조건 검색 실행
				$("#hide-markers").click();
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
				
			} else {
				
				roomLocation = "";
				let selCount = 0;
				
				for (let i=0; i<$("#dType").children().length; i++) {
					
					if ($("#dType").children().eq(i).hasClass("active") && 
							
						$("#dType").children().eq(i).index() != $(this).index()) {
						
						temp += ", '" + $("#dType").children().eq(i).children().eq(0).val() + "'";
						
					selCount++;
					
					}
					
					
				}

				if (selCount == 0) {
					wheredType = "";
				} else {
					wheredType += temp + ")";	
				}
				
				selCount = 0;
				
				$("#hide-markers").click();
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
			}
			
		});
		//##### 거래 형태 조건 선택 끝 #####
		
		//##### 건물 형태 조건 선택 시작 #####
		$("#bType").children().change(function() {
			
			//1. 조건 문자열 초기화 및 누적변수 생성
			wherebType = "and bType in ('temp'";
			let temp = "";
			
			//2. 선택한 조건 누적
			if (!$(this).hasClass("active")) {
				
				temp += ", '" + $(this).children().eq(0).val() + "'";
				
				for (let i=0; i<$("#bType").children().length; i++) {
					
					if ($("#bType").children().eq(i).hasClass("active")) {
						
						temp += ", '" + $("#bType").children().eq(i).children().eq(0).val() + "'";
					
					}
					
				}
				
				wherebType += temp + ")";
			
				//3. 조건 검색 실행
				$("#hide-markers").click();
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
				
			} else {
				
				roomLocation = "";
				let selCount = 0;
				
				for (let i=0; i<$("#bType").children().length; i++) {
					
					if ($("#bType").children().eq(i).hasClass("active") && 
							
						$("#bType").children().eq(i).index() != $(this).index()) {
						
						temp += ", '" + $("#bType").children().eq(i).children().eq(0).val() + "'";
						
					selCount++;
					
					}
					
				}

				if (selCount == 0) {
					wherebType = "";
				} else {
					wherebType += temp + ")";	
				}
				
				selCount = 0;
				
				$("#hide-markers").click();
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
			}
			
		});
		//##### 건물 형태 조건 선택 끝 #####
		
		//##### 방 개수 조건 선택 시작 #####
		$("#roomNum").children().change(function() {
			
			//1. 조건 문자열 초기화 및 누적변수 생성
			whereRoomNum = "and roomNum in ('0'";
			let temp = "";
			
			//2. 선택한 조건 누적
			if (!$(this).hasClass("active")) {
				
				temp += ", '" + $(this).children().eq(0).val() + "'";
				
				for (let i=0; i<$("#roomNum").children().length; i++) {
					
					if ($("#roomNum").children().eq(i).hasClass("active")) {
						
						temp += ", '" + $("#roomNum").children().eq(i).children().eq(0).val() + "'";
					
					}
					
				}
				
				whereRoomNum += temp + ")";
				
				//3. 조건 검색 실행
				$("#hide-markers").click();
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
				
			} else {
				
				roomLocation = "";
				let selCount = 0;
				
				for (let i=0; i<$("#roomNum").children().length; i++) {
					
					if ($("#roomNum").children().eq(i).hasClass("active") && 
							
						$("#roomNum").children().eq(i).index() != $(this).index()) {
						
						temp += ", '" + $("#roomNum").children().eq(i).children().eq(0).val() + "'";
						
					selCount++;
					
					}
					
				}

				if (selCount == 0) {
					whereRoomNum = "";
				} else {
					whereRoomNum += temp + ")";	
				}
				
				selCount = 0;
				
				$("#hide-markers").click();
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
			}
			
		});
		//##### 방 개수 조건 선택 끝 #####	
		
		//##### 상세 검색 조건 선택 시작 ######
		var changeCheckbox = document.querySelectorAll('.js-check-change')

		changeCheckbox[0].onchange = function() {
  			
  			if(changeCheckbox[0].checked) {
  				whereParkingFlag = "and parkingFlag = '가능'"
  			} else {
  				whereParkingFlag = "";
  			}
  			
  			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
  			
		};
		
		changeCheckbox[1].onchange = function() {

			if(changeCheckbox[1].checked) {
  				whereElevator = "and elevator = '있음'"
  			} else {
  				whereElevator = "";
  			}
  			
  			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
			
		};
		
		changeCheckbox[2].onchange = function() {

			if(changeCheckbox[2].checked) {
  				wherePet = "and pet = '가능'"
  			} else {
  				wherePet = "";
  			}
  			
  			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
			
		};
		//##### 상세 검색 조건 선택 끝 ######
		
		//##### 지역 조건 선택 시작 ######
		$('#sido').change(function() {
    		whereAddress = "and address like '%%" + $(this).val() + "%%' "
    		+ "and address like '%%" + $(this).siblings().eq(1).val() + "%%' " 
    		+ "and address like '%%" + $(this).siblings().eq(2).val() + "%%' "
    		
    		if ($(this).val() + $(this).siblings().eq(1).val() + $(this).siblings().eq(2).val() == "") {
    			whereAddress = "";
    		}
    		
    		$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
		});
		$('#gungoo').change(function() {
			whereAddress = "and address like '%%" + $(this).val() + "%%' "
			+ "and address like '%%" + $(this).siblings().eq(1).val() + "%%' " 
			+ "and address like '%%" + $(this).siblings().eq(2).val() + "%%' "
			
			if ($(this).val() + $(this).siblings().eq(1).val() + $(this).siblings().eq(2).val() == "") {
    			whereAddress = "";
    		}

			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
		});
		$('#dong').change(function() {
			whereAddress = "and address like '%%" + $(this).val() + "%%' "
			+ "and address like '%%" + $(this).siblings().eq(1).val() + "%%' " 
			+ "and address like '%%" + $(this).siblings().eq(2).val() + "%%' "
			
			if ($(this).val() + $(this).siblings().eq(1).val() + $(this).siblings().eq(2).val() == "") {
    			whereAddress = "";
    		}

			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
		});
		//##### 지역 조건 선택 끝 ######
		
		//##### 면적 조건 선택 시작 ######
		$("#area").click(function(){
			
			whereArea = "and exclusiveArea between " + $(this).parent().prev().find("#slider0value1").text() + " and " + $(this).parent().prev().find("#slider0value2").text();
			
			if ($(this).parent().prev().find("#slider0value1").text() == "" || $(this).parent().prev().find("#slider0value2").text() == "") {
    			whereArea = "";
    		}
			
			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
			
		});
		//##### 면적 조건 선택 끝 ######
		
		//##### 가격 조건 선택 시작 ######
		$("#price").click(function(){
			
			wherePrice = "and price between " + $("#slider1value1").text() + " and " + $("#slider1value2").text();
			whereRent = "and rent between " + $("#slider2value1").text() + " and " + $("#slider2value2").text();
			
			if ($("#slider1value1").text() == "" || $("#slider1value2").text() == "") {
    			wherePrice = "";
    		}
			
			if ($("#slider2value1").text() == "" || $("#slider2value2").text() == "") {
    			whereRent = "";
    		}
			
			$("#hide-markers").click();
			$("#send").click(); //현재까지 선택된 조건을 var where에 취합
			$("#mapping").click();
			
		});
		//##### 가격 조건 선택 끝 ######
		
		
		//################## 조건별 검색 누적 끝 ##################
		
		window.onload = function() {
			$("#search").focus();
		};
		
		var elems = Array.prototype.slice.call(document
				.querySelectorAll('.js-switch'));

		elems.forEach(function(html) {
			var switchery = new Switchery(html, { color: '#486DBE', jackColor: '#D6EFF8' });
		});
		
		$("#slider0").slider({

            range: true,
            min: 16,
            max: 115,
            values: [16, 115],
            step: 1,
            slide: function (event, ui) {
                $("#slider0value1").text(ui.values[0]);
                $("#slider0value2").text(ui.values[1]);
            }
        });

        $("#slider1").slider({

            range: true,
            min: 0,
            max: 500000,
            values: [0, 10000],
            step: 1,
            slide: function (event, ui) {
                $("#slider1value1").text(ui.values[0]);
                $("#slider1value2").text(ui.values[1]);
            }
        });

        $("#slider2").slider({

            range: true,
            min: 1,
            max: 1000,
            values: [50, 1000],
            step: 1,
            slide: function (event, ui) {
                $("#slider2value1").text(ui.values[0]);
                $("#slider2value2").text(ui.values[1]);
            }
        });
        
		/*
        $("#slider3").slider({

            range: true,
            min: 0,
            max: 1000,
            values: [0, 10],
            step: 1,
            slide: function (event, ui) {
                $("#slider3value1").text(ui.values[0]);
                $("#slider3value2").text(ui.values[1]);
            }
        });
		*/
		
	</script>
</body>

</html>