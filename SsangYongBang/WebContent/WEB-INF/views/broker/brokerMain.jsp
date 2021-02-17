<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>


<style>

	.panel-body {
		padding: 0px;
	}

	.panel-body table tr td {
		padding-left: 15px
	}

	.panel-body .table {
		margin-bottom: 0px;
	}
	
</style>

</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3">
				<div class="panel-group" id="accordion">

					<!-- 중개사 > 내 프로필 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#">내 프로필</a>
							</h4>
						</div>
					</div>

					<!-- 중개사 > 공지사항 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#">공지사항</a>
							</h4>
						</div>
					</div>

					<!-- 중개사 > 뉴스 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#">뉴스</a>
							</h4>
						</div>
					</div>


					<!-- 중개사 > 커뮤니티 게시판 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo">커뮤니티 게시판</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="#">자유 게시판</a></td>
									</tr>
									<tr>
										<td><a href="#">문의 게시판</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<!-- 중개사 > 커뮤니티 게시판 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree">매물 등록하기</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="#">등록된 매물 조회</a></td>
									</tr>
									<tr>
										<td><a href="#">매물 등록하기</a></td>
									</tr>
									<tr>
										<td><a href="#">내가 등록한 매물</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>


					<!-- 중개사 > 광고 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseFour">광고</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="#">광고 결제하기</a></td>
									</tr>
									<tr>
										<td><a href="#">광고 시작하기</a></td>
									</tr>
									<tr>
										<td><a href="#">진행 중인 광고 조회</a></td>
									</tr>


								</table>
							</div>
						</div>
					</div>


					<!-- 중개사 > 구매자와 상담하기 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#">구매자와 상담하기</a>
							</h4>
						</div>
					</div>

					<!-- 중개사 > 희망 매물 조회하기 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#">희망 매물 조회하기</a>
							</h4>
						</div>
					</div>

					<!-- 중개사 > 후기/평점 조회하기 메뉴  -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#">후기/평점 조회하기</a>
							</h4>
						</div>
					</div>

				</div>
			</div>
			
			<div class="container">
				가나다
			</div>
			
			<!--  
			<div class="col-sm-9 col-md-9">
				<div class="well">
					<h1>Accordion Menu With Icon</h1>
				</div>
			</div>
			-->
			
			
		</div>
	</div>





	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>