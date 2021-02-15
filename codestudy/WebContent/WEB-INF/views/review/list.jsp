<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Review</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/review.css">

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
				<h1>코드 리뷰 <small>Review</small></h1>

                <div class="itemreview">
                    <div class="item">
                        <div class="title">
                            <span>자바 기본 클래스입니다.</span>
                            <span>2020-01-01</span>
                            <span>홍길동</span>
                        </div>                    
                        <pre class="code">
<div><span class="linenumber">1:</span>package java.io.*;</div>
<div><span class="linenumber">2:</span>public class Hello {</div>
<div><span class="linenumber">3:</span>    public static void main(String[] args) {</div>
<div><span class="linenumber">4:</span>        System.out.println("안녕하세요.");</div>
<div><span class="linenumber">5:</span>   }</div>
<div><span class="linenumber">6:</span>}</div></pre>
                    </div>

                    <div class="review">
                        <div class="item" data-line-start="1" data-line-end="1">
                            <span class="linenumber label label-primary">1 : 1</span>
                            <span class="text">패키지 선언입니다.</span>
                        </div>
                        <div class="item" data-line-start="2" data-line-end="6">
                            <span class="linenumber label label-primary">2 : 6</span>
                            <span class="text">클래스 선언입니다.</span>
                        </div>
                        <div class="item" data-line-start="3" data-line-end="5">
                            <span class="linenumber label label-primary">3 : 5</span>
                            <span class="text">메인 메소드 선언입니다.메인 메소드 선언입니다.메인 메소드 선언입니다.메인 메소드 선언입니다.</span>
                        </div>
                        <!-- 
                        <div class="item" data-line-start="0">
                            <span class="linenumber label label-default">clear</span>
                            <span class="text">선택을 해제합니다.</span>
                        </div> 
                        -->
                    </div>
                </div>




                <div class="itemreview">
                    <div class="item">
                        <div class="title">
                            <span>자바 기본 클래스입니다.</span>
                            <span>2020-01-01</span>
                            <span>홍길동</span>
                        </div>                    
                        <pre class="code">
<div><span class="linenumber">1:</span>package java.io.*;</div>
<div><span class="linenumber">2:</span>public class Hello {</div>
<div><span class="linenumber">3:</span>    public static void main(String[] args) {</div>
<div><span class="linenumber">4:</span>        System.out.println("안녕하세요.");</div>
<div><span class="linenumber">5:</span>   }</div>
<div><span class="linenumber">6:</span>}</div></pre>
                    </div>

                    <div class="review">
                        <div class="item" data-line-start="1" data-line-end="1">
                            <span class="linenumber label label-primary">1 : 1</span>
                            <span class="text">패키지 선언입니다.</span>
                        </div>
                        <div class="item" data-line-start="2" data-line-end="6">
                            <span class="linenumber label label-primary">2 : 6</span>
                            <span class="text">클래스 선언입니다.</span>
                        </div>
                        <div class="item" data-line-start="3" data-line-end="5">
                            <span class="linenumber label label-primary">3 : 5</span>
                            <span class="text">메인 메소드 선언입니다.메인 메소드 선언입니다.메인 메소드 선언입니다.메인 메소드 선언입니다.</span>
                        </div>
                        <!-- 
                        <div class="item" data-line-start="0">
                            <span class="linenumber label label-default">clear</span>
                            <span class="text">선택을 해제합니다.</span>
                        </div> 
                        -->
                    </div>
                </div>



                <div class="itemreview">
                    <div class="item">
                        <div class="title">
                            <span>자바 기본 클래스입니다.</span>
                            <span>2020-01-01</span>
                            <span>홍길동</span>
                        </div>                    
                        <pre class="code">
<div><span class="linenumber">1:</span>package java.io.*;</div>
<div><span class="linenumber">2:</span>public class Hello {</div>
<div><span class="linenumber">3:</span>    public static void main(String[] args) {</div>
<div><span class="linenumber">4:</span>        System.out.println("안녕하세요.");</div>
<div><span class="linenumber">5:</span>   }</div>
<div><span class="linenumber">6:</span>}</div></pre>
                    </div>

                    <div class="review">
                        <div class="item" data-line-start="1" data-line-end="1">
                            <span class="linenumber label label-primary">1 : 1</span>
                            <span class="text">패키지 선언입니다.</span>
                        </div>
                        <div class="item" data-line-start="2" data-line-end="6">
                            <span class="linenumber label label-primary">2 : 6</span>
                            <span class="text">클래스 선언입니다.</span>
                        </div>
                        <div class="item" data-line-start="3" data-line-end="5">
                            <span class="linenumber label label-primary">3 : 5</span>
                            <span class="text">메인 메소드 선언입니다.메인 메소드 선언입니다.메인 메소드 선언입니다.메인 메소드 선언입니다. 메인 메소드 선언입니다.메인 메소드 선언입니다.</span>
                        </div>
                        <!-- 
                        <div class="item" data-line-start="0">
                            <span class="linenumber label label-default">clear</span>
                            <span class="text">선택을 해제합니다.</span>
                        </div> 
                        -->
                    </div>
                </div>


                
                

                <nav class="pagebar">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li class="active"><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/review/list.do';">
                        <span class="glyphicon glyphicon-th-list"></span>
                        목록
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/review/write.do';">
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
		var isSelection = false;

	    $(".review .item").mousedown(function() {
		
	        $(this).parents(".itemreview").find(".review .item").css("opacity", ".4");
	        $(this).css("opacity", "1");
	        isSelection = true;
	
	        $(this).parents(".itemreview").find(".code > div").css("background", "transparent");
	        let line_start = parseInt($(this).data("line-start"));
	        let line_end = parseInt($(this).data("line-end"));
	
	        if (line_start == 0) {
	            $(this).parents(".itemreview").find(".review .item").css("opacity", "1");
	            return;
	        }
	
	        $(this).parents(".itemreview").find(".code > div").each(function(index, item) {
	            if (index + 1 >= line_start && index + 1 <= line_end) {
	                $(this).css("background", "#DCDCDD");
	            }
	
	        });	
	        
	    });
    </script>
</body>

</html>