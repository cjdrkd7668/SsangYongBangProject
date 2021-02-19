<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopelist.css">
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

            <!-- list-container 시작 -->
    <div class="list-container">
        <div class="page-header">
            <h1><strong style="color: #3777BA;">자유</strong>게시판</h1>
            <!-- <div class="well well-sm" style="float:left;">총 <b>5</b>개의 자유게시판 글이 등록되어 있습니다.</div> -->
        </div>

        <table class="table table-hover">   
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
            </tr>
            <tr>
                <td>1</td>
                <td>제목입니다.</td>
                <td>홍길동</td>
                <td>2021-02-17</td>
            </tr>
            <tr>
                <td>1</td>
                <td>제목입니다.</td>
                <td>홍길동</td>
                <td>2021-02-17</td>
            </tr>
            <tr>
                <td>1</td>
                <td>제목입니다.</td>
                <td>홍길동</td>
                <td>2021-02-17</td>
            </tr>
            <tr>
                <td>1</td>
                <td>제목입니다.</td>
                <td>홍길동</td>
                <td>2021-02-17</td>
            </tr>
            <tr>
                <td>1</td>
                <td>제목입니다.</td>
                <td>홍길동</td>
                <td>2021-02-17</td>
            </tr>

        </table>
    

    <!-- page-bar 시작 -->
    <nav class="page-bar">
        <ul class="pagination">
            <li><a href="#" aria-label="Previous"> <span
                    aria-hidden="true">&laquo;</span>
            </a></li>
            <li class="active"><a href="/sybang/board/freelist.do">1</a></li>
            <li><a href="/sybang/board/freelist.do">2</a></li>
            <li><a href="/sybang/board/freelist.do">3</a></li>
            <li><a href="/sybang/board/freelist.do">4</a></li>
            <li><a href="/sybang/board/freelist.do">5</a></li>
            <li><a href="#" aria-label="Next"> <span
                    aria-hidden="true">&raquo;</span>
            </a></li>
        </ul>
    </nav>
    <!-- page-bar 끝 -->

    <div class="btns btn-group">
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil"></span> 글쓰기
        </button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-trash"></span> 삭제하기
        </button> 
    </div>

</div>
<!-- list-container 끝 -->
    
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>