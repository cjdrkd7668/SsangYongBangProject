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
<title>업체 승인</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
	
	<div class="container mg-approval">
	
		<h1 class="welcome">업체 승인<small> 부동산 중개사와 서비스업체 승인 관리</small></h1>
		
		<form method="POST" action="/sybang/approval/approve.do">
		
		<div class="buttons">
			<a class="btn btn-default btn-primary" href="#" role="button">승인</a>
			<a class="btn btn-default btn-danger" id="delete-request" role="button">삭제</a>
			<a class="btn btn-default" id="select-all" role="button">전체 선택</a>
		</div>
		
		<table class="table table-approval">
			<colgroup>
				<col width="200px">
				<col width="600px">
				<col width="500px">
				<col width="100px">
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">업체 종류</th>
					<th class="text-center">업체명</th>
					<th class="text-center">주소</th>
					<th class="text-center">선택</th>			
				</tr>	
			</thead>		
			<tbody>
				<c:forEach items="${apList}" var="apdto">
				<tr>
					<td class="text-center">${apdto.category}</td>
					<td>
						<div>${apdto.name}</div>
						<div>이메일: <span>${apdto.email}</span></div>
						<div>연락처: <span>${apdto.tel}</span></div>
					</td>
					<td class="text-center">${apdto.address}</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" class="checkbuttons" value="${apdto.category}_${apdto.seq}" name="appro-check">
							</label>
						</div>
                    </td>				
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		</form>
		
		
		
		<!-- pagination -->
	    <nav class="nav-pagination">
		  	<ul class="pagination">
			    ${pageBar}
		  	</ul>
		</nav>
       
    </div>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
	
	var url = "/sybang/approval/deleteok.do?seq=";
	
	$('#select-all').click(function(){
		$('.checkbuttons').prop('checked', true);
	});
		
	$("#delete-request").click(function() {
		if ($('.checkbuttons:checked').length > 0) {
			
			$('.checkbuttons:checked').each(function(index, item){
				console.log($(item).val());
				$(location).attr('href', url + $(item).val());
				
			})
		}
	});
	
	$(".btn-delete-review").click(function() {
		$(location).attr('href', "/sybang/approval/deleteok.do?seq=" + $(this).val());
	})
	
	</script>

</body>
</html>
