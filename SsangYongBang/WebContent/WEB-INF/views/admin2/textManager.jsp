<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/admin_asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="wrap">	
		<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
		<div class="container">
			<h1 class="page_title">회사 운영정책</h1>
			
			<div class="sub_title type2">총 <span>123</span>개의 정보가 등록되어 있습니다.</div>
			<table class="admin_style_02">
			<tr align="center">
				<th width="7%">No</th>
				<th width="25%">제목</th>
				<th width="55%">내용</th>
				<th width="13%">관리</th>
			</tr>
	
			<tr>
				<td>${seq}</td>
				<td>${subject}</td>
				<td>${content}</td>
				<td align="center"><span class="btn btn-default btn-xs" onclick="edit(222)">수정</span></td>
			</tr>
	
			</table>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


</body>
</html>














