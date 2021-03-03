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
			
			<div class="sub_title t2">총 <span>${cnt}</span>명의 회원이 조회되었습니다. <!--으며 오늘 가입한 회원은 <span>0</span>명입니다 --></div>
			
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
					<th width="15%">
						<c:if test="${member_t == 'N'}">휴대폰</c:if>
						<c:if test="${member_t != 'N'}">연락처</c:if>
					</th>
					<!-- <th width="7%">접속수</th>
					<th width="13%">최근 접속일</th>
					<th width="13%">가입일</th> -->
					<th width="20%">관리</th>
				</tr>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.id}</td> <!-- 아이디 -->
					<c:if test="${member_t != 'F'}"><td>${dto.name}</td></c:if> <!-- 이름 -->
					<c:if test="${member_t == 'F'}"><td>${dto.email}</td></c:if> <!-- 이메일 -->
					<c:if test="${member_t == 'N'}">
					<td>${dto.gender}</td> <!-- 성별 -->
					<td>${dto.age}</td> <!-- 나이 -->
					</c:if>
					<c:if test="${member_t != 'N'}">
					<td>미승인</td> <!-- 승인여부 -->
					<td>2021-02-01</td> <!-- 승인일자 -->
					</c:if>
					<c:if test="${member_t == 'N'}">
					<td>${dto.phone}</td> <!-- 휴대폰 -->
					</c:if>
					<c:if test="${member_t != 'N'}">
					<td>${dto.tel}</td> <!-- 휴대폰 -->
					</c:if>
					<td align="center"><span class="btn btn-primary btn-xs" onclick="userInfo(${dto.seq})">회원정보</span></td>
				</tr>
				</c:forEach>
			</table>
			
			<nav class="pagebar">
				<ul class="pagination">
					${pagebar}
				</ul>
			</nav>
			
		</div>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		function userInfo(uid){
			location.href="/sybang/admin2/member_detail_${member_t}.do?seq=" + uid;
		}
		
	</script>

</body>
</html>














