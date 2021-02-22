<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>쌍용방</title>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/sybang/css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        
        
    </style>
</head>

<body>
	
	<!-- header 가져오기######## -->
   	<%@include file="/WEB-INF/views/inc/header.jsp"%>
   	
   	
	
        <!-- container 시작 -->
    <main class="container" id="main-container">

        <!-- main-header 시작 -->
        <header class="jumbotron main-header">
            <h1 class="main-txt">어떤 집에서 살고 싶으신가요?</h1>
            <div>
                <input type="text" class="well well-sm" placeholder="원하시는 지역명, 지하철역, 단지명(아파트명)을 입력해주세요." size="60" style="font-size: 1.2em;">
               
                    <button type="button" class="form-control" id="main-btn" style="display: inline-block; text-align: center; padding: 3px; width: 35px; height: 35px; font-size: 1em;background-color: #486BB8; color: #EEE; outline: none; border-radius: 50%;"><i class="fas fa-search"></i></button>
               
            </div>
        </header>
        <!-- main-header 끝 -->

        <!-- main-history 시작 -->
        <section class="main-history">
            <div class="row">
                <div class="col-sm-6">
                    <legend align="left">최근에 본 매물</legend>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="/sybang/images/room01.jpg" class="main-history-img">
                                </a>
                                <div class="caption">
                                    <p>빌라/투룸<small>26㎡ 5층</small></p>
                                    <p><b>매매 2억 6,000</b></p>
                                    <p>강남구 논현동</p>
                                    <p>★테라스 있는 신축</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="/sybang/images/room02.jpg" class="main-history-img">
                                </a>
                                <div class="caption">
                                    <p>빌라/투룸<small>26㎡ 5층</small></p>
                                    <p><b>매매 2억 6,000</b></p>
                                    <p>강남구 논현동</p>
                                    <p>★테라스 있는 신축</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="/sybang/images/room03.jpg" class="main-history-img">
                                </a>
                                <div class="caption">
                                    <p>빌라/투룸<small>26㎡ 5층</small></p>
                                    <p><b>매매 2억 6,000</b></p>
                                    <p>강남구 논현동</p>
                                    <p>★테라스 있는 신축</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-6">
                    <legend align="left">찜한 매물</legend>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="/sybang/images/room01.jpg" class="main-history-img">
                                </a>
                                <div class="caption">
                                    <p>빌라/투룸<small>26㎡ 5층</small></p>
                                    <p><b>매매 2억 6,000</b></p>
                                    <p>강남구 논현동</p>
                                    <p>★테라스 있는 신축</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="/sybang/images/room02.jpg" class="main-history-img">
                                </a>
                                <div class="caption">
                                    <p>빌라/투룸<small>26㎡ 5층</small></p>
                                    <p><b>매매 2억 6,000</b></p>
                                    <p>강남구 논현동</p>
                                    <p>★테라스 있는 신축</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="/sybang/images/room03.jpg" class="main-history-img">
                                </a>
                                <div class="caption">
                                    <p>빌라/투룸<small>26㎡ 5층</small></p>
                                    <p><b>매매 2억 6,000</b></p>
                                    <p>강남구 논현동</p>
                                    <p>★테라스 있는 신축</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- main-history 끝 -->

        <hr>

        <!-- main-notice 시작 -->
        <section class="row main-notice">
            <div class="col-sm-4 list-group">
                <h2 class="notice-title">고객센터</h2>

                <a href="#" class="list-group-item notice1"><span class="glyphicon glyphicon-pencil"></span>&nbsp;1:1
                    문의하기</a>
                <a href="#" class="list-group-item notice1"><span class="glyphicon glyphicon-book"></span>&nbsp;내 문의내역
                    보기</a>
                <a href="#" class="list-group-item notice1"><span class="glyphicon glyphicon-list"></span>&nbsp;자주 묻는
                    질문</a>
                <a href="#" class="list-group-item notice1"><span class="glyphicon glyphicon-briefcase"></span>&nbsp;서비스
                    업체</a>
            </div>

            <div class="col-sm-4">
                <h2 class="notice-title">공지사항<small>더보기<span class="glyphicon glyphicon-chevron-right"></span></small>
                </h2>
                <a href="#" class="list-group-item notice2">공지사항입니다.</a>
                <a href="#" class="list-group-item notice2">공지사항입니다.</a>
                <a href="#" class="list-group-item notice2">공지사항입니다.</a>
                <a href="#" class="list-group-item notice2">공지사항입니다.</a>
                <a href="#" class="list-group-item notice2">공지사항입니다.</a>
            </div>

            <div class="col-sm-4">
                <h2 class="notice-title">뉴스<small>더보기<span class="glyphicon glyphicon-chevron-right"></span></small>
                </h2>
                <a href="#" class="list-group-item notice3">뉴스입니다.</a>
                <a href="#" class="list-group-item notice3">뉴스입니다.</a>
                <a href="#" class="list-group-item notice3">뉴스입니다.</a>
                <a href="#" class="list-group-item notice3">뉴스입니다.</a>
                <a href="#" class="list-group-item notice3">뉴스입니다.</a>
            </div>
        </section>
        <!-- main-notice 끝 -->


    </main>
	
	<!-- footer 가져오기######## -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

    <script>

    </script>
</body>

</html>