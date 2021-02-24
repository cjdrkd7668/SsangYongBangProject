<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>쌍용방</title>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

        #maincontainer {
            width: 1200px;
            margin-left: auto;
            margin-right: auto;
            font-family: 'Noto Sans KR', sans-serif;
            letter-spacing: -1px;
        }

        #maincontainer .mainheader .well {
            outline: none;
        }

        /* main-header 시작 */
        #maincontainer .mainheader {
            text-align: center;
            margin-top: 30px;
            height: 50vh;
            background: url(/sybang/images/mainbg.jpg) center;
            background-size: cover;
            width: 100%;
            opacity: 1;
        }

        /* 어떤 방에 살고 ~~ 텍스트 */
        #maincontainer .mainheader .headertxt {
            font-weight: bold;
            margin: 100px;
            padding-top: 30px;
            font-size: 3em;
        }

        /* 검색 버튼 */
        #maincontainer .mainheader #searchbtn {
            width: 35px; 
            height: 35px; 
            display: inline-block; 
            text-align: center; 
            padding: 3px; 
            font-size: 1em;
            background-color: #486BB8; 
            color: #EEE; 
            outline: none; 
            border-radius: 50%;
            
        }

        #maincontainer .mainheader #searchbtn:hover {
            background: none;
            border: 3px solid #486BB8;
        }

        /* mainhistory(최근에 본 매물, 찜한 매물) 시작 */
        #maincontainer .mainhistory {
            width: 90%;
            height: 40vh;
            margin: 10px auto;
        }

        #maincontainer .mainhistory th {
            font-size: 1.3em;
            height: 40px;
            background-color: #EEE;
        }

        #maincontainer .mainhistory td {
            height: 30px;
            text-decoration: none;
            text-align: center;
            font-size: 1.1em;
        }

        #maincontainer .mainhistory a {
            color: #000;
        }

        #maincontainer .mainhistory a:hover {
            color: #486BB8;
            text-decoration-line: none;
        }

        /* 사진 */
        #maincontainer .mainhistory .thumbnail {
            height: 100px;
        }

        #maincontainer .mainhistory small, #maincontainer .mainnotice small {
            margin-right: 20px;
            float: right;
            font-size: 0.9em;
        }

        /* mainnotice 시작 */
        #maincontainer .mainnotice {
            width: 90%;
            height: auto;
            margin: 10px auto;
        }
        
        #maincontainer .mainnotice th {
            width: 30%;
            margin-left: 10px;
            font-size: 1.3em;
            background-color: #EEE;
            text-align: center;
        }

        #maincontainer .mainnotice td {
            margin-left: 30px;
            font-size: 1.1em;
        }

        #maincontainer .mainnotice a {
            color: #000;
        }

        #maincontainer .mainnotice a:hover {
            color: #486BB8;
            text-decoration-line: none;
        }



    </style>
</head>

