<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<li><a href="/sybang/hope/list.do">희망입주하기</a></li>
					<li><a href="/sybang/house/post.do">방내놓기</a></li>
					<li class="dropdown">
          			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span class="caret"></span></a>
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="/sybang/notice/boardList.do">공지사항</a></li>
				            <li><a href="#">뉴스</a></li>
				            <li><a href="/sybang/board/freelist.do">자유게시판</a></li>
				            <li><a href="#">문의게시판</a></li>
			         	</ul>
        			</li>
					<li class="dropdown">
          			<a href="/sybang/broker/brokerMain.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">중개사공간<span class="caret"></span></a>
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="#">내 프로필</a></li>
				            <li><a href="#">공지사항</a></li>
				            <li><a href="#">커뮤니티 게시판</a></li>
				            <li class="divider"></li>
				            <li><a href="#">매물 등록하기</a></li>
				            <li><a href="#">광고</a></li>
				            <li><a href="#">구매자와 상담하기</a></li>
				            <li class="divider"></li>
				            <li><a href="#">희망 매물 조회하기</a></li>
				            <li><a href="#">후기/평점 조회하기</a></li>
			         	</ul>
        			</li>
					<li class="dropdown">
          			<a href="/sybang/service/servicemain.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">청소/시공<span class="caret"></span></a>
			          	<ul class="dropdown-menu" role="menu">
				            <li><a href="/sybang/service/ServicestoreList.do">전문업체 찾기</a></li>
				            <li><a href="#">고객요청서</a></li>
				            <li class="divider"></li>
				            <li><a href="#">1:1 문의</a></li>
				            <li><a href="#">후기</a></li>
				            <li class="divider"></li>
				            <li><a href="#">마이페이지</a></li>
			         	</ul>
        			</li>
				</ul>
				<p class="navbar-text navbar-right"><a href="#" class="navbar-link">회원가입</a></p>
				<p class="navbar-text navbar-right"><a href="/sybang/member/login.do" class="navbar-link">로그인</a></p>
				<p class="navbar-text navbar-right"><a href="/sybang/member/mypage.do" class="navbar-link">마이페이지</a></p>
			
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

