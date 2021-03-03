<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중개사 공간</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/broker.css">

<style>

.wrap-box {
	float: right; width: calc(1200px - 180px); padding-left: 15px; position: relative
}

.table {
    width: 700px;
    max-width: 100%;
    margin-bottom: 20px;
}

#selectpic {
	padding-top: 15px;
	padding-left: 27px;
}

.btn-group {
	float: left;
    position: relative;
    left: 47%
}

.btn-edit {
	margin-right: 5px;
}

.btn-del {
	position: absolute;
    right: 15%;
}

.profilebox {
	position: absolute; 
	left: 65px; 
	top: 150px;
}

</style>


</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>



	<div class="wrap wrap-box">
		<form method="POST" action="/sybang/broker/editok.do">

			<h1>내 프로필</h1>
		<!-- 	<div class = "profilebox">
				<img src="/sybang/images/logo.png" width="150px" height="200px" id="pic">
				<div id="selectpic">
					<button  type="button" class="btn btn-default" style="display: block;"><span class="glyphicon glyphicon-picture"></span> 사진선택</button>		
				</div>
			</div> -->
			<hr>

			<div style="float: revert; padding-left: 150px;">
			
				<table class="table table-bordered" id="profile">
					<tbody>
						<tr>
							<th>아이디</th>
							<td>${bdto.email}</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" value="${bdto.pw}" name="brkPw"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" value="${bdto.pw}" name="brkPw"></td>
						</tr>
						<tr>
							<th>사업자 대표명</th>
							<td>${bdto.name}</td>
						</tr>
						<tr>
							<th>사업자 상호</th>
							<td><input type="text" value="${bdto.businessName}" name="brkBusinessName"></td>
						</tr>
						<tr>
							<th>중개등록 번호</th>
							<td>${bdto.brokerNum}</td>
						</tr>
						<tr>
							<th>주소지</th>
							<td><input type="text" value="${bdto.address}" name="brkAddress" name="brkAddress"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" value="${bdto.tel}" name="brkTel"></td>
						</tr>
						<tr>
							<th>사업자 등록번호</th>
							<td>${bdto.businessNum}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class ="btn-group">
			
				<input type="submit" class="btn btn-default" value="수정하기">
				<!-- 
				<button type="button" class="btn btn-default btn-edit">
					<span class="glyphicon glyphicon-ok"></span> 수정하기
				</button> 
				 -->			
				<!-- <button type="button" class="btn btn-default"  onclick="#">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button> -->	
			</div>
		
			
			<div class ="btn-del">
				<a class="btn btn-default" data-toggle="modal" data-target="#myModal" role="button">탈퇴하기</a>
			</div>
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">탈퇴하기</h4>
			      </div>
			      <div class="modal-body">
			        <p>정말 탈퇴하시겠습니까?</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" onclick="location.href='/sybang/broker/deleteOk.do?email=${bdto.email}'">예, 탈퇴하겠습니다.</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">다시 생각해볼게요.</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
			
			
		</form>
	</div>

	<div style="clear: both;"></div>



	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


</body>
</html>