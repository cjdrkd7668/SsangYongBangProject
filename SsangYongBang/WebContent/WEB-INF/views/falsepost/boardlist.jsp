<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/admin.css">
<link rel="stylesheet" href="/sybang/css/board.css">
<title>Insert title here</title>
<style type="text/css">
	.mg-false .modal {
        text-align: center;
	}
 
	@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
	}
 
	.mg-false .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
	}
	
	.modal-open{overflow:auto;padding-right:0 !important;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>	
	<div class="container mg-false">
	
		<h1 class="welcome">허위 매물 삭제<small> 회원이 허위 매물을 신고한 내역</small></h1>
		
		<div class="buttons">
			<a class="btn btn-default btn-danger" href="#" role="button">삭제</a>
			<a class="btn btn-default" href="#" role="button">전체 선택</a>
		</div>
		
		<table class="table table-hover table-type-list">
			<colgroup>
				<col width="650px">
				<col width="100px">
				<col width="150px">
				<col width="100px">
				<col width="100px">
			</colgroup>
			<thead class="board-table-head">
				<tr>
					<th scope="col" class="text-center">매물 제목</th>
					<th scope="col" class="text-center ">글쓴이</th>
					<th scope="col" class="text-center ">작성일</th>
					<th scope="col" class="text-center">신고 사유</th>
					<th scope="col" class="text-center">선택</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
				<tr>
					<td class="text-left"><a target="_blank" href="/sybang/admin/house/view.do">★강남 시내 내부 오피스텔★ 주요 역 1분 이내 초대박 매물! 놓치지 마세요~</a></td>
					<td class="text-center">김짜장</td>
					<td class="text-center">2021-02-16</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#false-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
	                    
						<!-- Modal -->
						<div class="modal" id="false-detail" tabindex="-1" role="dialog" data-backdrop="false">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">상세설명</h4>
						      </div>
						      <div class="modal-body">
						        이미 팔린 매물이네요.. 이런 식이면 사이트 관리 안하시나요? 이미 팔린 매물이네요.. 이런 식이면 사이트 관리 안하시나요? 이미 팔린 매물이네요.. 이런 식이면 사이트 관리 안하시나요?
						      </div>
						    </div>
						  </div>
						</div>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">역삼역 신축 오피스텔! 분리형 원룸 원거실로 월세 보고 가세요~</a></td>
					<td class="text-center">박짬뽕</td>
					<td class="text-center">2021-02-15</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">UU월세보증금협의가능UU 1달 가능한 신축급 역삼역 도보5분 깔끔한 풀옵션 오피스텔</a></td>
					<td class="text-center">최만두</td>
					<td class="text-center">2021-02-15</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">1달 가능한 신축급 역삼역 도보5분 풀옵션 오피스텔</a></td>
					<td class="text-center">최만두</td>
					<td class="text-center">2021-02-13</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">역삼역 신축 오피스텔! 분리형 원룸 원거실로 월세 보고 가세요~</a></td>
					<td class="text-center">박짬뽕</td>
					<td class="text-center">2021-02-15</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">UU월세보증금협의가능UU 1달 가능한 신축급 역삼역 도보5분 깔끔한 풀옵션 오피스텔</a></td>
					<td class="text-center">최만두</td>
					<td class="text-center">2021-02-15</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">1달 가능한 신축급 역삼역 도보5분 풀옵션 오피스텔</a></td>
					<td class="text-center">최만두</td>
					<td class="text-center">2021-02-13</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">역삼역 신축 오피스텔! 분리형 원룸 원거실로 월세 보고 가세요~</a></td>
					<td class="text-center">박짬뽕</td>
					<td class="text-center">2021-02-15</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">UU월세보증금협의가능UU 1달 가능한 신축급 역삼역 도보5분 깔끔한 풀옵션 오피스텔</a></td>
					<td class="text-center">최만두</td>
					<td class="text-center">2021-02-15</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
				<tr>
					<td class="text-left"><a href="/sybang/admin/house/view.do">1달 가능한 신축급 역삼역 도보5분 풀옵션 오피스텔</a></td>
					<td class="text-center">최만두</td>
					<td class="text-center">2021-02-13</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>
				</tr>
			</tbody>
		</table>
		
		<!-- pagination -->
	    <nav class="nav-pagination">
		  	<ul class="pagination">
			    <li>
			    	<a href="#" aria-label="Previous">
				   		<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
					<a href="#" aria-label="Next">
				    	<span aria-hidden="true">&raquo;</span>
			      	</a>
			    </li>
		  	</ul>
		</nav>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>
