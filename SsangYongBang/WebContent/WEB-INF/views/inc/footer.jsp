<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.footer-cklee .container{margin:auto;}
</style>
<div class="footer-cklee">
	
	<p class="p-link">
		<a href="/sybang/notice/page.do?seq=1">회사소개</a>
		|<a href="/sybang/notice/page.do?seq=2">이용약관</a>
		|<a href="/sybang/notice/page.do?seq=3">개인정보처리방침</a>
		<c:if test="${access == 3}">
			|<a href="/sybang/admin/index.do">관리자 메뉴</a>
		</c:if>
	</p>
	<nav class="navbar navbar-default">
		<div class="container">
			
			<p class="navbar-text" id="footer-text">상호 : (주)쌍용방  |  대표 : 김진방<br>
주소 : 서울특별시 강남구 역삼동 735-1(역삼동, 한독빌딩)<br>
개인정보처리담당관 : 이다반<br>
서비스 이용문의 : 02-7668-8048  |  이메일 : cjddpf@sybang.com  |  서비스제휴문의 : partnership@sybang.com</p>
			
		</div> <!-- container-fluid -->
	</nav> <!-- navbar -->
</div>