<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<a class="btn btn-default btn-danger" role="button">요청 삭제</a>
			<a class="btn btn-default" role="button" id="select-all">전체 선택</a>
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
					<th scope="col" class="text-center ">처리 여부</th>
					<th scope="col" class="text-center">후기 확인</th>
					<th scope="col" class="text-center">선택</th>
				</tr>
			</thead>
			<tbody class="board-table-body">
			
				<c:forEach items="${list}" var="ardto">
				<tr>
					<td class="text-left">${ardto.detail}</td>
					<td class="text-center">${ardto.businessName}</td>
					<td class="text-center">${ardto.doneFlag}</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#false-detail-${ardto.seq}">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
	                    
						<!-- Modal -->
						<div class="modal" id="false-detail-${ardto.seq}" tabindex="-1" role="dialog" data-backdrop="false">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">후기 확인</h4>
						      </div>
						      <div class="modal-body">
								<div><img style="width: 400px" src="/sybang/images/${ardto.imgURL}" alt="${ardto.imgURL}" class="img-thumbnail"></div>
								<div><h4>${ardto.brvName}(${ardto.brvId})</h4><p>${ardto.reviewContent}</p></div>
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
						<div class="checkbox" >
							<label>
						    	<input type="checkbox" value="${ardto.seq}" name="check" class="checkbuttons">
							</label>
						</div>
                    </td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- pagination -->
	    <nav class="nav-pagination">
		  	<ul class="pagination">
			    ${pageBar}
		  	</ul>
		</nav>
		
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	</script>

</body>
</html>
