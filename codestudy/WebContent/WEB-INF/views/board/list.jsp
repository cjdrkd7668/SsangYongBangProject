<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Board</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/board.css">

<style>

</style>
</head>

<body>

	<!-- ########## 상단 헤더 시작 -->
	<%
		out.flush();
	    RequestDispatcher dheader = request.getRequestDispatcher("/inc/header.do");
	    dheader.include(request, response);
	%>
	<!-- ########## 상단 헤더 끝 -->


	<!-- ########## 본문 시작 -->
	<div class="main">

		<!-- ########## 좌측 시작 -->
		<div class="menu col-sm-12 col-md-3">
			<!-- ########## 메뉴 시작 -->
			<%
				out.flush();
			    RequestDispatcher dmenu = request.getRequestDispatcher("/inc/menu.do");
				dmenu.include(request, response);
			%>
			<!-- ########## 메뉴 끝 -->

			<!-- ########## 인증 시작 -->
			<%
				out.flush();
			    RequestDispatcher dauth = request.getRequestDispatcher("/inc/auth.do");
			    dauth.include(request, response);
			%>
			<!-- ########## 인증 끝 -->

			<!-- ########## 채팅 시작 -->
			<%
				out.flush();
			    RequestDispatcher dchat = request.getRequestDispatcher("/inc/chat.do");
				dchat.include(request, response);
			%>
			<!-- ########## 채팅 끝 -->
		</div>
		<!-- ########## 좌측 끝 -->



		<!-- ########## 내용 시작 -->
		<div class="content col-sm-12 col-md-9">
			<div>
			
				<h1>자유 게시판 <small>Board</small></h1>
				
				<!-- 
                <div class="message well well-sm">
                    메시지 영역입니다.
                </div>
                 -->
                <!-- 
                <div class="input-group search">
                    <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon2">
                    <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
                </div>
                <div style="clear:both;"></div>
                 -->
                
                <table class="table table-hover list">
                    <thead>
                        <tr>
                            <th>추천</th>
                            <th>제목</th>
                            <th>이름</th>
                            <th>날짜</th>
                            <th>읽음</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/codestudy/board/view.do">게시판 테스트중입니다.</a></td>
                            <td>홍길동</td>
                            <td>2020-01-01</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>

				<!-- 
                <div class="btn-group fbtns" role="group" aria-label="...">
                    <button type="button" class="btn btn-default active"><span class="glyphicon glyphicon-th-list"></span></button>
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span></button>
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-heart"></span></button>
                </div>
 				-->
 				
                <nav class="pagebar">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="/codestudy/board/list.do">1</a></li>
                        <li><a href="/codestudy/board/list.do">2</a></li>
                        <li class="active"><a href="/codestudy/board/list.do">3</a></li>
                        <li><a href="/codestudy/board/list.do">4</a></li>
                        <li><a href="/codestudy/board/list.do">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do';">
                        <span class="glyphicon glyphicon-th-list"></span>
                        목록
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/write.do';">
                        <span class="glyphicon glyphicon-plus"></span>
                        쓰기
                    </button>
                </div>
                <div style="clear:both;"></div>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
    
    </script>
</body>

</html>