<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중개사 공간</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/broker.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/chatview.css">

<style>

.btn-del {
    position: relative;
    left: 305px;
}

</style>

</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>

	  
	<div class="container">
		<h1>후기/평점 조회하기</h1>
		<hr>
		
        <table class="table table-bordered tbl-content">
            
            <!-- <tr>
                <td colspan="3" id="content-title" style="height: 40px; font-weight: bold; font-size: 1.1em;">자유게시판 글 제목입니다.</td>
            </tr> -->
            <tr>
                <td id="content-name">작성자&nbsp;:&nbsp;${dto.mname}
                <td id="content-date">날짜&nbsp;:&nbsp;${dto.regDate}</td>
            </tr>
            <tr>
            	<td colspan="3" id="score">평점&nbsp;:&nbsp;${dto.star}</td>            	
            </tr>
            
            <tr>
                <td colspan="3" id="content-content">${dto.content}</td>
            </tr>
        </table>
        <!-- 자유게시판 글 끝 -->   
             
		<div class ="btn-group">
			<button type="button" class="btn btn-default" onclick="location.href='/sybang/broker/review/reviewlist.do'">
				<span class="glyphicon glyphicon-list"></span> 목록보기
			</button> 
		</div>
		
		<div class ="btn-group btn-del">
			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-trash"></span>삭제 요청하기
			</button>
				
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">후기 삭제 요청하기</h4>
						</div>
						<div class="modal-body">
							<form action="./requestRegister.jsp" method="POST">
								<div class="form-row">
									<div class="form-group">
										<label>후기 삭제 요청 사유</label>
										<textarea name="evaluationContent" class="form-control" maxlength="2000" style="height: 180px; resize: none;"></textarea>
									</div>
								</div>
	
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">삭제 요청하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
    </div>

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>