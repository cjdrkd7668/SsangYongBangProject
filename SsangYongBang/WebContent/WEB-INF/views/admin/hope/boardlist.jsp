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

	.mg-hope .modal {
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
 
	.mg-hope .modal-dialog {
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
	<div class="container mg-hope">
		
		
		<h1 class="welcome">희망입주조건 관리<small> 일반 회원이 게시한 희망 입주 조건 게시글</small></h1>
		
		<!-- 
		<form method="GET" action="/sybang/admin/hope/boardlist.do" id="admin-hope-search">
			<div class="search">
				<h3>희망입주조건 지역별 검색</h3>
				<input type="text" placeholder="강남구 역삼동" id="search" name="search">
				<span onclick="$('#admin-hope-search').submit();"><span class="glyphicon glyphicon-search"></span></span>
			</div>
		</form>
		 
		<div class="message">
        	'${search}'(으)로 ${ahlist.size()}건의 게시물을 검색했습니다.
        </div>
		 -->
		
		<table class="table table-hope">
			<colgroup>
				<col width="100px">
				<col width="150px">
				<col width="400px">
				<col width="150px">
				<col width="200px">
				<col width="100px">
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">거래형태</th>
					<th class="text-center">가격(만원)</th>
					<th class="text-center">지역 및 입주조건</th>
					<th class="text-center">작성자</th>
					<th class="text-center">연락처</th>
					<th class="text-center">상세설명</th>			
				</tr>	
			</thead>		
			<tbody>
				<c:forEach items="${ahlist}" var="ahdto">
				<tr>
					<td class="text-center">${ahdto.hdtype}</td>
					<td class="text-center">
						${ahdto.hprice}<c:if test="${ahdto.hdtype == '월세'}"> / ${ahdto.hrent}</c:if>
					</td>
					<td>
						<div>${ahdto.haddress}</div>
						<div>희망 면적(전용 면적): <span>${ahdto.harea} &#13217;</span></div>
						<div>희망 방 개수: <span>${ahdto.hroomnum} 개</span></div>
					</td>
					<td class="text-center">${ahdto.mname}</td>
					<td class="text-center">${ahdto.phone}</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail${ahdto.seq}">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
	                    
						<!-- Modal -->
						<div class="modal" id="hope-detail${ahdto.seq}" tabindex="-1" role="dialog" data-backdrop="false">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">상세설명</h4>
						      </div>
						      <div class="modal-body">
						        ${ahdto.content}
						      </div>
						    </div>
						  </div>
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
