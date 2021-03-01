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
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

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
	background: url(/sybang/images/bg.jpg) center;
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
	color: #EEE;
	text-shadow: 1px 1px 5px #000;
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

/* mainhistory(방금 올라온 매물, 찜한 매물) 시작 */
#maincontainer .mainhistory {
	width: 100%;
	height: 40vh;
	margin: 0px auto;
	text-align: center;
}

.newBadge {
	position: relative;
	top: -7px;
}

#maincontainer .mainhistory .newsTable {
	display: inline-block;
	width: 470px;
	margin-left: 30px;
	margin-right: 30px;
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
	width: 100%;
	height: 40vh;
	margin: 5px auto;
}

#maincontainer .mainnotice .noticeTable {
	display: inline-block;
	margin-left: 20px;
	margin-right: 15px;
	width: 350px;
	height: 250px;
}

#maincontainer .mainnotice .noticeTable .box {
	width: 340px;
	height: 200px;
	overflow: hidden;
}

#maincontainer .mainnotice .noticeTable .box #innerbox {
	width: 340px;
}

#maincontainer .mainnotice .noticeTable .thumbnail {
	/* width: 340px; */
	height: 200px;
	margin: 0px auto;
}

#maincontainer .mainnotice th {
	width: 30%;
	margin-left: 10px;
	font-size: 1.3em;
	border: 0px;
	text-align: center;
}

#maincontainer .mainnotice td {
	margin-left: 10px;
	font-size: 1.1em;
	text-align: left;
}

#maincontainer .mainnotice a {
	color: #000;
}

#maincontainer .mainnotice a:hover {
	color: #486BB8;
	text-decoration-line: none;
}

.bluebg {
	background-color: #486BB8;
	color: #EEE;
}

.carousel-inner > .item > img {
display: block;
max-width: 100%;
height: auto;
}

.item .carousel-caption {
    color: #EEE !important;
    text-shadow: 1px 1px 5px #000;
    right: 0 !important;
    top: 45% !important;
    width: 200px;
}

.blue {
	color: #486BB8;
}

.bluebg {
	background-color: #486BB8;
	color: #EEE;
}

