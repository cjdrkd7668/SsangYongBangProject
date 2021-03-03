<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<style type="text/css">
	body > .container{min-height:500px}
	body > .container img{display:block;max-width:100%}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container">
		<h1 class="page-header">${dto.subject}</h1>
		${dto.content}
		<c:if test="${dto.imgURL.toLowerCase().endsWith('jpg') || dto.imgURL.toLowerCase().endsWith('gif') || dto.imgURL.toLowerCase().endsWith('png') }">
			<img src="/sybang/files/${dto.imgURL}">
		</c:if>
	</div>

	<script type="text/javascript">
		
	</script>

	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>














