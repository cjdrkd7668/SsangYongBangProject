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
				<tr>
					<td class="text-center">월세</td>
					<td class="text-center">1000/73</td>
					<td>
						<div>서울시 강남구 역삼동</div>
						<div>희망 면적(전용 면적): <span>31 &#13217;</span></div>
						<div>희망 방 개수: <span>1 개</span></div>
					</td>
					<td class="text-center">홍동길</td>
					<td class="text-center">010-2222-3333</td>
					<td class="text-center">
						<button class="btn btn-default modal-button" type="button" data-toggle="modal"
	                        data-target="#hope-detail">
	                        <span class="glyphicon glyphicon-comment"></span>
	                    </button>
	                    
						<!-- Modal -->
						<div class="modal" id="hope-detail" tabindex="-1" role="dialog" data-backdrop="false">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">상세설명</h4>
						      </div>
						      <div class="modal-body">
						        강아지를 키울 수 있어야 해요! 연락주시면 날짜를 맞춰서 방 보러 가겠습니다.강아지를 키울 수 있어야 해요! 연락주시면 날짜를 맞춰서 방 보러 가겠습니다.강아지를 키울 수 있어야 해요! 연락주시면 날짜를 맞춰서 방 보러 가겠습니다.강아지를 키울 수 있어야 해요! 연락주시면 날짜를 맞춰서 방 보러 가겠습니다.강아지를 키울 수 있어야 해요! 연락주시면 날짜를 맞춰서 방 보러 가겠습니다.
						      </div>
						    </div>
						  </div>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">전세</td>
					<td class="text-center">12억 5000</td>
					<td>
						<div>서울시 강남구 천호동</div>
						<div>희망 면적(전용 면적): <span>59 &#13217;</span></div>
						<div>희망 방 개수: <span>2 개</span></div>
					</td>
					<td class="text-center">하호히</td>
					<td class="text-center">010-4444-5555</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">월세</td>
					<td class="text-center">1000/73</td>
					<td>
						<div>서울시 강남구 역삼동</div>
						<div>희망 면적(전용 면적): <span>31 &#13217;</span></div>
						<div>희망 방 개수: <span>1 개</span></div>
					</td>
					<td class="text-center">홍동길</td>
					<td class="text-center">010-2222-3333</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">전세</td>
					<td class="text-center">12억 5000</td>
					<td>
						<div>서울시 강남구 천호동</div>
						<div>희망 면적(전용 면적): <span>59 &#13217;</span></div>
						<div>희망 방 개수: <span>2 개</span></div>
					</td>
					<td class="text-center">하호히</td>
					<td class="text-center">010-4444-5555</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">월세</td>
					<td class="text-center">1000/73</td>
					<td>
						<div>서울시 강남구 역삼동</div>
						<div>희망 면적(전용 면적): <span>31 &#13217;</span></div>
						<div>희망 방 개수: <span>1 개</span></div>
					</td>
					<td class="text-center">홍동길</td>
					<td class="text-center">010-2222-3333</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">전세</td>
					<td class="text-center">12억 5000</td>
					<td>
						<div>서울시 강남구 천호동</div>
						<div>희망 면적(전용 면적): <span>59 &#13217;</span></div>
						<div>희망 방 개수: <span>2 개</span></div>
					</td>
					<td class="text-center">하호히</td>
					<td class="text-center">010-4444-5555</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">월세</td>
					<td class="text-center">1000/73</td>
					<td>
						<div>서울시 강남구 역삼동</div>
						<div>희망 면적(전용 면적): <span>31 &#13217;</span></div>
						<div>희망 방 개수: <span>1 개</span></div>
					</td>
					<td class="text-center">홍동길</td>
					<td class="text-center">010-2222-3333</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">전세</td>
					<td class="text-center">12억 5000</td>
					<td>
						<div>서울시 강남구 천호동</div>
						<div>희망 면적(전용 면적): <span>59 &#13217;</span></div>
						<div>희망 방 개수: <span>2 개</span></div>
					</td>
					<td class="text-center">하호히</td>
					<td class="text-center">010-4444-5555</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">월세</td>
					<td class="text-center">1000/73</td>
					<td>
						<div>서울시 강남구 역삼동</div>
						<div>희망 면적(전용 면적): <span>31 &#13217;</span></div>
						<div>희망 방 개수: <span>1 개</span></div>
					</td>
					<td class="text-center">홍동길</td>
					<td class="text-center">010-2222-3333</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
				</tr>
				<tr>
					<td class="text-center">전세</td>
					<td class="text-center">12억 5000</td>
					<td>
						<div>서울시 강남구 천호동</div>
						<div>희망 면적(전용 면적): <span>59 &#13217;</span></div>
						<div>희망 방 개수: <span>2 개</span></div>
					</td>
					<td class="text-center">하호히</td>
					<td class="text-center">010-4444-5555</td>
					<td class="text-center"><span class="glyphicon glyphicon-comment"></span></td>				
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
