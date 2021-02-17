<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 찾기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/house.css">
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
    <div class="container">

        <!-- search-box 시작 -->
        <div class="search-box">

            <!-- <form method="POST" action="/project/search/searchok.do"> -->
            <div class="row">
                <!-- dealtype 시작 -->
                <div class="col-md-6 dealtype">
                    <h2 class="title">거래 유형</h2>
                    <div class="btn-group" data-toggle="buttons">

                        <label class="btn btn-default"><input type="checkbox" value="1">매매</label>
                        <label class="btn btn-default"><input type="checkbox" value="2">전세</label>
                        <label class="btn btn-default"><input type="checkbox" value="3">월세</label>
                    </div>
                </div>
                <!-- dealtype 끝 -->

                <!-- roomnum 시작 -->
                <div class="col-md-6 roomnum">
                    <h2 class="title">방 개수</h2>
                    <div class="btn-group" data-toggle="buttons">

                        <label class="btn btn-default"><input type="checkbox" value="1">1개</label>
                        <label class="btn btn-default"><input type="checkbox" value="2">2~4개</label>
                        <label class="btn btn-default"><input type="checkbox" value="3">5개 이상</label>
                    </div>
                </div>
                <!-- roomnum 끝 -->


               
            </div>


            <div class="row">
                <!-- buildingtype 시작 -->
                <div class="col-md-6 buildingtype">
                    <h2 class="title">건물 종류</h2>
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default"><input type="checkbox" value="1">아파트</label>
                        <label class="btn btn-default"><input type="checkbox" value="2">빌라/주택</label>
                        <label class="btn btn-default"><input type="checkbox" value="3">원룸/투룸</label>
                        <label class="btn btn-default"><input type="checkbox" value="4">오피스텔</label>
                    </div>
                </div>
                <!-- buildingtype 끝 -->

                 <!-- address 시작 -->
                 <div class="col-md-6 address">
                    <h2 class="title">지역</h2>
                    <select class="form-control">
                        <option value="">시/도</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                    <select class="form-control">
                        <option value="">시/군/구</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                    <select class="form-control">
                        <option value="">읍/면/동</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                </div>
                <!-- address 끝 -->
                
                
            </div>


            <div class="row">
                
                <!-- area 시작 -->
                <div class="col-md-6 area">
                    <h2 class="title">면적</h2>
                    <div class="panel-group">
                        <div class="panel panel-default">

                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <a href="#area-menu" data-toggle="collapse">===면적을 설정하시려면 클릭하세요===</a>
                                </h3>
                            </div>

                            <div class="collapse panel-collapse" id="area-menu">
                                <div class="panel-body">
                                    <h3 style="text-align: left;">방 크기/전용 면적<small style="font-size: 0.8em; float: right;">19㎡(6평) ~ 94㎡(28평)</small></h3>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- area 끝 -->

                <!-- price 시작 -->
                <div class="col-md-6 price">
                    <h2 class="title">가격대</h2>
                    <div class="panel-group">
                        <div class="panel panel-default">

                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <a href="#price-menu" data-toggle="collapse">===가격대를 설정하시려면 클릭하세요===</a>
                                </h3>
                            </div>

                            <div class="collapse panel-collapse" id="price-menu">
                                <div class="panel-body">
                                    <h3 style="text-align: left;">보증금/전세가<small style="font-size: 0.8em; float: right;">1억원 ~ 무제한</small></h3>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- price 끝 -->
            </div>


        </div>
        <!-- search-box 끝 -->


        <div id="map" style="width:500px;height:400px;"></div>
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034"></script>
        <script>
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

            var map = new kakao.maps.Map(container, options);
        </script>

    </div>
    
    <!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>



    <script>

    </script>
</body>

</html>