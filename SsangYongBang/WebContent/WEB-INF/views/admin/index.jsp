<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/admin.css">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>	
	<div class="container mg-main">
	
		<h1 class="welcome">김진방<small>관리자님, 반갑습니다.</small></h1>
		
		<h2>현재 사이트 내에서는 …</h2>
		
		<div class="alarm">
			<div>
				<span>승인을 기다리는 <span class="alarm-num">7</span>개의<br><span>중개사가 있습니다.</span></span>
			</div>
			<a href="#">바로가기 <img src="/sybang/images/right_icon.png"></a>
		</div>
		<div class="alarm">
			<div>
				<span>승인을 기다리는 <span class="alarm-num">10</span>개의<br><span>서비스 업체가 있습니다.</span></span>
			</div>
			<a href="#">바로가기 <img src="/sybang/images/right_icon.png"></a>
		</div>
		<div class="alarm">
			<div>
				<span>확인이 필요한 <span class="alarm-num">13</span>건의<br><span>후기 삭제 요청이 있습니다.</span></span>
			</div>
			<a href="#">바로가기 <img src="/sybang/images/right_icon.png"></a>
		</div>
		<div class="alarm">
			<div>
				<span>확인이 필요한 <span class="alarm-num">6</span>건의<br><span>허위 매물 신고가 있습니다.</span></span>
			</div>
			<a href="#">바로가기 <img src="/sybang/images/right_icon.png"></a>
		</div>
		<div class="alarm">
			<div>
				<span>새로 게시된 <span class="alarm-num">2</span>건의<br><span>문의 게시글이 있습니다.</span></span>
			</div>
			<a href="#">바로가기 <img src="/sybang/images/right_icon.png"></a>
		</div>
		
		<div class=""></div>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>