<body>
	
	<!-- header 가져오기######## -->
   	<%@include file="/WEB-INF/views/inc/header.jsp"%>
   	
   	
	
    <!-- maincontainer 시작 -->
    <main class="container" id="maincontainer">

        <!-- mainheader 시작 -->
        <header class="jumbotron mainheader">
            <h1 class="headertxt">어떤 집에서 살고 싶으신가요?</h1>
            <div>
                <!-- form 태그 시작 -->
                <form method="POST" action="">
                <input type="text" class="well well-sm" placeholder="원하시는 지역명, 지하철역, 단지명(아파트명)을 입력해주세요." size="60" style="font-size: 1.2em;">
               
                    <button type="submit" id="searchbtn" class="form-control"><i class="fas fa-search"></i></button>
                </form>
                <!-- form 태그 끝 -->
            </div>
        </header>
        <!-- mainheader 끝 -->

        <!-- mainhistory 시작 -->
        <section class="mainhistory">
            <table class="table table-default">

                <tr>
                    <th colspan="3">최근 본 매물</th>
                    <th colspan="3">찜한 매물</th>
                </tr>
                
                <tr>
                    <!-- 최근 본 매물 사진 시작 -->
                    <td>
                        <a href="#">
                            <img src="/sybang/images/room01.jpg" class="thumbnail">
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <img src="/sybang/images/room03.jpg" class="thumbnail">
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <img src="/sybang/images/room03.jpg" class="thumbnail">
                        </a>
                    </td>
                    <!-- 최근 본 매물 사진 끝-->
                    <!-- 찜한 매물 사진 시작 -->
                    <td>
                        <a href="#">
                            <img src="/sybang/images/room01.jpg" class="thumbnail">
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <img src="/sybang/images/room03.jpg" class="thumbnail">
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <img src="/sybang/images/room03.jpg" class="thumbnail">
                        </a>
                    </td>
                    <!-- 찜한 매물 사진 끝 -->
                </tr>
                <tr>
                    <td><a href="#">빌라/투룸<small>26㎡ 5층</small></a></td>
                    <td><a href="#">빌라/투룸<small>26㎡ 5층</small></a></td>
                    <td><a href="#">빌라/투룸<small>26㎡ 5층</small></a></td>
                    <td><a href="#">빌라/투룸<small>26㎡ 5층</small></a></td>
                    <td><a href="#">빌라/투룸<small>26㎡ 5층</small></a></td>
                    <td><a href="#">빌라/투룸<small>26㎡ 5층</small></a></td>
                </tr>
                <tr>
                    <td><a href="#"><b>매매 2억 6,000</b></a></td>
                    <td><a href="#"><b>매매 2억 6,000</b></a></td>
                    <td><a href="#"><b>매매 2억 6,000</b></a></td>
                    <td><a href="#"><b>매매 2억 6,000</b></a></td>
                    <td><a href="#"><b>매매 2억 6,000</b></a></td>
                    <td><a href="#"><b>매매 2억 6,000</b></a></td>
                </tr>
                <tr>
                    <td><a href="#">강남구 논현동</a></td>
                    <td><a href="#">강남구 논현동</a></td>
                    <td><a href="#">강남구 논현동</a></td>
                    <td><a href="#">강남구 논현동</a></td>
                    <td><a href="#">강남구 논현동</a></td>
                    <td><a href="#">강남구 논현동</a></td>
                </tr>
                <tr>
                    <td><a href="#">★테라스 있는 신축</a></td>
                    <td><a href="#">★테라스 있는 신축</a></td>
                    <td><a href="#">★테라스 있는 신축</a></td>
                    <td><a href="#">★테라스 있는 신축</a></td>
                    <td><a href="#">★테라스 있는 신축</a></td>
                    <td><a href="#">★테라스 있는 신축</a></td>
                </tr>
            </table>
        </section>
        <!-- mainhistory 끝 -->

        <hr>

        <!-- mainnotice 시작 -->
        <section class="row mainnotice">
            <table class="table table-default">
                <tr>
                    <th>바로가기</th>
                    <th>공지사항
                        <small><a href="#">더보기<span class="glyphicon glyphicon-chevron-right"></span></a></small>
                    </th>
                    <th>뉴스
                        <small><a href="#">더보기<span class="glyphicon glyphicon-chevron-right"></span></a></small>
                    </th>
                </tr>
                <tr>
                    <td><a href="#"><span class="glyphicon glyphicon-briefcase"></span>&nbsp;서비스 업체</a></td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
                <tr>
                    <td><a href="#"><span class="glyphicon glyphicon-pencil"></span>&nbsp;1:1 문의하기</a></td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
                <tr>
                    <td><a href="#"><span class="glyphicon glyphicon-book"></span>&nbsp;1:1 문의내역</a></td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
                <tr>
                    <td><a href="#"><span class="glyphicon glyphicon-list"></span>&nbsp;자주 묻는 질문</a></td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
            </table>
        </section>
        <!-- mainnotice 끝 -->


    </main>
    <!-- maincontainer 끝 -->
	
	<!-- footer 가져오기######## -->
   	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

    <script>

    </script>
</body>

</html>