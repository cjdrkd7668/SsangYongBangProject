<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 글 삭제</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/globallist.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.redbg {
	background-color: red;
	color: #EEE;
}

.listContainer .searchTable .deleteMessage {
	text-align: center;
	font-size: 1.5em;
	"
}

.listContainer .searchTable .backBtn, .listContainer .searchTable .deleteBtn
	{
	text-align: center;
	font-size: 1.3em;
	padding: 10px;
	margin-left: 10px;
	border: 0px;
}
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	    <!-- listContainer 시작 -->
    <div class="listContainer">

        <div class="page-header">
            <h1><strong>문의게시판 <i class="far fa-question-circle blue"></i>&nbsp;&nbsp;&nbsp;</strong><small></small>
            </h1>
            <div class="divider"></div>
        </div>

        <!-- searchTable 시작 -->
        <!-- 검색 결과 알려줄 창 -->
        <table class="searchTable table table-default">
            <tr>
                <th class="col-md-6">
                    <div class="well well-lg deleteMessage">
                        정말로 <b class="blue">삭제</b>하시겠습니까? <i class="far fa-sad-tear blue"></i>
                    </div>
                    <div class="well well-lg" style="text-align: center;">

                        <button type="button" class="btn btn-default backBtn"
                            onclick="location.href='/sybang/inquiry/detail.do?seq=${seq}';">
                            <i class="fas fa-arrow-left"></i> 돌아가기
                        </button>
                        <button type="button" class="btn btn-default deleteBtn redbg"
                            onclick="location.href='/sybang/inquiry/deleteok.do?seq=${seq}';">
                            <i class="fas fa-trash-alt"></i> 삭제하기
                        </button>
                    </div>
                </th>
            </tr>
        </table>
        <!-- searchTable 끝 -->


    </div>
    <!-- listContainer 끝 -->
    
    <!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

    <script>

    </script>
	
</body>
</html>