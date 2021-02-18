<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/*  
.container {
	margin-left: 180px;
	min-height: 600px;
}
*/
.left_menu {
	float: left;
	width: 180px;
	border-right: 1px solid #ddd;
}

.left_menu li {
	line-height: 28px;
}

.left_menu li.depth {
	background: url("/sybang/images/bottom_icon.png") no-repeat 90% 10px/8px;
}

.left_menu li a {
	font-size: 14px;
	color: #333;
	font-weight: bold;
	margin: 4px 16px 6px;
}

.left_menu li ul {
	display: none;
	text-indent: 15px;
}
</style>

<div class="left_menu">
	<ul>
		<li><a href="/sybang/broker/brokerMain.do">내 프로필</a></li>
		<li><a href="javascript:;">매물 등록하기</a>
			<ul>
				<li><a href="/sybang/broker/roomList.do">등록된 매물 조회</a></li>
				<li><a href="/sybang/broker/brokerRegister.do">매물 등록하기</a></li>
				<li><a href="javascript:;">내가 등록한 매물</a></li>
			</ul></li>
		<li><a href="javascript:;">광고</a>
			<ul>
				<li><a href="javascript:;">광고 결제하기</a></li>
				<li><a href="javascript:;">광고 시작하기</a></li>
				<li><a href="javascript:;">진행 중인 광고 조회</a></li>
			</ul></li>
		<li><a href="javascript:;">구매자와 상담하기</a></li>
		<li><a href="javascript:;">희망 매물 조회하기</a></li>
		<li><a href="javascript:;">후기/평점 조회하기</a></li>
	</ul>
</div>


<script>
	$(".left_menu>ul>li").each(function() {
		if ($(this).find("ul").length) {
			$(this).addClass("depth")
		}
	})

	$(".left_menu>ul>li").mouseenter(function() {
		$(this).find("ul").stop().slideDown();
	})
	$(".left_menu>ul>li").mouseleave(function() {
		$(this).find("ul").stop().slideUp();
	})
</script>






