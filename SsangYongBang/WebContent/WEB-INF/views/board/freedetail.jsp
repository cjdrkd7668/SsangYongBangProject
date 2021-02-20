<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freedetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- board-container 시작 -->
    <div class="board-container">
        <div class="btns btn-group btn1">
            <button type="button" class="btn btn-default">
                <i class="fas fa-caret-square-left"></i> 이전 글
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/board/freelist.do'">
                <i class="fas fa-list"></i> 목록보기
            </button>
            <button type="button" class="btn btn-default">
                다음 글 <i class="fas fa-caret-square-right"></i>
            </button>
        </div>

        <!-- 자유게시판 글 시작 -->
        <table class="table table-default tbl-content ">
            <tr>
                <td colspan="3" style="height: 30px;color: gray; padding-left: 20px;">자유게시판</td>
            </tr>
            <tr>
                <td colspan="3" id="content-title" style="height: 40px; font-weight: bold; font-size: 1.1em;">자유게시판 글
                    제목입니다.</td>
            </tr>
            <tr id="content-profile">
                <td id="content-name">홍길동</td>
                <td id="content-date">21.02.20 15:50</td>
                <td id="content-readcount">조회&nbsp;&nbsp;<small class="blue">0</small></td>
            </tr>
            <tr>
                <td colspan="3" id="content-content">자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글
                    내용입니다.자유게시판 글
                    내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.자유게시판 글 내용입니다.</td>
            </tr>
        </table>
        <!-- 자유게시판 글 끝 -->



        <div class="btns btn-group btn2" style="float: right;">
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-minus"></span> 수정하기
            </button>
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-trash"></span> 삭제하기
            </button>
            <button type="button" class="btn btn-default">
                <i class="fas fa-comment-alt"></i> 댓글달기
            </button>
        </div>

        <!-- 자유게시판 댓글 시작 -->
        <table class="table table-default tbl-comment">
            <tr>
                <td class="well well-sm">
                    <div id="cmt-name">홍길동</div>
                    <div id="cmt-date">21.02.20 15:59&nbsp;&nbsp;<span class="badge"
                            style="background-color: red;">N</span></div>
                    <div id="cmt-comment">댓글입니다. 댓글입니다. 댓글입니다. 댓글입니다.댓글입니다.댓글입니다.댓글입니다. 댓글입니다.댓글입니다.댓글입니다.댓글입니다.</div>
                    <div class="btn-cmt">
                        <div class="edit">[&nbsp;<i class="fas fa-edit"></i>]</div>
                        <span class="delete">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;]</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="well well-sm">
                    <div id="cmt-name">홍길동</div>
                    <div id="cmt-date">21.02.20 15:59</div>
                    <div id="cmt-comment">댓글입니다. 댓글입니다. 댓글입니다. 댓글입니다.댓글입니다.댓글입니다.댓글입니다. 댓글입니다.댓글입니다.댓글입니다.댓글입니다.</div>
                    <div class="btn-cmt">
                        <div class="edit">[&nbsp;<i class="fas fa-edit"></i>]</div>
                        <div class="delete">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;]</div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- 자유게시판 댓글 끝 -->

    </div>
    <!-- board-container 끝 -->
	
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>