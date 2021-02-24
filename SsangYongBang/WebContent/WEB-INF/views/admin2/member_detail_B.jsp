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
	<div class="wrap member_detail_B">	
		<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
		<div class="conWrap funkyradio">
			<h1 class="page_title">중개사 목록</h1>
			
			<div class="sub_title">중개사 정보</div>
			
			<form method="post" name="Frm">
			
			<table class="admin_style_01">
				<tr>
					<th width="20%" align="center">아이디(E-mail)</th>
					<td width="30%">
						<b>${dto.id}</b>
					</td>
					<th width="20%" align="center">비밀번호</th>
					<td width="30%">
						<input type="text" name="pass" class="box" style="width:80px;" maxlength="12">
						<input type="hidden" name="pwd">
					</td>
				</tr>
				<tr>
					<th align="center">사업자대표명</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="50" value="" maxlength="100" style="width:141px">
					</td>
				</tr>
				<tr>
					<th align="center">사업자상호</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="50" value="" maxlength="100" style="width:285px">
					</td>
				</tr>
				<tr>
					<th align="center">중개등록번호</th>
					<td colspan="3">
						<input type="text" name="bizNo1" class="box" size="3" value="" maxlength="3" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="bizNo2" class="box" size="2" value="" maxlength="2" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="bizNo3" class="box" size="5" value="" maxlength="5" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
					</td>
				</tr>
				<tr>
					<th align="center">사업자등록번호</th>
					<td colspan="3">
						<input type="text" name="bizNo1" class="box" size="3" value="" maxlength="3" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="bizNo2" class="box" size="2" value="" maxlength="2" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input type="text" name="bizNo3" class="box" size="5" value="" maxlength="5" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
					</td>
				</tr>
				<tr>
					<th align="center">연락처</th>
					<td colspan="3">
						<span style="width:86px; display:inline-block;"><select id="tel1" name="tel1"><option value="">선택</option><option value="02">02</option><option value="031">031</option><option value="032">032</option><option value="033">033</option><option value="041">041</option><option value="042">042</option><option value="043">043</option><option value="051">051</option><option value="052">052</option><option value="053">053</option><option value="054">054</option><option value="055">055</option><option value="061">061</option><option value="062">062</option><option value="063">063</option><option value="064">064</option><option value="070">070</option><option value="080">080</option><option value="0502">0502</option><option value="0505">0505</option><option value="0506">0506</option><option value="0303">0303</option></select></span>
						-
						<input style="vertical-align:middle;width:90px" type="text" name="tel2" class="box" size="4" value="" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
						-
						<input style="vertical-align:middle;width:90px" type="text" name="tel3" class="box" size="4" value="" maxlength="4" onkeypress="blockNotNumber(event)" onkeyup="numberOnly(this)" onblur="numberOnly(this)">
					</td>
				</tr>
				<tr>
					<th align="center">주소</th>
					<td colspan="3">
						<input type="text" name="addr" id="addr" class="box" size="70" value="충남 서천군 판교면 금덕길 9" maxlength="50">
					</td>
				</tr>
				<tr>
					<th align="center">중개사 신청서류</th>
					<td colspan="3">
						<input type="text" name="etc2" class="box" size="70" value="" maxlength="100" readonly>
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
			
			<div class="sub_title">등록한 매물</div>
			<table class="admin_style_02">
				<tr>
					<th><label><input type="checkbox" name="cbListAll"><span></span></label></th>
					<th>번호</th>
					<th>유형</th>
					<th>가격</th>
					<th>지역</th>
					<th>면적</th>
					<th>작성일</th>
					<th>중개사</th>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2021-02-01</td>
					<td>vip공인중개사</td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="cbList"><span></span></label></td>
					<td>111</td>
					<td>매매</td>
					<td>2억5000</td>
					<td>강남구</td>
					<td>27㎡</td>
					<td>2021-02-01</td>
					<td>vip공인중개사</td>
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
					<span class="btn btn-primary" onclick="del()">삭제</span>
				</div>
			</nav>
			
			<div class="sub_title">사용 통계</div>
			
			
			
			</form>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
		$(".left_menu").find("li").eq(4).addClass("on").find("li").eq(1).addClass("on");
	
		function userInfo(uid){
			location.href="/sybang/admin2/member_detail.do?seq=" + uid;
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
		
		
		
	</script>

</body>
</html>














