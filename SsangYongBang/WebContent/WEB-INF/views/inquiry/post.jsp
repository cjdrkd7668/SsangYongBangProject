<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 글 등록</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/globaldetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.detailContainer .divider {
	width: 220px;
	height: 5px;
	background-color: #486BB8;
	margin-top: -10px;
}

.detailContainer .page-header small {
	position: relative;
	top: 5px;
}

.detailContainer .detailTable #subject {
	font-size: 1em;
}

.detailContainer .detailTable #detail {
	font-size: 1em;
	resize: none;
	height: 150px;
}

.bluebg {
	background-color: #486BB8;
	color: #EEE;
}

.detailContainer .detailTable .openflags {
	float: right;
	margin-right: 10px;
}

.detailContainer .detailTable .openflags #openflag1, .detailContainer .detailTable .openflags #openflag2
	{
	margin-left: 10px;
}
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
     
    <!-- detailContainer 시작 -->
    <div class="detailContainer">
        
        <div class="page-header">
            <h1><strong>문의게시판 <i class="far fa-question-circle blue"></i>&nbsp;&nbsp;&nbsp;</strong><small>작성 후 등록하기 버튼을 눌러주세요.</small>
            </h1>
            <div class="divider"></div>
        </div>
        
        <!-- form 태그 시작 -->
        <form method="POST" action="/sybang/inquiry/postok.do">
        <!-- detailTable 시작 -->
        <table class="detailTable table table-default">
            <tr class="well well-sm">
                <td colspan="3">문의게시판</td>
            </tr>
            <tr>
                <td class="col-md-10" colspan="2">
                    <input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 입력해주세요.">
                </td>
                <td class="col-md-2">
                    <div class="openflags">
                        <input type="radio" id="openflag1" class="openflag" name="openflag" value="1">
                        <label for="openflag1">공개</label>
                        
                        <input type="radio" id="openflag2" class="openflag" name="openflag" value="0" checked>
                        <label for="openflag2">비공개</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <textarea name="detail" id="detail" class="form-control" placeholder="내용을 입력해주세요." required></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                
                    <!-- 버튼 시작 -->
                    <div class="btns btn-group">
                        <button type="submit" class="btn btn-default bluebg">
                            <span class="glyphicon glyphicon-ok"></span> 등록하기
                        </button>
                        <button type="button" class="btn btn-default" onclick="location.href='/sybang/inquiry/list.do'">
                            <span class="glyphicon glyphicon-remove"></span> 취소하기
                        </button>
                    </div>
                    <!-- 버튼 끝 -->
                </td>
            </tr>
        </table>
        <!-- detailTable 끝 -->
        </form>
        
    </div>
    <!-- detailContainer 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
    <script>

        window.onload = function() {
           $("#subject").focus();
        };

    </script>
	
</body>
</html>