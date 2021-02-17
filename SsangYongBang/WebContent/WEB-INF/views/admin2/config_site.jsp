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
			<h1 class="page_title">사이트 환경설정</h1>
			
			<form method="POST" action="">
				<div class="sub_title">관리자 정보</div>
				<table class="admin_style_01">
					<tr>
						<th width=200>관리자 아이디</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>관리자 비밀번호</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text"></td>
					</tr>
				</table>
				
				<div class="sub_title">회사 정보</div>
				<table class="admin_style_01">
					<tr>
						<th width=200>회사 전화번호</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>회사 이메일</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>회사 주소</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text"></td>
					</tr>
				</table>
			</form>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>














