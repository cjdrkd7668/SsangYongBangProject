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
			<h1 class="page_title">회사운영정책</h1>
			<c:if test="${seq > 0}">
				<div class="sub_title">${dto.subject} 수정</div>
			</c:if>
			<c:if test="${seq == null}">
				<div class="sub_title">추가</div>
			</c:if>
			<table class="admin_style_01">
				<colgroup>
					<col width="10%"><col width="*">
				</colgroup>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="box" style="width:350px" value="${dto.subject}">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea>${dto.content}</textarea></td>
				</tr>
			</table>
		
			<div class="btnWrap">
				 <span class="btn btn-primary">확인</span>
				 <span class="btn btn-default" onclick="back();">취소</span>
			</div>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


	<script type="text/javascript">
		function back(){
			var c = confirm("변경된 내용이 저장되지 않을 수 있습니다.\r목록으로 이동하시겠습니까?");
			
			if (c) {
				window.history.back();
			}
		}
		
		
	</script>

</body>
</html>














