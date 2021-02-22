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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
	
	<div class="container mg-approval">
	
		<h1 class="welcome">업체 승인<small> 부동산 중개사와 서비스업체 승인 관리</small></h1>
		
		<div class="buttons">
			<a class="btn btn-default btn-primary" href="#" role="button">승인</a>
			<a class="btn btn-default btn-danger" href="#" role="button">삭제</a>
			<a class="btn btn-default" href="#" role="button">전체 선택</a>
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
				<tr>
					<td class="text-center">부동산 중개사</td>
					<td>
						<div>좋은집나쁜집넓은집쌍용공인중개사</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 강남구 논현동 234-12334</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">시공 업체</td>
					<td>
						<div>시공월드</div>
						<div>이메일: <span>firm0020@gmail.com</span></div>
						<div>연락처: <span>02-765-6620</span></div>
					</td>
					<td class="text-center">서울특별시 영등포구 문래동6가 35</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">청소 업체</td>
					<td>
						<div>고클린</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 성동구 도선동 289</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">부동산 중개사</td>
					<td>
						<div>좋은집나쁜집넓은집쌍용공인중개사</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 강남구 논현동 234-12334</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">시공 업체</td>
					<td>
						<div>시공월드</div>
						<div>이메일: <span>firm0020@gmail.com</span></div>
						<div>연락처: <span>02-765-6620</span></div>
					</td>
					<td class="text-center">서울특별시 영등포구 문래동6가 35</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">청소 업체</td>
					<td>
						<div>고클린</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 성동구 도선동 289</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">부동산 중개사</td>
					<td>
						<div>좋은집나쁜집넓은집쌍용공인중개사</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 강남구 논현동 234-12334</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">시공 업체</td>
					<td>
						<div>시공월드</div>
						<div>이메일: <span>firm0020@gmail.com</span></div>
						<div>연락처: <span>02-765-6620</span></div>
					</td>
					<td class="text-center">서울특별시 영등포구 문래동6가 35</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>
				<tr>
					<td class="text-center">청소 업체</td>
					<td>
						<div>고클린</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 성동구 도선동 289</td>
					<td class="text-center">
						<div class="checkbox">
							<label>
						    	<input type="checkbox" value="">
							</label>
						</div>
                    </td>				
				</tr>	
				<tr>
					<td class="text-center">부동산 중개사</td>
					<td>
						<div>좋은집나쁜집넓은집쌍용공인중개사</div>
						<div>이메일: <span>qjedcs3@naver.com</span></div>
						<div>연락처: <span>010-2222-3333</span></div>
					</td>
					<td class="text-center">서울특별시 강남구 논현동 234-12334</td>
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
