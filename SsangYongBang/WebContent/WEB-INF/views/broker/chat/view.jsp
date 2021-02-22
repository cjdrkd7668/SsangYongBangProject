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


</style>

</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>

	  
	<div class="container">
		<h1>구매자와 상담하기</h1>
		<hr>
		
        <table class="table table-bordered tbl-content">
            
            <tr>
                <td colspan="3" id="content-title" style="height: 40px; font-weight: bold; font-size: 1.1em;">자유게시판 글 제목입니다.</td>
            </tr>
            <tr>
                <td id="content-name">작성자&nbsp;:&nbsp;홍길동
                <td id="content-date">날짜&nbsp;:&nbsp;21.02.20 15:50</td>
            </tr>
            
            <tr>
                <td colspan="3" id="content-content">
                	자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글
                    내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.
               </td>
            </tr>
        </table>
        <!-- 자유게시판 글 끝 -->   
             
		<div class ="btn-group">
			<button type="button" class="btn btn-default btn-edit" onclick="location.href='/sybang/broker/chat/chatlist.do'">
				<span class="glyphicon glyphicon-list"></span> 목록보기
			</button> 
		</div>
    </div>

	
	


	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>