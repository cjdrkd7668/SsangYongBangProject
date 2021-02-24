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
	<div class="wrap memberList">	
		<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
		<div class="conWrap funkyradio">
			<h1 class="page_title">일반회원 목록</h1>
			
			<form method="post" name="Frm">
			
			<div class="sub_title">회원 정보</div>
			
			<table class="admin_style_01">
				<tr>
					<th width="20%" align="center">아이디</th>
					<td width="30%">
						<input type="text" name="id" class="box" value="${dto.id}" style="width:140px;" maxlength="12">
					</td>
					<th width="20%" align="center">비밀번호</th>
					<td width="30%">
						<input type="password" name="pw" class="box" value="" style="width:80px;" maxlength="12">
						<input type="hidden" name="pwd" value="${dto.pw}">
					</td>
				</tr>
				<tr>
					<th align="center">성명</th>
					<td colspan="3" style="">
						<input type="text" name="name" class="box" style="width:140px;" value="${dto.name}" maxlength="15">
					</td>
				</tr>
				<tr>
					<th align="center">주민번호</th>
					<td colspan="3" style="">
						<input type="text" name="name" class="box" style="width:142px;" value="${dto.ssn.substring(0,6)}" maxlength="15">
						-
						<input type="text" name="name" class="box" style="width:142px;" value="${dto.ssn.substring(7,14)}" maxlength="15">
					</td>
				</tr>
				<tr>
					<th align="center">생년월일</th>
					<td colspan="3">
						<input type="text" name="birthYear" class="box" size="4" value="${dto.birthY}" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						년
						<input type="text" name="birthMonth" class="box" size="2" value="${dto.ssn.substring(2,4)}" maxlength="2" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						월
						<input type="text" name="birthDay" class="box" size="2" value="${dto.ssn.substring(4,6)}" maxlength="2" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						일
					</td>
				</tr>
				<tr>
					<th align="center">E-mail</th>
					<td colspan="3">
						<input type="text" name="email" value="${dto.email}" maxlength="100" class="box" style="width:296px">
					</td>
				</tr>
				<tr>
					<th align="center">휴대폰</th>
					<td colspan="3">
						<span style="width:90px; display:inline-block;"><select id="mobile1" name="mobile1"><option value="">선택</option><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="018">018</option><option value="019">019</option></select></span>
						-
						<input type="text" name="mobile2" class="box" size="4" value="${dto.phone.substring(4,8)}" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="mobile3" class="box" size="4" value="${dto.phone.substring(9,13)}" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
					</td>
				</tr>
				<tr>
					<th align="center">주소</th>
					<td colspan="3">
						<input type="text" name="addr" id="addr" class="box" size="70" value="${dto.address}" maxlength="50">
					</td>
				</tr>
			</table>
			
			<div class="btnWrap">
				<span class="btn btn-default" onclick="list()">목록으로</span>
				<span class="btn btn-primary" onclick="submitChk()">수정</span>
				<span class="btn btn-primary" onclick="del()">삭제</span>
			</div>
			
			<div class="sub_title">등록한 매물</div>
			
			<table class="admin_style_02">
				<tr>
					<th><label><input type="checkbox" name="cbListAll"><span></span></label></th>
					<th>번호</th>
					<th>거래유형</th>
					<th>건물유형</th>
					<th>가격</th>
					<th>지역</th>
					<th>면적</th>
					<th>방 개수</th>
					<th>상태</th>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>아파트</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2개</td>
					<td>게시</td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>222</td>
					<td>월세</td>
					<td>원룸</td>
					<td>50만/50만</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2개</td>
					<td>숨김</td>
				</tr>
			</table>
			
			<nav class="pagebar">
                    <ul class="pagination">
                        <li>
				            <a href="#" aria-label="Previous">
				                <span aria-hidden="true">&laquo;</span>
				            </a>
				        </li>
				        <li><a href="/codestudy/board/list.do">1</a></li>
				        <li>
				            <a href="#" aria-label="Next">
				                <span aria-hidden="true">&raquo;</span>
				            </a>
				        </li>
                    </ul>
                    <div class="btnWrap">
					<span class="btn btn-default">방 내리기/올리기</span>
					<span class="btn btn-default">삭제하기</span>
				</div>
			</nav>
			
			
			<div class="sub_title">희망 매물</div>
			
			<table class="admin_style_02">
				<tr>
					<th><label><input type="checkbox" name="cbListAll" id="d1"><span></span></label></th>
					<th>번호</th>
					<th>유형</th>
					<th>가격</th>
					<th>지역</th>
					<th>면적</th>
					<th>방 개수</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2개</td>
					<td>2021-02-01</td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2개</td>
					<td>2021-02-01</td>
				</tr>
			</table>
			
			
			<nav class="pagebar">
                    <ul class="pagination">
                        <li>
				            <a href="#" aria-label="Previous">
				                <span aria-hidden="true">&laquo;</span>
				            </a>
				        </li>
				        <li><a href="/codestudy/board/list.do">1</a></li>
				        <li>
				            <a href="#" aria-label="Next">
				                <span aria-hidden="true">&raquo;</span>
				            </a>
				        </li>
                    </ul>
                    <div class="btnWrap rgt">
					<span class="btn btn-default">삭제하기</span>
				</div>
			</nav>
			
			<div class="sub_title">찜 목록</div>
			<table class="admin_style_02">
				<tr>
					<th><label><input type="checkbox" name="cbListAll"><span></span></label></th>
					<th>번호</th>
					<th>유형</th>
					<th>가격</th>
					<th>지역</th>
					<th>면적</th>
					<th>방 개수</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2개</td>
					<td>2021-02-01</td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2개</td>
					<td>2021-02-01</td>
				</tr>
			</table>
			
			<nav class="pagebar">
				<ul class="pagination">
					<li>
			            <a href="#" aria-label="Previous">
			                <span aria-hidden="true">&laquo;</span>
			            </a>
			        </li>
			        <li><a href="/codestudy/board/list.do">1</a></li>
			        <li>
			            <a href="#" aria-label="Next">
			                <span aria-hidden="true">&raquo;</span>
			            </a>
			        </li>
				</ul>
			</nav>
			
			</form>
			
			
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
		$(".left_menu").find("li").eq(4).addClass("on").find("li").eq(0).addClass("on");
	
		function userInfo(uid){
			location.href="/sybang/admin2/member_detail.do?seq=" + uid;
		}
		

		function list(){
			location.href = "/sybang/admin2/member_list.do?type=normal";
		}
		

		function del() {

			var f = document.Frm;

			if (confirm("선택하신 회원을 삭제하시겠습니까?")) {
				f.mode.value = "DEL";
				f.action = "member_regOk.do";
				f.submit();
			}

		}
		

		function submitChk() {
			var f = document.Frm;
			var i, len;
			var objItem;

			if (checkEmpty(f.name)) {
				alert("성명을 입력해 주세요.");
				f.name.focus();
				return false;
			}

			if (checkEmpty(f.email)) {
				alert("E-mail을 입력해 주세요.");
				f.email.focus();
				return false;
			}

			if (!checkEmail(f.email.value)) {
				alert("형식에 맞지 않는 이메일 주소입니다.\n\n이메일 주소를 정확하게 입력해 주세요.");
				f.email.focus();
				return false;
			}

			for (i=1; i<=3; i++) {
				objItem = eval("f.mobile"+i);
				if (checkEmpty(objItem)) {
					alert("휴대폰번호를 입력해 주세요.");
					objItem.focus();
					return false;
				}
			}

			if (checkEmpty(f.post) || checkEmpty(f.addr)) {
				alert("주소를 입력해 주세요.");
				f.post.focus();
				return false;
			}

			if (confirm("등록하시겠습니까?")) {
				f.mode.value = "EDIT";
				f.action = "member_regOk.do";
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
		
		$("#mobile1").ready(function(){
			$("#mobile1").val("${dto.phone.substring(0,3)}").prop("selected",true);
		});
		
	</script>

</body>
</html>














