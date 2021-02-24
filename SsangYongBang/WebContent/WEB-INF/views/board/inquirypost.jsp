<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 글쓰기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freepost.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- board-container 시작 -->
	<div class="board-container">
		<div class="page-header">
			<h2>
				<strong> <small class="blue">문의게시판</small> 글쓰기&nbsp;<i
					class="fas fa-pencil-alt blue"></i></strong>


			</h2>
			<div class="divider"></div>

		</div>

		<!-- form 태그 시작 -->
		<form method="POST" action="/sybang/board/inquirypostok.do">
			<table class="table table-default">
				<tr>
					<td>
					<!-- 문의 제목 -->
					<input type="text" name="subject" id="subject"
						class="form-control" placeholder="제목을 입력해주세요."
						style="height: 50px; width: 780px; font-size: 1.4em; box-shadow: 1px 0px 3px #486BB8; float:left; margin-right: 5px;"
						required>
						
						<!-- 공개 여부 -->
						<!-- 비공개 -->
						<div style="float: left; padding: 10px;">
						<input type="radio" name="openflag" id="openflag1" value="0" style="margin-right: 5px; border:0px;" checked><label for="openflag1"><i class="fas fa-lock" style="font-size: 1.5em; color: #486BB8;"></i></label>
						<!-- 공개 -->
						<input type="radio" name="openflag" id="openflag2" value="1" style="margin-right: 5px; margin-left: 5px; border:0px;"><label for="openflag2"><i class="fas fa-lock-open" style="font-size: 1.5em; color: #486BB8;"></i></label>
						</div>
						</td>
					<td>
					<!-- 문의 내용 -->
					<textarea type="text" name="detail" id="detail"
							class="form-control" placeholder="내용을 입력해주세요." style="height: 200px; width: 890px; font-size: 1.1em; resize: none; box-shadow: 1px 0px 3px #486BB8;"
							required></textarea>
							</td>
				</tr>
			</table>
			
			

			<div class="btns btn-group">
				
				<button type="submit" class="btn btn-info"
					style="background-color: #486BB8;">
					<span class="glyphicon glyphicon-ok"></span> 등록하기
				</button>
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/board/inquirylist.do'">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button>
			</div>
		</form>
		<!-- form 태그 끝 -->


	</div>
	<!-- board-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>