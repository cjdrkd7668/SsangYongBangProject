<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freepost.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
<!-- board-container 시작 -->
    <div class="board-container">
            <div class="page-header">
                <h2><strong>
                    <small class="blue">자유게시판</small> 글쓰기&nbsp;<i class="fas fa-pencil-alt blue"></i></strong>
                    
                
            </h2>
            <div class="divider"></div>
            
            </div>
            

        <table class="table table-default">
            <tr>
                <td><input type="text" id="board-title" class="form-control" placeholder="제목을 입력해주세요." style="height: 50px; width: 890px; font-size: 1.4em; box-shadow: 1px 0px 3px #486BB8;"></td>
                <td><textarea type="text" id="board-content" class="form-control" placeholder="내용을 입력해주세요." style="height: 200px; width: 890px; font-size: 1.1em; resize: none;  box-shadow: 1px 0px 3px #486BB8;"></textarea></td>
            </tr>
        </table>

        <div class="btns btn-group">
            <button type="button" class="btn btn-info" style="background-color: #486BB8;">
                <span class="glyphicon glyphicon-ok"></span> 등록하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/board/freelist.do'">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
        </div>

        
        

    </div>
    <!-- board-container 끝 -->
	
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>