<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 입주 정보 글</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopepost.css">
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- list-container 시작 -->
	<div class="list-container" style="height: 550px; margin-top: -50px;">
		<div class="page-header">
			<h1>희망 입주 정보</h1>
		</div>
		
		<form name="Frm">
		<input type="hidden" name="seq" value="${dto.seq}">
		<input type="hidden" name="mseq" value="${dto.mseq}">
		<input type="hidden" name="mname" value="${dto.mname}">
		<input type="hidden" name="phone" value="${dto.phone}">
		<input type="hidden" name="hDType" value="${dto.hDType}">
		<input type="hidden" name="hPrice" value="${dto.hPrice}">
		<input type="hidden" name="hRent" value="${dto.hRent}">
		<input type="hidden" name="hAddress" value="${dto.hAddress}">
		<input type="hidden" name="hArea" value="${dto.hArea}">
		<input type="hidden" name="hRoomNum" value="${dto.hRoomNum}">
		<input type="hidden" name="content" value="${dto.content}">
		<input type="hidden" name="imgURL" value="${dto.imgURL}">

		<table class="table table-bordered">
			<tr>
				<th>거래 유형</th>
				<td>${dto.hDType}</td>
				<th>지역</th>
				<td>
					<!-- address 시작 -->
				<div class="address">
					${dto.hAddress}
				</div>
				<!-- address 끝 -->
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${dto.hPrice}<span>만원</span></td>
				<th>방 개수</th>
				<td>${dto.hRoomNum}<span>개</span></td>
			</tr>
			<tr>
				<th>면적</th>
				<c:if test="${dto.hRent != 0}">
				<td>
				</c:if>
				<c:if test="${dto.hRent == 0}">
				<td colspan=3>
				</c:if>
					${dto.hArea}<span>㎡</span>
				</td>
				<c:if test="${dto.hRent != 0}">
					<th>월세</th>
					<td>${dto.hRent}<span>만원</span></td>
				</c:if>
			</tr>
			<tr>
				<th>설명</th>
				<td colspan="3">
					<textarea class="form-control" rows="6" style="resize: none; font-size: 1em;">${dto.content}</textarea>
				</td>
			</tr>
		</table>

		
		<div class="btns btn-group">
			<button type="button" class="btn btn-default" onclick="edit()">
				<span class="glyphicon glyphicon-ok"></span> 수정하기
			</button>
			<button type="button" class="btn btn-default" onclick="del()">
				<span class="glyphicon glyphicon-trash"></span> 삭제하기
			</button>
			<button type="button" class="btn btn-default" onclick="location.href='/sybang/hope/list.do'">
				<span class="glyphicon glyphicon-list"></span> 목록보기
			</button>
		</div>
		
		</form>

	</div>
	
	<script type="text/javascript">
				
		function edit(){
			var f = document.Frm;
			f.method="post";
			f.action="/sybang/hope/post.do";
			f.submit();
		}
		
		function del(){
			var f = document.Frm;
			f.method="post";
			f.action="/sybang/hope/post_del_ok.do";
			
			var c = confirm("삭제하시겠습니까?")
			if (c) {
				f.submit();
			}
		}
	
	</script>
	<!-- list-container 끝 -->
	
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	
</body>
</html>














