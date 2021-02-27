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
			
			<form method="post" name="Frm" enctype="multipart/form-data">
			
			<input type="hidden" name="mode">
			<input type="hidden" name="type" value="F">
			<input type="hidden" name="seq" value="${dto.seq}">
			
			<table class="admin_style_01">
				<tr>
					<th width="20%" align="center">아이디</th>
					<td width="30%">
						<b>${dto.id}</b>
					</td>
					<th width="20%" align="center">비밀번호</th>
					<td width="30%">
						<input type="password" name="pw" class="box" value="" style="width:80px;" maxlength="12">
						<input type="hidden" name="pwd" value="${dto.pw}">
					</td>
				</tr>
				<tr>
					<th align="center">E-mail</th>
					<td colspan="3">
						<input type="text" name="email" value="${dto.email}" maxlength="100" class="box" style="width:300px">
					</td>
				</tr>
				<tr>
					<th align="center">연락처</th>
					<td colspan="3">
						<span style="width:90px; display:inline-block;"><select id="tel1" name="tel1"><option value="">선택</option><option value="02">02</option><option value="031">031</option><option value="032">032</option><option value="033">033</option><option value="041">041</option><option value="042">042</option><option value="043">043</option><option value="051">051</option><option value="052">052</option><option value="053">053</option><option value="054">054</option><option value="055">055</option><option value="061">061</option><option value="062">062</option><option value="063">063</option><option value="064">064</option><option value="070">070</option><option value="080">080</option><option value="0502">0502</option><option value="0505">0505</option><option value="0506">0506</option><option value="0303">0303</option></select></span>
						-
						<input type="text" name="tel2" class="box" size="4" value="${dto.tel.substring(3,6)}" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="tel3" class="box" size="4" value="${dto.tel.substring(7,11)}" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
					</td>
				</tr>
				<tr>
					<th align="center">주소</th>
					<td colspan="3">
						<input type="text" name="address" id="address" class="box" size="70" value="${dto.address}" maxlength="50">
					</td>
				</tr>
				<tr>
					<th align="center">업체 소개글</th>
					<td colspan="3">
						<input type="text" name="introduction" class="box" size="50" value="${dto.introduction}" maxlength="100">
					</td>
				</tr>
				<tr>
					<th align="center">업체 포트폴리오</th>
					<td colspan="3">
						${dto.portfolio}
						<input type="file" name="portfolio" class="box" size="50" value="${dto.portfolio}" maxlength="100" readonly>
						<input type="hidden" name="portfolioOri" value="${dto.portfolio}">
					</td>
				</tr>
				<tr>
					<th align="center">보유 포인트</th>
					<td colspan="3">
						<input type="text" name="availablePoint" class="box" size="10" value="${dto.availablePoint}" maxlength="100" readonly>p
					</td>
				</tr>
				<tr>
					<th align="center">상태</th>
					<td colspan="3">
						${dto.approval == 0 ? "미승인" : "승인"}
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
				<!-- <span class="btn btn-primary" onclick="del()">삭제</span> -->
			</div>
			
			<div class="sub_title">매출 통계</div>
			
			</form>
			
		</div>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
	function checkNum(value, isDec) {
		var RegExp;

		if (!isDec) isDec = false;
		RegExp = (isDec) ? /^-?[\d\.]*$/ : /^-?[\d]*$/;

		return RegExp.test(value)? true : false;
	}
	
	function stripCharFromNum(value, isDec) {
		var i;
		var minus = "-";
		var nums = "1234567890"+((isDec) ? "." : "");
		var result = "";

		for(i=0; i<value.length; i++) {
			numChk = value.charAt(i);
			if (i == 0 && numChk == minus) {
				result += minus;
			}
			else {
				for(j=0; j<nums.length; j++) {
					if(numChk == nums.charAt(j)) {
						result += nums.charAt(j);
						break;
					}
				}
			}
		}
		return result;
	}
	
	function blockNotNumber(e) {
		var e = window.event || e;
		if (window.event) {
			if (e.keyCode < 48 || e.keyCode > 57) e.returnValue = false;
		}
		else {
			if (e.which != 8 && (e.which < 48 || e.which > 57)) e.preventDefault(); // 8 : Back Space
		}
	}
	
	function stripComma(str) {
	    var re = /,/g;
	    return str.replace(re, "");
	}

	function numberOnly(obj, isDec) {
		if (!isDec) isDec = false;
		if (obj.disabled) return false;

		var num = obj.value.stripspace();
		if (num == "") return false;

		if (!checkNum(num, isDec)) {
			num = stripCharFromNum(num, isDec);
			obj.blur(); obj.focus();
		}
		num = stripCharFromNum(stripComma(num), isDec);

		var arrNum = num.split(".");
		if (arrNum.length > 1) {
			obj.value = arrNum[0]+"."+arrNum[1];
		}
		else {
			obj.value = arrNum[0];
		}
	}
	
	String.prototype.stripspace = function() {
		return this.replace(/ /g, '');
	}

	function checkEmpty(obj) {
		if (obj == "" || typeof(obj) == "undefined") {
			return true;
		}
		else {
			return false;
		}
	}
	
	function checkSsn(ssn1,ssn2) {
		if (ssn1.length == 6 && ssn2.length == 7) {
			return true;
		}
		else {
			return false;
		}
	}

	function del() {

		var f = document.Frm;

		if (confirm("선택하신 회원을 삭제하시겠습니까?")) {
			f.mode.value = "DEL";
			f.action = "/sybang/admin2/member_reg_ok.do";
			f.submit();
		}

	}
	
	function submitChk() {
		var f = document.Frm;
		var i;
		var objItem;

		if (checkEmpty(f.email)) {
			alert("E-mail을 입력해 주세요.");
			f.email.focus();
			return false;
		}

		for (i=1; i<=3; i++) {
			objItem = eval("f.tel"+i);
			if (checkEmpty(objItem)) {
				alert("연락처를 입력해 주세요.");
				objItem.focus();
				return false;
			}
		}

		if (checkEmpty(f.address)) {
			alert("주소를 입력해 주세요.");
			f.post.focus();
			return false;
		}
		
		if (checkEmpty(f.introduction)) {
			alert("업체 소개글을 입력해 주세요.");
			f.post.focus();
			return false;
		}

		if (confirm("등록하시겠습니까?")) {
			f.mode.value = "EDIT";
			f.action = "/sybang/admin2/member_reg_ok.do";
			f.submit();
		}
	}

	$("input[name=cbListAll]").on("change",function(){
		var c;
		if ($(this).is(":checked")) {
			c = true;
		}else{
			c = false;
		}
		$(this).parents("table").find("input[name=cbList]").prop("checked",c);
	});

	function userInfo(uid){
		location.href="/sybang/admin2/member_detail.do?seq=" + uid;
	}
	
	function list(){
		location.href = "/sybang/admin2/member_list.do?type=firm";
	}

	$(".left_menu").find("li").eq(4).addClass("on").find("li").eq(2).addClass("on");

	
	$("#tel1").ready(function(){
		$("#tel1").val("${dto.tel.substring(0,2)}").prop("selected",true);
	});
		
	</script>

</body>
</html>














