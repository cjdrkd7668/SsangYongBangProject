<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>	
	<div class="container">
		<h1 class="page_title">사이트 환경설정</h1>
		
		<form method="POST" action="">
			<h2>관리자 정보</h2>
			<table class="admin_style_01">
				<tr>
					<th>관리자 아이디</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>관리자 비밀번호</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>이름</td>
					<td><input type="text"></td>
				</tr>
			</table>
			
			<h2>회사 정보</h2>
			<table class="admin_style_01">
				<tr>
					<th>회사 전화번호</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>회사 이메일</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>회사 주소</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>대표자명</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>이름</td>
					<td><input type="text"></td>
				</tr>
			</table>
		</form>
		
	</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>