.red {
	color: red;
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
                    <input type="text" class="well well-sm" placeholder="원하시는 지역명, 지하철역, 단지명(아파트명)을 입력해주세요." size="60"
                        style="font-size: 1.2em;">

                    <button type="submit" id="searchbtn" class="form-control"><i class="fas fa-search"></i></button>
                </form>
                <!-- form 태그 끝 -->
            </div>
        </header>
        <!-- mainheader 끝 -->

        <!-- mainhistory 시작 -->
        <section class="mainhistory">
            <table class="table table-default newsTable">

                <tr>
                    <th colspan="3">방금 올라온 매물 <span class="badge newBadge" style="background-color: red;">N</span></th>
                </tr>

                <tr>
                    <!-- 방금 올라온 매물 사진 시작 -->
                    <c:forEach items="${hlist }" var="hdto1">
                    <td>
                        <a href="/sybang/house/houseview.do?seq=${hdto1.seq }">
                            <img src="/sybang/images/${hdto1.url1 }" class="thumbnail">
                        </a>
                    </td>
                    </c:forEach>
                <tr>
                	<c:forEach items="${hlist }" var="hdto2">
                    <td><a href="/sybang/house/houseview.do?seq=${hdto2.seq }">${hdto2.btype }<small>${hdto2.exclusiveArea }㎡ ${hdto2.selectedFloor }층</small></a></td>
                    </c:forEach>
                </tr>
                <tr>
                	<c:forEach items="${hlist }" var="hdto3">
                    <td><a href="/sybang/house/houseview.do?seq=${hdto3.seq }">
                    	<b>${hdto3.dtype } ${hdto3.price }만원<c:if test="${hdto3.dtype == '월세'}">/${hdto3.rent }만원</c:if></b></a></td>
                    </c:forEach>
                </tr>
                <tr>
                	<c:forEach items="${hlist }" var="hdto4">
                    <td><a href="/sybang/house/houseview.do?seq=${hdto4.seq }">${hdto4.address}</a></td>
                    </c:forEach>
                </tr>
                <tr>
                	<c:forEach items="${hlist }" var="hdto5">
                    <td><a href="/sybang/house/houseview.do?seq=${hdto5.seq }">${hdto5.subject }</a></td>
                    </c:forEach>
                </tr>
            </table>
            <table class="table table-default newsTable">

                <tr>
                    <th colspan="3">광고 <span class="badge newBadge" style="background-color: yellow; color: #444;">Ad</span></th>
                </tr>

                <tr>
                    <!-- 광고 매물 사진 시작 -->
                    <c:forEach items="${adlist }" var="addto1">
                    <td>
                        <a href="/sybang/house/houseview.do?seq=${addto1.seq }">
                            <img src="/sybang/images/${addto1.url2 }" class="thumbnail">
                        </a>
                    </td>
                    </c:forEach>
                <tr>
                    <c:forEach items="${adlist }" var="addto2">
                    <td><a href="/sybang/house/houseview.do?seq=${addto2.seq }">${addto2.btype }<small>${addto2.exclusiveArea }㎡ ${addto2.selectedFloor }층</small></a></td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${adlist }" var="addto3">
                    <td><a href="/sybang/house/houseview.do?seq=${addto3.seq }">
                    	<b>${addto3.dtype } ${addto3.price }만원<c:if test="${addto3.dtype == '월세'}">/${addto3.rent }만원</c:if></b></a></td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${adlist }" var="addto4">
                    <td><a href="/sybang/house/houseview.do?seq=${addto4.seq }">${addto4.address}</a></td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${adlist }" var="addto5">
                    <td><a href="/sybang/house/houseview.do?seq=${addto5.seq }">${addto5.subject }</a></td>
                    </c:forEach>
                </tr>
            </table>


        </section>
        <!-- mainhistory 끝 -->

        <hr>

        <!-- mainnotice 시작 -->
        <section class="row mainnotice">

            <table class="table table-default noticeTable">
                <tr>
                    <th class="well bluebg"><div>뉴스</div></th>
                </tr>
                <tr>
                    <td rowspan="5">
                        <div id="carouselNews" class="carousel slide box" data-ride="carousel">
							<div class="carousel-inner" role="listbox" id="innerbox">
								<c:forEach items="${nlist }" var="ndto" varStatus="status">
									<c:if test="${status.index == 1 }">
										<div class="item active">
											<img src="/sybang/images/${ndto.imageurl }" class="thumbnail">
										<div class="carousel-caption">${ndto.subject }</div>
										</div>
									</c:if>
									<c:if test="${status.index != 1 }">
										<div class="item">
											<img src="/sybang/images/${ndto.imageurl }" class="thumbnail">
										<div class="carousel-caption">${ndto.subject }</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
                    </td>
                </tr>
            </table>

            <table class="table table-default noticeTable">
                <tr>
                    <th class="well">인기글</th>
                </tr>
                <c:forEach items="${plist }" var="pdto">
                <tr>
                    <td><a href="/sybang/free/detail.do?seq=${pdto.seq }"> ${pdto.subject } (<b class="blue">${pdto.ccount }</b>)</a>
                    </td>
                </tr>
                </c:forEach>
            </table>

            <table class="table table-default noticeTable">
                <tr>
                    <th class="well">최신글 <span class="badge newBadge" style="background-color: red;">N</span></th>
                </tr>
                <c:forEach items="${llist }" var="ldto">
                <tr>
                    <td><a href="/sybang/free/detail.do?seq=${ldto.seq }"> ${ldto.subject } (<b class="blue">${ldto.ccount }</b>)
                    <!-- 최신 글 시작 -->
					<%-- <c:if test="${ldto.gap < 1 }">
						<span class="badge newBadge" style="background-color: red;">N</span></a>
					</c:if> --%>
                    </a>
                    </td>
                </tr>
                </c:forEach>
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
		
		$('.carousel').carousel({
			interval: 2000
		});


    </script>
</body>

</html>