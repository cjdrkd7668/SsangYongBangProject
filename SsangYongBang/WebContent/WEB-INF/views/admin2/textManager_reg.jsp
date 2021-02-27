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
			<h1 class="page_title">회사 운영정책</h1>
			<c:if test="${type == 'edit'}">
				<div class="sub_title">${dto.subject} 수정</div>
			</c:if>
			<c:if test="${type == 'add'}">
				<div class="sub_title">항목 추가</div>
			</c:if>
			
			<form method="post" action="/sybang/admin2/textManager_reg_ok.do" enctype="multipart/form-data">
			
			<input type="hidden" name="type" value="${type}">
			<input type="hidden" name="seq" value="${seq}">
			
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
					<td><textarea name="content">${dto.content}</textarea></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<c:if test="${dto.imgURL.toLowerCase().endsWith('jpg') || dto.imgURL.toLowerCase().endsWith('gif') || dto.imgURL.toLowerCase().endsWith('png') }">
							<img src="/sybang/files/admin2/${dto.imgURL}" style="max-width:100%">
						</c:if>
						<input type="file" name="imgURL">
					</td>
				</tr>
			</table>
		
			<div class="btnWrap">
				 <span class="btn btn-primary" onclick="submit()">확인</span>
				 <span class="btn btn-default" onclick="back();">취소</span>
			</div>
			
			</form>
			
		</div>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


	<script type="text/javascript">
		var changeFlag = 0;
		$("textarea[name='content']").focus(function(){
			console.log(1111);
			changeFlag = 1;
		});
		function back(){
			if (changeFlag == 1) {
				var c = confirm("변경된 내용이 저장되지 않을 수 있습니다.\r목록으로 이동하시겠습니까?");
			}
			if (changeFlag == 0 || c) {
				location.href = "/sybang/admin2/textManager.do";
			}
		}
		
		function submit(){
			if ($("input[name='subject']").val() == "") {
				alert("제목을 입력하세요.")
				return;
			}
			if ($("textarea").val() == "") {
				alert("내용을 입력하세요.")
				return;
			}
			
			$("form").submit();
		}
		
		
	</script>

</body>
</html>














