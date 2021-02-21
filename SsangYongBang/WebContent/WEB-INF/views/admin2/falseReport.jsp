<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/admin_asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<%=SITE_TITLE%>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="wrap">	
		<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
		<div class="conWrap">
			<h1 class="page_title">허위 매물 신고내역</h1>
			
			<div class="sub_title t2">총 <span>111</span>개의 글이 등록되어 있습니다.</div>
			
			<table class="admin_style_02">
				<tr>
					<th>번호</th>
					<th>신고사유</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
				<tr>
					<td>11</td>
					<td>이미 나간 매물</td>
					<td>내용이 들어갈 공간내용이 들어갈 공간내용이 들어갈 공간</td>
					<td>2021-02-01</td>
				</tr>
			</table>
			
			<nav class="pagebar">
				<ul class="pagination">
					<li>
			            <a href="#" aria-label="Previous">
			                <span aria-hidden="true">&laquo;</span>
			            </a>
			        </li>
			        <li><a href="/codestudy/board/list.do">1</a></li>
			        <li>
			            <a href="#" aria-label="Next">
			                <span aria-hidden="true">&raquo;</span>
			            </a>
					</li>
				</ul>
			</nav>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>














