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
		<div class="conWrap">
			<h1 class="page_title">사이트 환경설정</h1>
			
			<form method="post" action="config_site_ok.do" name="Frm">
			
			<div class="sub_title">계정정보</div>
			<table class="admin_style_01">
				<colgroup>
					<col width="20%"><col width="*">
				</colgroup>
				<tr>
					<th>관리자아이디</th>
					<td>
						<input type="text" name="adminID" value="${adto.id}" style="width:150px" maxlength="20">&nbsp;
						<span class="admin-color-text">20자 이하.</span>
						<span id="checkID"></span>
					</td>
				</tr>
				<tr>
					<th>관리자비밀번호</th>
					<td><input type="text" name="adminPass" value="${adto.pw}" style="width:150px" maxlength="20">&nbsp; <span class="admin-color-text">20자 이하.</span></td>
				</tr>
				<tr>
					<th>관리자명</th>
					<td><input type="text" name="adminName" value="${adto.name}" style="width:150px" maxlength="15">&nbsp; <span class="admin-color-text">15자 이하.</span></td>
				</tr>
			</table>
			<div class="sub_title">회사정보</div>
			<table class="admin_style_01">
				<colgroup>
					<col width="20%"><col width="*">
				</colgroup>
				<tr>
					<th>회사 전화번호</th>
					<td><input type="text" name="siteTel" value="${sdto.tel}" style="width:150px" maxlength=20></td>
				</tr>
				<tr>
					<th>회사 이메일</th>
					<td><input type="text" name="siteEmail" value="${sdto.email}" style="width:150px" maxlength=30></td>
				</tr>
				<tr>
					<th>회사주소</th>
					<td><input type="text" name="siteAddress" value="${sdto.address}" style="width:150px" maxlength=30></td>
				</tr>
				<tr>
					<th>대표자명</th>
					<td><input type="text" name="siteCeo" value="${sdto.representative}" style="width:150px" maxlength=15></td>
				</tr>
				<tr>
					<th>개인정보관리자명</th>
					<td><input type="text" name="sitePolicyManager" value="${sdto.policyManager}" style="width:150px" maxlength=15></td>
				</tr>
			</table>
			
			<p id="result" style="color:red"></p>
			
			<div class="btnWrap">
				<span class="btn btn-primary" onclick="submitChk()">확인</span>
				<a href="javascript:window.history.back();" class="btn btn-default">취소</a>
			</div>
			
			</form>
			
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		function submitChk(){
			
			if (rs == "0") {
				var f = document.Frm
				var r = confirm("수정하시겠습니까?");
				if (r) {
					f.submit();
				}
			}else{
				$("#result").text("※ 아이디를 확인하세요")
			}
		};
		
		var rs = 0;
		
		$("input[name=adminID]").on("change keyup paste",function(){
			$.ajax({
				type : "POST",
				url : "/sybang/admin2/config_site_data.do",
				data : "id=" + $(this).val(),
				success : function(result) {
					rs = result;
					if (result == 0){
						$("#checkID").text("※ 사용 가능한 아이디입니다.").css("color","blue");
						$("#result").text("");
					}else{
						$("#checkID").text("※ 사용 불가능한 아이디입니다.").css("color","red");
					}
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});

	</script>

</body>
</html>














