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
			<h1 class="page_title">업체 목록</h1>
			
			<div class="sub_title">업체 정보</div>
			
			<form method="post" name="Frm">
			
			<table class="admin_style_01">
				<tr>
					<th width="20%" align="center">아이디</th>
					<td width="30%">
						<b>ssungoon</b>
					</td>
					<th width="20%" align="center">비밀번호</th>
					<td width="30%">
						<input type="text" name="pass" class="box" style="width:80px;" maxlength="12">
						<input type="hidden" name="pwd">
					</td>
				</tr>
				<tr>
					<th align="center">E-mail</th>
					<td colspan="3">
						<input type="text" name="email" value="ssungoon@gmail.com" maxlength="100" class="box" style="width:300px">
					</td>
				</tr>
				<tr>
					<th align="center">연락처</th>
					<td colspan="3">
						<span style="width:90px; display:inline-block;"><select id="tel1" name="tel1"><option value="">선택</option><option value="02">02</option><option value="031">031</option><option value="032">032</option><option value="033">033</option><option value="041">041</option><option value="042">042</option><option value="043">043</option><option value="051">051</option><option value="052">052</option><option value="053">053</option><option value="054">054</option><option value="055">055</option><option value="061">061</option><option value="062">062</option><option value="063">063</option><option value="064">064</option><option value="070">070</option><option value="080">080</option><option value="0502">0502</option><option value="0505">0505</option><option value="0506">0506</option><option value="0303">0303</option></select></span>
						-
						<input type="text" name="tel2" class="box" size="4" value="" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="tel3" class="box" size="4" value="" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
					</td>
				</tr>
				<tr>
					<th align="center">주소</th>
					<td colspan="3">
						<input type="text" name="addr" id="addr" class="box" size="70" value="충남 서천군 판교면 금덕길 9" maxlength="50">
					</td>
				</tr>
				<tr>
					<th align="center">업체 소개글</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="50" value="" maxlength="100">
					</td>
				</tr>
				<tr>
					<th align="center">업체 포트폴리오</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="50" value="" maxlength="100" readonly>
					</td>
				</tr>
				<tr>
					<th align="center">보유 포인트</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="50" value="" maxlength="100">
					</td>
				</tr>
				<tr>
					<th align="center">상태</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="50" value="" maxlength="100">
					</td>
				</tr>
				<tr>
					<th align="center">승인일자</th>
					<td colspan="3">
						2020-04-01 10:57:20
					</td>
				</tr>
			</table>
			
			<div class="btnWrap">
				<span class="btn btn-default" onclick="list()">목록으로</span>
				<span class="btn btn-primary" onclick="submitChk()">수정</span>
				<span class="btn btn-primary" onclick="del()">삭제</span>
			</div>
			
			<div class="sub_title">매출 통계</div>
			
			</form>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
		$(".left_menu").find("li").eq(4).addClass("on").find("li").eq(2).addClass("on");
	
		function userInfo(uid){
			location.href="/sybang/admin2/member_detail.do?seq=" + uid;
		}
	</script>

</body>
</html>














