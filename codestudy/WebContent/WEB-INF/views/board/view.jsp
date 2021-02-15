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
                
                <table class="table view">
                    <tr>
                        <td>
                            <span class="seq">1.</span>
                            <span class="subject">제목입니다.</span>
                            <span class="readcount">읽음(20)</span>
                            <span class="date">2020-01-01 10:10:10</span>
                            <span class="name">홍길동(hong)</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="content">
                            카카오모빌리티는 24일 ‘카카오 T 블루’에 중형택시 최초로 앱미터기를 적용했다.
                            <br><br>
                            카카오모빌리티의 앱미터기는 GPS를 기반으로 시간, 거리, 속도를 계산해 택시 요금을 산정한다. 택시기사는 기사용 '카카오T' 앱을 통해 앱미터기를 사용할 수 있다. 승객은 승객용 '카카오T' 앱을 통해 실시간으로 요금을 확인할 수 있다.
                            <br><br>
                            앱미터기는 플랫폼 업데이트를 통해 별도의 교체 비용 없이 빠르게 요금제 변경이 가능하다. 또한 탄력요금제 적용 등 다양한 부가서비스로의 확장도 용이하다. 기존 기계식 미터기는 요금제 변경 시 기사가 직접 검정소를 찾아가 기기를 조정해야 했다. 교체 비용만 6만원에 달한다.
                            <br><br>
                            유료 도로 비용이나 시계외 할증 비용이 앱에서 자동으로 계산된다. 이에 시계외 할증이나 유료 도로를 미리 누르는 조작 방법으로 부당한 요금을 청구하는 위법행위를 막을 수 있다.
                            <br><br>
                            이용자가 앱을 통해 요금을 실시간으로 확인할 수 있는 것도 장점이다. 또한 요금 오입력에 따른 요금 분쟁 가능성도 낮출 수 있어 기사와 승객 모두 편익이 향상될 것으로 기대된다.
                            <br><br>
                            앱미터기는 주요 글로벌 차량 호출 서비스에 활발하게 적용되며 전 세계적으로 확산되고 있다. 국내는 현행 자동차관리법령 상 바퀴 회전수에 따라 거리, 속도를 측정해 요금을 산정하는 기계식 택시 미터기만을 규정하고 있다. 카카오 T 블랙 등 일부 특화된 택시서비스에만 제한적으로 앱미터기 적용이 허용돼 왔다.
                        </td>
                    </tr>
                    <!-- 
                    <tr>
                        <td>
                            <span class="glyphicon glyphicon-floppy-disk"></span> test.zip
                        </td>
                    </tr>
                     -->
                    <!-- 
                    <tr>
                        <td>
                            <button type="button" class="btn btn-default">
                                <span class="glyphicon glyphicon-thumbs-up"></span>
                                추천
                            </button>
                        </td>
                    </tr>
                     -->
                </table>


                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do';">
                        <span class="glyphicon glyphicon-th-list"></span>
                        목록
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/edit.do';">
                        <span class="glyphicon glyphicon-minus"></span>
                        수정
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/delete.do';">
                        <span class="glyphicon glyphicon-remove"></span>
                        삭제
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/reply.do';">
                        <span class="glyphicon glyphicon-share-alt"></span>
                        답변
                    </button>
                </div>
                <div style="clear:both;"></div>


                <!-- 
                <table class="table comment">
                    <tr>
                        <td>
                            <span class="comment">제목입니다.</span>
                            <span class="date">2020-01-01 10:10:10</span>
                            <span class="name">홍길동(hong)</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="comment">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</span>
                            <span class="date">2020-01-01 10:10:10</span>
                            <span class="name">홍길동(hong)</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="comment">제목입니다.</span>
                            <span class="date">2020-01-01 10:10:10</span>
                            <span class="name">홍길동(hong)</span>
                            <span class="delete">[삭제]</span>
                        </td>
                    </tr>
                </table>
 				
 				
                <div class="commentbox panel panel-default">
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="comment">
                    </div>
                </div>
                -->
                
                
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