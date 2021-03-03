<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/admin_asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<%=SITE_TITLE%>
<style type="text/css">
	.con{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;word-wrap:break-word;line-height:1.2em;max-height:2.4em;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="wrap">
		<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
		<div class="conWrap">
			<h1 class="page_title">회사 운영정책</h1>
			
			<div class="sub_title t2">총 <span>${list.size()}</span>개의 정보가 등록되어 있습니다.</div>
			<table class="admin_style_02">
			<tr align="center">
				<th width="7%">No</th>
				<th width="25%">제목</th>
				<th width="55%">내용</th>
				<th width="13%">관리</th>
			</tr>

<%
			ArrayList list = (ArrayList)request.getAttribute("list");

			int i = list.size();
%>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td><%=i%></td>
				<td>${dto.subject}</td>
				<td>
					<div class="con">
						${dto.content}
					</div>
				</td>
				<td align="center"><span class="btn btn-default btn-xs" onclick="edit(${dto.seq})">수정</span></td>
			</tr>
<%
			i--;
%>
			</c:forEach>

	
			</table>
			
			<div class="btnWrap">
				<span class="btn btn-default" onclick="add();">추가</span>
			</div>
			
		</div>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	
	<script type="text/javascript">
		function edit(uid){
			location.href="/sybang/admin2/textManager_reg.do?type=edit&seq=" + uid;
		}
		
		function add(){
			location.href="/sybang/admin2/textManager_reg.do?type=add";
		}
		
		
		
		
		
	</script>


</body>
</html>














