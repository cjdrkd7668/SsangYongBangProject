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
	.mg-reivew .modal {
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
 
	.mg-review .modal-dialog {
        display: inline-block;
        vertical-align: middle;
	}
	
	.modal-open{overflow:auto;padding-right:0 !important;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>	
	<div class="container mg-review">
	
		<h1 class="welcome">후기 삭제 요청<small> 중개사가 삭제를 요청한 후기 목록</small></h1>
		
		<div class="buttons">
			<a class="btn btn-default btn-danger" href="#" role="button">요청 삭제</a>
			<a class="btn btn-default" href="#" role="button">전체 선택</a>
		</div>
		
		<table class="table table-hover table-type-list">
			<colgroup>
				<col width="550px">
				<col width="200px">
				<col width="150px">
				<col width="100px">
				<col width="100px">
			</colgroup>
			<thead class="board-table-head">
				<tr>
					<th scope="col" class="text-center">삭제 사유</th>
					<th scope="col" class="text-center ">글쓴이</th>
					<th scope="col" class="text-center ">작성일</th>
					<th scope="col" class="text-center">후기 확인</th>
					<th scope="col" class="text-center">선택</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
				<tr>
					<td class="text-left">저희 중개사와 거래한 고객이 아닙니다.</td>
					<td class="text-center">대박공인중개사사무소</td>
					<td class="text-center">2021-02-20</td>
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
						        <h4 class="modal-title">후기 확인</h4>
						      </div>
						      <div class="modal-body">
								<div><img src="/sybang/images/room01.jpg" alt="room01.jpg" class="img-thumbnail"></div>
								<div><h4>강하늘(kangsky@naver.com)</h4><p>전화로 친절하게 말씀해주셔서 고마웠어요~</p></div>
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-danger">후기 삭제</button>
        						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
                    </td>
                    <td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox">
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
