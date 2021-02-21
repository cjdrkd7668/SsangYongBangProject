<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freelist.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

           <!-- list-container 시작 -->
    <div class="list-container">
        <div class="page-header">
            <h2><strong>
                <span class="blue">&nbsp;&nbsp;&nbsp;&nbsp;자유</span>게시판&nbsp;</strong>
        </h2>
        <div class="divider"></div>

    </div>
    <div class="well well-sm">
        <div class="blue">'@@@'</div>로 검색 결과 총 10개의 게시글이 있습니다.
    </div>


        <div class="search">
            <input type="text" class="form-control" value="" placeholder="검색어를 입력하세요.">
            <button type="button" class="form-control"><i class="fas fa-search"></i></button>
        </div>

        <table class="table table-hover table-default">   
            <tr>
                <th class="num">번호</th>
                <th class="title" style="text-align: center;">제목</th>
                <th class="writer">글쓴이</th>
                <th class="date">작성일</th>
                <th class="readcount">조회</th>
            </tr>
            <tr onclick="location.href='/sybang/board/freedetail.do'">
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.&nbsp;<span class="badge"
                    style="background-color: red;">N</span></td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
            <tr>
                <td class="num">1</td>
                <td class="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</td>
                <td class="writer">홍길동</td>
                <td class="date">21.02.17</td>
                <td class="readcount">1</td>
            </tr>
        </table>
    

    <!-- page-bar 시작 -->
    <nav class="page-bar">
        <ul class="pagination">
            <li><a href="#" aria-label="Previous"> <span
                    aria-hidden="true">&laquo;</span>
            </a></li>
            <li class="active"><a href="/sybang/free/list.do">1</a></li>
            <li><a href="/sybang/free/list.do">2</a></li>
            <li><a href="/sybang/free/list.do">3</a></li>
            <li><a href="/sybang/free/list.do">4</a></li>
            <li><a href="/sybang/free/list.do">5</a></li>
            <li><a href="#" aria-label="Next"> <span
                    aria-hidden="true">&raquo;</span>
            </a></li>
        </ul>
    </nav>
    <!-- page-bar 끝 -->

    <div class="btns btn-group">
        <button type="button" class="btn btn-default" onclick="location.href='/sybang/board/freepost.do'">
            <i class="fas fa-pencil-alt"></i> 글쓰기
        </button>
        <!-- <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-trash"></span> 삭제하기
        </button> -->
    </div>

</div>
<!-- list-container 끝 -->
    
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>