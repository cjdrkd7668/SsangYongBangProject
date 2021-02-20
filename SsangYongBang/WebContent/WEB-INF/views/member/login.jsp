<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/memberlogin.css">
<style>
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	    <!-- list-container 시작 -->
    <div class="list-container">
        <div class="page-header">
            <h1>로그인</h1>
            <!-- <div class="well well-sm" style="float:left;">총 <b>5</b>개의 자유게시판 글이 등록되어 있습니다.</div> -->
        </div>

        <div class="jumbotron">
            <div>
                <input type="text" class="form-control" placeholder="아이디">
                <input type="password" class="form-control" placeholder="비밀번호">
                <button type="button" class="btn btn-info" style="background-color: #486BB8; font-size: 1.3em; width:150px; height:100px;">로그인</button>
                
            </div>
            <div>
                <label class="checkbox-inline"><input type="checkbox">아이디 저장</label>

                <div class="btns">
                
                    <button type="button" class="btn btn-default">
                        회원 가입
                    </button>
                    <button type="button" class="btn btn-default">
                        아이디 찾기
                    </button>
                    <button type="button" class="btn btn-default">
                        비밀번호 찾기
                    </button>
                </div>
            </div>
            
            
            
                
            
            
        </div>

    

	</div>
	<!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>