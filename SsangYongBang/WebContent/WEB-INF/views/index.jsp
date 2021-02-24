<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>쌍용방</title>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/sybang/css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
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
            
                <!-- 검색 form 태그 시작 -->
                <form method="GET" action="/sybang/index.do">
                <input type="text" name="search" id="search" class="well well-sm" placeholder="원하시는 지역명, 지하철역, 단지명(아파트명)을 입력해주세요." size="60" style="font-size: 1.2em;">
               
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
                        <small><a href="/sybang/notice/list.do">더보기<span class="glyphicon glyphicon-chevron-right"></span></a></small>
                    </th>
                    <th>뉴스
                        <small><a href="/sybang/news/boardList.do">더보기<span class="glyphicon glyphicon-chevron-right"></span></a></small>
                    </th>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="btn btn-default">
                            <a href="/sybang/service/ServicestoreList.do"><span class="glyphicon glyphicon-briefcase"></span>&nbsp;전문 업체 찾기</a>
                        </button>
                    </td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
                <tr>
                    <td>
                        <!-- 1:1 문의 modal 시작 -->
                        <button id="chat" type="button" class="btn btn-default" data-toggle="modal"
                            data-target="#modalchat">
                            <span class="glyphicon glyphicon-user"></span> 1:1 문의하기
                        </button>

                        <div class="modal fade" role="diaglog" data-keyboard="true" id="modalchat">
                            <div class="modal-dialog">

                                <div class="modal-content">
                                    <div class="modal-header">
                                        
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        
                                        <h3 class="modal-title" style="text-align: center;">1:1 문의하기</h3>
                                    </div>

                                    <!-- 문의 내용 -->
                                    <form method="POST" action="/sybang/member/chat/chatok.do">
                                    <div class="modal-body">
                                        <select name="bname" id="bname" class="form-control" >
                                            <option>승인중개사선택</option>
                                            <option>중개사이름</option>
                                            <option>중개사이름</option>
                                        </select>
                                        <input name="subject" id="subject" type="text" class="form-control" placeholder="제목을 입력해주세요.">
                                        <textarea name="content" id="content" class="form-control" cols="50" rows="10" placeholder="문의 내용을 입력해주세요."
                                            style="resize: none; overflow: visible;"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success" data-dismiss="modal">등록</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                    </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- 1:1 문의 modal 끝 -->

                    </td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
                <tr>
                    <td>
                    	  <!-- 1:1 문의 내역 modal 시작 -->
                        <button id="chatlist" type="button" class="btn btn-default" data-toggle="modal"
                            data-target="#modalchatlist">
                            <span class="glyphicon glyphicon-book"></span> 1:1 문의내역
                        </button>

                        <div class="modal fade" role="diaglog" data-keyboard="true" id="modalchatlist">
                            <div class="modal-dialog">

                                <div class="modal-content">
                                    <div class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                                        <h3 class="modal-title" style="text-align: center;">1:1 문의내역</h3>
                                    </div>

                                    <!-- 문의 내용 -->
                                    <form method="">
                                        <div class="modal-body">
                                            <select name="bname" id="bname" class="form-control">
                                                <option>승인중개사선택</option>
                                                <option>중개사이름</option>
                                                <option>중개사이름</option>
                                            </select>
                                            <input name="subject" id="subject" type="text" class="form-control"
                                                placeholder="제목을 입력해주세요.">
                                            <textarea name="content" id="content" class="form-control" cols="50"
                                                rows="10" placeholder="문의 내용을 입력해주세요."
                                                style="resize: none; overflow: visible;"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-success"
                                                data-dismiss="modal">등록</button>
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">닫기</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- 1:1 문의 내역 modal 끝 -->
                    </td>
                    <td><a href="#">공지사항입니다.</a></td>
                    <td><a href="#">뉴스입니다.</a></td>
                </tr>
                <tr>
                    <td>
                    	<!-- 자주 묻는 질문 modal 시작 -->
                        <button id="qna" type="button" class="btn btn-default" data-toggle="modal"
                            data-target="#modalqna">
                            <span class="glyphicon glyphicon-list"></span>&nbsp;자주 묻는 질문
                        </button>

                        <div class="modal fade" role="diaglog" data-keyboard="true" id="modalqna">
                            <div class="modal-dialog">

                                <div class="modal-content">
                                    <div class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                                        <h3 class="modal-title" style="text-align: center;">자주 묻는 질문</h3>
                                    </div>

                                    <!-- 문의 내용 -->
                                    <form method="">
                                        <div class="modal-body">
                                            <select name="bname" id="bname" class="form-control">
                                                <option>승인중개사선택</option>
                                                <option>중개사이름</option>
                                                <option>중개사이름</option>
                                            </select>
                                            <input name="subject" id="subject" type="text" class="form-control"
                                                placeholder="제목을 입력해주세요.">
                                            <textarea name="content" id="content" class="form-control" cols="50"
                                                rows="10" placeholder="문의 내용을 입력해주세요."
                                                style="resize: none; overflow: visible;"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-success"
                                                data-dismiss="modal">등록</button>
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">닫기</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- 자주 묻는 질문 modal 끝 -->
                    </td>
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
	    window.onload = function() {
			$("#search").focus();
		};
    </script>
</body>

</html>