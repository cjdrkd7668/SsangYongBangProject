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
			<h1 class="page_title">${member_tName} 목록</h1>
			
			<div class="sub_title type2">총 <span>123</span>명의 회원이 조회되었으며 오늘 가입한 회원은 <span>123</span>명입니다</div>
			
			<table class="admin_style_02">
				<tr align="center">
					<th width="7%">No</th>
					<th width="25%">ID(이메일)</th>
					<th width="13%">이름</th>
					<th width="7%">성별</th>
					<th width="7%">나이</th>
					<th width="7%">접속수</th>
					<th width="13%">최근 접속일</th>
					<th width="13%">가입일</th>
					<th width="13%">관리</th>
				</tr>
				<tr>
					<td>123</td>
					<td>qasd1w123e@naver.com</td>
					<td>김준수</td>
					<td>남자</td>
					<td>123</td>
					<td>123</td>
					<td>2021-02-01</td>
					<td>2021-02-01</td>
					<td align="center"><span class="btn btn-primary btn-xs" onclick="userInfo()">회원정보</span></td>
				</tr>
			</table>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
		console.log("${member_type}");
	
		function userInfo(uid){
			location.href="/sybang/admin2/member_detail.do?type=${member_type}&seq=" + uid;
		}
	</script>

</body>
</html>














