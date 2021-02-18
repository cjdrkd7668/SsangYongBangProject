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
		<div class="container">
			<h1 class="page_title">일반회원 관리</h1>
			
			<div class="sub_title type2">총 <span>123</span>명의 회원이 조회되었으며 오늘 가입한 회원은 <span>123</span>명입니다</div>
			
			<table class="admin_style_01">
			<colgroup>
				<!-- <col width="10%"><col width="*"> -->
			</colgroup>
			<tr>
				<th>제목</th>
				<td>
					
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea>${dto.content}</textarea></td>
		</tr>
		</table>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


</body>
</html>














