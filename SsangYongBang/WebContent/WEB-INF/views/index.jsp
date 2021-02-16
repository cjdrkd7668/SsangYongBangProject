<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
	<link rel="stylesheet" href="/ssangyongbang/css/main.css">
	<%-- <%@include file="/WEB-INF/views/inc/asset.jsp" %> --%>
    <style>
        
        
    </style>
</head>

<body>

    <!-- container 시작 -->
    <main class="container">

        <!-- main-header 시작 -->
        <header class="main-header">
            <div class="main-txt">어떤 집에서 살고 싶으신가요?</div>
            <div>
                <input type="text" placeholder="원하시는 지역명, 지하철역, 단지명(아파트명)을 입력해주세요." class="main-search" size="60">
                <span class="glyphicon glyphicon-search"></span>
                <input type="button" value="검색">
            </div>
        </header>
        <!-- main-header 끝 -->

        <!-- main-history 시작 -->
        <section>
            <fieldset class="main-history">
                <legend align="left">최근에 본 매물</legend>
                <table>
                    <tr>
                        <th>
                            <a href="#">
                                <img src="/ssangyongbang/images/room01.jpg" class="main-history-img">
                            </a>
                        </th>
                        <th>
                            <a href="#">
                                <img src="/ssangyongbang/images/room02.jpg" class="main-history-img">
                            </a>
                        </th>
                        <th>
                            <a href="#">
                                <img src="/ssangyongbang/images/room03.jpg" class="main-history-img">
                            </a>
                        </th>
                    </tr>
                    <tr>
                        <td>빌라/투룸<small>26㎡ 5층</small></td>
                        <td>빌라/투룸<small>26㎡ 5층</small></td>
                        <td>빌라/투룸<small>26㎡ 5층</small></td>
                    </tr>
                    <tr>
                        <td><b>매매 2억 6,000</b></td>
                        <td><b>매매 2억 6,000</b></td>
                        <td><b>매매 2억 6,000</b></td>
                    </tr>
                    <tr>
                        <td>강남구 논현동</td>
                        <td>강남구 논현동</td>
                        <td>강남구 논현동</td>
                    </tr>
                    <tr>
                        <td>★테라스 있는 신축</td>
                        <td>★테라스 있는 신축</td>
                        <td>★테라스 있는 신축</td>
                    </tr>
                </table>

            </fieldset>


            <fieldset class="main-history">
                <legend align="left">찜한 매물</legend>
                <table>
                    <tr>
                        <th>
                            <a href="#">
                                <img src="/ssangyongbang/images/room01.jpg" class="main-history-img">
                            </a>
                        </th>
                        <th>
                            <a href="#">
                                <img src="/ssangyongbang/images/room02.jpg" class="main-history-img">
                            </a>
                        </th>
                        <th>
                            <a href="#">
                                <img src="/ssangyongbang/images/room03.jpg" class="main-history-img">
                            </a>
                        </th>
                    </tr>
                    <tr>
                        <td>빌라/투룸<small>26㎡ 5층</small></td>
                        <td>빌라/투룸<small>26㎡ 5층</small></td>
                        <td>빌라/투룸<small>26㎡ 5층</small></td>
                    </tr>
                    <tr>
                        <td><b>매매 2억 6,000</b></td>
                        <td><b>매매 2억 6,000</b></td>
                        <td><b>매매 2억 6,000</b></td>
                    </tr>
                    <tr>
                        <td>강남구 논현동</td>
                        <td>강남구 논현동</td>
                        <td>강남구 논현동</td>
                    </tr>
                    <tr>
                        <td>★테라스 있는 신축</td>
                        <td>★테라스 있는 신축</td>
                        <td>★테라스 있는 신축</td>
                    </tr>
                </table>

            </fieldset>
        </section>
        <!-- main-history 끝 -->

        <!-- main-notice 시작 -->
        <section>
            <div class="main-notice">
                <h2 class="notice-title">고객센터</h2>

                <div>
                    <div class="notice1">1:1 문의하기</div>

                    <div class="notice1">내 문의내역 보기</div>

                    <div class="notice1">자주 묻는 질문</div>

                    <div class="notice1">서비스 업체</div>
                </div>
            </div>

            <div class="main-notice">
                <h2 class="notice-title">공지사항<small>더보기 > </small></h2>
                <ul>
                    <li>공지사항입니다.</li>
                    <li>공지사항입니다.</li>
                    <li>공지사항입니다.</li>
                    <li>공지사항입니다.</li>
                    <li>공지사항입니다.</li>
                </ul>
            </div>

            <div class="main-notice">
                <h2 class="notice-title">뉴스<small>더보기 > </small></h2>
                <ul>
                    <li>뉴스입니다.</li>
                    <li>뉴스입니다.</li>
                    <li>뉴스입니다.</li>
                    <li>뉴스입니다.</li>
                    <li>뉴스입니다.</li>
                </ul>
            </div>
        </section>
        <!-- main-notice 끝 -->


    </main>


    <script>

    </script>
</body>

</html>