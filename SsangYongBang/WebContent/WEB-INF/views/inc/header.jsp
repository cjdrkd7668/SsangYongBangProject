<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	/* house.css와 width, padding 충돌 */
	.header-cklee .dropdown, .dropdown-menu {
	    width: auto;
	    padding: 0px;
	}
</style>

<div class="header-cklee">
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/sybang/index.do">
				<img alt="Brand" src="/sybang/images/logo.png" id="logo">
			</a>
			<div class="collapse navbar-collapse">
			
				<ul class="nav navbar-nav">
					<li class="active"><a href="/sybang/index.do">홈</a></li>
					<li><a href="/sybang/house/search.do">방찾기</a></li>
					<li><a href="/sybang/hope/post.do">희망입주하기</a></li>
					<li><a href="/sybang/house/post.do">방내놓기</a></li>
					<li class="dropdown">
          			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span class="caret"></span></a>
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="/sybang/notice/list.do">공지사항</a></li>
				            <li><a href="/sybang/news/boardList.do">뉴스</a></li>
				            <li><a href="/sybang/free/list.do">자유게시판</a></li>
				            <c:if test="${not empty email }">
				            <li><a href="/sybang/board/inquirylist.do">문의게시판</a></li>
				            </c:if>
			         	</ul>
        			</li>
					<li class="dropdown">
          			<a href="/sybang/broker/brokerMain.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">중개사공간<span class="caret"></span></a>
			          	<c:if test="${not empty email && access == 0 }">
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="/sybang/broker/brokerMain.do">내 프로필</a></li>
				            <li><a href="/sybang/broker/room/roomList.do">매물 등록하기</a></li>
				            <li><a href="/sybang/broker/ad/payment.do">광고</a></li>
				            <li><a href="/sybang/broker/chat/chatlist.do">구매자와 상담하기</a></li>
				            <li class="divider"></li>
				            <li><a href="/sybang/broker/hope/hopelist.do">희망 매물 조회하기</a></li>
				            <li><a href="/sybang/broker/review/reviewlist.do">후기/평점 조회하기</a></li>
			         	</ul>
			         	</c:if>
        			</li>
        			
					<li class="dropdown">
          			<a href="/sybang/service/servicemain.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">청소/시공<span class="caret"></span></a>
			          	<c:if test="${not empty email}">
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="/sybang/service/servicemain.do">청소/시공업체 홈</a></li>			          	
				            <li><a href="/sybang/service/ServicestoreList.do">전문업체 찾기</a></li>
				            <li><a href="/sybang/request/requestlist.do">고객요청서</a></li>
				            <li class="divider"></li>
				            <li><a href="/sybang/servicechat/servicechat.do">1:1 문의</a></li>
				            <li><a href="/sybang/servicereview/servicereview.do">후기</a></li>
				            <li class="divider"></li>
				            <c:if test="${access == 2}"> <!-- 업체로 로그인 시 보이는 메뉴 -->
				            <li><a href="/sybang/service/servicemypage.do">마이 서비스</a></li>
				           	</c:if>
			         	</ul>
			         	</c:if>
        			</li>
        			
        			
        			
        			<!-- 로그인 전 -->
        			<c:if test="${empty email }">
        			<li><a href="/sybang/login/loginbuttons.do" style="font-size: 1.3em;">로그인</a></li>
        			<li><a href="#" style="font-size: 1.3em;">회원가입</a></li>
        			</c:if>
        			
        			<!-- 로그인 후 -->
        			<c:if test="${not empty email }">
        			<c:if test="${access == 1 }">
        			<li class="dropdown">
          			<a href="/sybang/member/mypage.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 1.3em;">마이페이지<span class="caret"></span></a>
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="/sybang/member/myinfo.do" style="font-size: 1.1em;">내 정보 관리</a></li>
				            <li><a href="#" style="font-size: 1.1em;">스케줄러</a></li>
				            <li><a href="#" style="font-size: 1.1em;">1:1 문의 내역</a></li>
			         	</ul>
        			</li>
        			</c:if>
	
        			<li><a href="/sybang/member/logout.do" style="font-size: 1.3em;">로그아웃</a></li>
        			</c:if>


				</ul>
			</div>
		</div> <!-- container-fluid -->
	</nav> <!-- navbar -->
</div>

<script>
	$(document).ready(function() {    
	  $('.navbar-default .navbar-nav > li.dropdown').hover(function() {
		$('ul.dropdown-menu', this).stop(true, true).slideDown('fast');
		$(this).addClass('open');
	  }, function() {
		$('ul.dropdown-menu', this).stop(true, true).slideUp('fast');
		$(this).removeClass('open');
	  });
	});
	
</script>

