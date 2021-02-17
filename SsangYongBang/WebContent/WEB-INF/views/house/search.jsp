<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/sybang/css/main.css">
	<%@include file="/WEB-INF/views/inc/asset.jsp"%>
	    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

        body {
            width: 1200px;
            margin-left: auto;
            margin-right: auto;
            font-family: 'Noto Sans KR', sans-serif;
            letter-spacing: -1px;
        }

        .search-box {
            text-align: left;
            margin-top: 30px;
            padding: 20px;
            height: 200px;
            border: 3px dashed pink;
        }

        .btn-group {
            margin: 5px;
        }

    </style>
</head>
<body>
    <div class="container">

        <!-- search-box 시작 -->
        <div class="search-box">

            <!-- <form method="POST" action="/project/search/searchok.do"> -->
            <div class="row">
                <!-- dealtype 시작 -->
                <div class="col-md-6 dealtype">
                    거래 유형
                    <div class="btn-group" data-toggle="buttons">

                        <label class="btn btn-default"><input type="checkbox" value="1">매매</label>
                        <label class="btn btn-default"><input type="checkbox" value="2">전세</label>
                        <label class="btn btn-default"><input type="checkbox" value="3">월세</label>
                    </div>
                </div>
                <!-- dealtype 끝 -->

                <!-- address 시작 -->
                <div class="col-md-6 address">
                    <span>지역</span>
                    <select>
                        <option value="">시/도</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                    <select>
                        <option value="">시/군/구</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                    <select>
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
                <!-- buildingtype 시작 -->
                <div class="col-md-6 buildingtype">
                    건물 종류
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default"><input type="checkbox" value="1">아파트</label>
                        <label class="btn btn-default"><input type="checkbox" value="2">빌라/주택</label>
                        <label class="btn btn-default"><input type="checkbox" value="3">원룸/투룸</label>
                        <label class="btn btn-default"><input type="checkbox" value="4">오피스텔</label>
                    </div>
                </div>
                <!-- buildingtype 끝 -->

                <!-- area 시작 -->
                <div class="col-md-6 area">
                    면적
                    <div class="drag">


                    </div>
                </div>
                <!-- area 끝 -->
            </div>


            <div class="row">
                <!-- roomnum 시작 -->
                <div class="col-md-6 roomnum">
                    방 개수
                    <div class="btn-group" data-toggle="buttons">

                        <label class="btn btn-default"><input type="checkbox" value="1">1개</label>
                        <label class="btn btn-default"><input type="checkbox" value="2">2~4개</label>
                        <label class="btn btn-default"><input type="checkbox" value="3">5개 이상</label>
                    </div>
                </div>
                <!-- roomnum 끝 -->

                <!-- price 시작 -->
                <div class="col-md-6 price">
                    가격대
                    <div class="btn-group" data-toggle="buttons">


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



    <script>

    </script>
</body>
</html>