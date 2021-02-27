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

.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
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
                    <select class="form-control" style="width: 130px; padding: 5px; font-size: 1.2em;">
                        <option value="">시/도</option>
                        <option value="서울">서울특별시</option>
                        <option value="부산">부산광역시</option>
                        <option value="대구">대구광역시</option>
                        <option value="인천">인천광역시</option>
                        <option value="광주">광주광역시</option>
                        <option value="경기">경기도</option>
                        <option value="강원">강원도</option>
                        <option value="충청">충청북도</option>
                        <option value="충청">충청남도</option>
                        <option value="전라">전라북도</option>
                        <option value="전라">전라남도</option>
                        <option value="경상">경상북도</option>
                        <option value="경상">경상남도</option>
                        <option value="제주">제주특별자치도</option>


                    </select>
                    <select class="form-control" style="width: 120px; padding: 5px; font-size: 1.2em;">
                        <option value="">시/군/구</option>
                        <option value="강남">강남구</option>
                        <option value="강동">강동구</option>
                        <option value="강북">강북구</option>
                        <option value="강서">강서구</option>
                        <option value="관악">관악구</option>
                        <option value="광진">광진구</option>
                        <option value="구로">구로구</option>
                        <option value="금천">금천구</option>
                        <option value="노원">노원구</option>
                        <option value="10">도봉구</option>
                        <option value="11">동대문구</option>
                        <option value="12">동작구</option>
                        <option value="13">마포구</option>
                        <option value="14">서대문구</option>
                        <option value="15">서초구</option>
                        <option value="16">성동구</option>
                        <option value="17">성북구</option>
                        <option value="18">송파구</option>
                        <option value="19">양천구</option>
                        <option value="20">영등포구</option>
                        <option value="21">용산구</option>
                        <option value="22">은평구</option>
                        <option value="23">종로구</option>
                        <option value="24">중구</option>
                        <option value="25">중랑구</option>

                    </select>
                    <select class="form-control" style="width: 120px; padding: 5px; font-size: 1.2em;">
                        <option value="">읍/면/동</option>
                        <option value="1">개포동</option>
                        <option value="2">논현동</option>
                        <option value="3">대치동</option>
                        <option value="4">도곡동</option>
                        <option value="5">삼성동</option>
                        <option value="6">세곡동</option>
                        <option value="7">수서동</option>
                        <option value="8">신사동</option>
                        <option value="9">압구정동</option>
                        <option value="10">역삼동</option>
                        <option value="11">율현동</option>
                        <option value="12">일원동</option>
                        <option value="13">자곡동</option>
                        <option value="14">청담동</option>

                    </select>
                </div>
                <!-- address 끝 -->
            </div>


            <div class="row">
                <!-- buildingtype 시작 -->
                <div class="col-md-6 buildingtype">
                    <h2 class="title">건물 종류</h2>
                    <div class="btn-group" data-toggle="buttons" id="bType" name="bType">
                        <label class="btn btn-default" style="width: 95px; font-size: 1.2em;"><input type="checkbox" value="1">아파트</label>
                        <label class="btn btn-default" style="width: 100px; font-size: 1.2em;"><input type="checkbox" value="2">빌라/주택</label>
                        <label class="btn btn-default" style="width: 100px; font-size: 1.2em;"><input type="checkbox" value="3">원룸/투룸</label>
                        <label class="btn btn-default" style="width: 95px; font-size: 1.2em;"><input type="checkbox" value="4">오피스텔</label>
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
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">적용</button>
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
                    <div class="btn-group" data-toggle="buttons">

                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;"><input type="checkbox" value="1">1개</label>
                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;"><input type="checkbox" value="2">2~4개</label>
                        <label class="btn btn-default" style="width: 130px; font-size: 1.2em;"><input type="checkbox" value="3">5개 이상</label>
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
                                    <h3 class="modal-title">보증금/전세가</h3>
                                </div>


                                <div class="modal-body">
                                    <small style="width: 180px;">
                                        <div id="slider1value1" class="value"></div> 억원&nbsp;~
                                        <div id="slider1value2" class="value"></div>&nbsp;&nbsp; 억원
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
                                <!-- 매매가 끝 -->



                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">적용</button>
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
            <div class="panel-group" id="accordion" style="clear: both;">
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
                            <div class="row detail well well-sm">
                                <div class="col-md-4 well-detail">
                                    <label for="parking">주차가능</label><input type="checkbox" class="js-switch"
                                        id="parking" />
                                </div>
                                <div class="col-md-4 well-detail">
                                    <label for="elevator">엘리베이터</label><input type="checkbox" class="js-switch"
                                        id="elevator" />
                                </div>
                                <div class="col-md-4 well-detail">
                                    <label for="pet">반려동물</label><input type="checkbox" class="js-switch" id="pet" />
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
            	<input type="text" name="search" id="search" class="form-control" value="" placeholder="리스트 내 검색 ex) 동 이름, 학교 이름, 역 이름"  style="font-size: 1.2em;">
            	<button type="submit" class="form-control" style="display: inline-block; text-align: center; padding: 3px; width: 35px; height: 35px; font-size: 1em;background-color: #486BB8; color: #EEE; outline: none; border-radius: 50%;">
            	<i class="fas fa-search"></i>
            	</button>
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
		
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.499426242183034, 127.03425370768977),
			level : 3
		};
	
		var map = new kakao.maps.Map(container, options);
		var geocoder = new kakao.maps.services.Geocoder();
		var markers = [];
	
		$("#hide-markers").click(function hideMarkers() {
		    setMarkers(null);    
		})
		
		/* $('input[name=dType]').hasClass('active' == true) {
			alert("멍멍");
			
		} */
	
		var where = "";
		
		var wheredType = ""; //"and dType in ('temp', '월세', '전세', '매매')"
		var wherebType = "";
		
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
		
		$("#send").click(function() {
			where = "where seq > 0" + " " + wheredType 
									+ " " + wherebType; 
		});
		
		$("input[type=checkbox]").parent().mouseover(function() {
			$(this).children().eq(0).addClass("chosen");
		});
		
		$("input[type=checkbox]").parent().mouseleave(function() {	
			$(this).children().eq(0).removeClass("chosen");
		});
		
		$("#mapping").click(function() {
			$.ajax({
				type: "GET",
				url: "/sybang/house/searchjsondata.do",
				data: "whereSearch=" + where,
				dataType: "json",
				success: function(result) {
					
					console.log("무야호")
					//result -> {"name":"홍길동", "age":"20", "address":"서울"}
										
					$(result).each(function(index, item) {
						console.log(item.seq);
						console.log(item.address);
						console.log(item.priceTag);
						console.log(" ");
						
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

						        var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '            카카오 스페이스닷원' + 
					            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' +
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
					            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
					            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';

					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: map,
					    position: marker.getPosition()       
					});

					// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					kakao.maps.event.addListener(marker, 'click', function() {
					    overlay.setMap(map);
					});

					// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
					function closeOverlay() {
					    overlay.setMap(null);     
					}
						    } 
						});
						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
		
		//거래 형태 조건 선택
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
				$("#send").click(); //현재까지 선택된 조건을 var where에 취합
				$("#mapping").click();
				
				console.log(where);
				
			} else {
				
				roomLocation = "";
				
				for (let i=0; i<$("#dType").children().length; i++) {
					
					if ($("#dType").children().eq(i).hasClass("active") && 
							
						$("#dType").children().eq(i).index() != $(this).index()) {
						
						temp += ", '" + $("#dType").children().eq(i).children().eq(0).val() + "'";
						
					}
					
				}
				
				wheredType += temp + ")";	
				
				$("#hide-markers").click();
			}
			
			console.log(wheredType);
			
			
			/*
			alert($(this).children().eq(0).val());
			
			let whereTemp = "";
			let wheredType = ""; //", '" + $(this).children().eq(i).children().eq(0).val() + "'"
			
			//let whereTemp += " " + "and dType in ('temp'" + wheredType + ")";
			
			
			for (let i=0; i<$(this).children().length; i++) {
				
				if(!$(this).children().eq(i).hasClass("active")) {
					
					wheredType += ", '" + $(this).children().eq(i).children().eq(0).val() + "'";
					
					//alert($(this).children().eq(i).children().eq(0).val()); // 각각 전세 월세 매매 잘나온다.
					
				} else {
					
					
				}
				
			}
			
			console.log(wheredType);
			*/
		});
		
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
            min: 1,
            max: 100,
            values: [1, 100],
            step: 1,
            slide: function (event, ui) {
                $("#slider1value1").text(ui.values[0]);
                $("#slider1value2").text(ui.values[1]);
            }
        });

        $("#slider2").slider({

            range: true,
            min: 50,
            max: 1000,
            values: [50, 1000],
            step: 1,
            slide: function (event, ui) {
                $("#slider2value1").text(ui.values[0]);
                $("#slider2value2").text(ui.values[1]);
            }
        });

        $("#slider3").slider({

            range: true,
            min: 3,
            max: 100,
            values: [3, 100],
            step: 1,
            slide: function (event, ui) {
                $("#slider3value1").text(ui.values[0]);
                $("#slider3value2").text(ui.values[1]);
            }
        });
		
	</script>
</body>

</html>