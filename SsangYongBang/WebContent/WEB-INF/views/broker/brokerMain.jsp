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
    left: 45%
}

.btn-edit {
	margin-right: 5px;
}

.btn-del {
	position: absolute;
    right: 5%;
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
		<form method="POST" action="">

			<h1>내 프로필</h1>
			<div class = "profilebox">
				<img src="/sybang/images/logo.png" width="150px" height="200px" id="pic">
				<div id="selectpic">
					<button  type="button" class="btn btn-default" style="display: block;"><span class="glyphicon glyphicon-picture"></span> 사진선택</button>		
				</div>
			</div>
			<hr>



			<div style="float: revert; padding-left: 270px;">
			
				<table class="table table-bordered" id="profile">
					<tbody>
						<tr>
							<th>아이디</th>
							<td>hong123</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password"></td>
						</tr>
						<tr>
							<th>사업자 대표명</th>
							<td>홍길동</td>
						</tr>
						<tr>
							<th>사업자 상호</th>
							<td><input type="text" value="좋은집공인중개사사무소"></td>
						</tr>
						<tr>
							<th>중개등록 번호</th>
							<td>38473298318273</td>
						</tr>
						<tr>
							<th>주소지</th>
							<td><input type="text" value="서울특별시 강남구 역삼동 735-1"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" value="023451234"></td>
						</tr>
						<tr>
							<th>사업자 등록번호</th>
							<td>4821238496</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class ="btn-group">
				<button type="button" class="btn btn-default btn-edit">
					<span class="glyphicon glyphicon-ok"></span> 수정하기
				</button> 
				
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button>	
			</div>
			<div class ="btn-del">
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-trash"></span> 탈퇴하기
				</button>
			</div>
		</form>
	</div>

	<div style="clear: both;"></div>



	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


</body>
</html>