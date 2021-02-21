<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h1 class="page_title">${member_tName} 목록</h1>
			
			<div class="sub_title t2">총 <span>123</span>명의 회원이 조회되었으며 오늘 가입한 회원은 <span>123</span>명입니다</div>
			
			<table class="admin_style_02">
				<tr align="center">
					<!-- 회원타입 N:일반, B:중개사, F:업체 -->
					<th width="20%">ID<c:if test="${member_t != 'F'}">(이메일)</c:if></th>
					<c:if test="${member_t == 'B'}">
					<th width="15%">사업자대표명</th>
					</c:if>
					<c:if test="${member_t == 'N'}">
					<th width="10%">이름</th>
					<th width="10%">성별</th>
					<th width="10%">나이</th>
					</c:if>
					<c:if test="${member_t == 'F'}"><th width="20%">이메일</th></c:if>
					<c:if test="${member_t != 'N'}">
					<th width="20%">승인여부</th>
					<th width="20%">승인일자</th>
					</c:if>
					<th width="15%">연락처</th>
					<!-- <th width="7%">접속수</th>
					<th width="13%">최근 접속일</th>
					<th width="13%">가입일</th> -->
					<th width="20%">관리</th>
				</tr>
				<tr>
					<td>qasd1w123e@naver.com</td>
					<c:if test="${member_t != 'F'}"><td>김준수</td></c:if>
					<c:if test="${member_t == 'F'}"><td>qwertt1234@naver.com</td></c:if>
					<c:if test="${member_t == 'N'}">
					<td>남자</td>
					<td>60</td>
					</c:if>
					<c:if test="${member_t != 'N'}">
					<td>미승인</td>
					<td>2021-02-01</td>
					</c:if>
					<td>010-1234-5678</td>
					<td align="center"><span class="btn btn-primary btn-xs" onclick="userInfo()">회원정보</span></td>
				</tr>
			</table>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		function userInfo(uid){
			location.href="/sybang/admin2/member_detail_${member_t}.do?seq=" + uid;
		}
		
	</script>

</body>
</html>














