<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 글 보기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/globaldetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
     
	<!-- detailContainer 시작 -->
    <div class="detailContainer">
        
            <button type="button" id="listBtn" class="btn btn-default" onclick="location.href='/sybang/notice/list.do?page=${page }';">
                <i class="fas fa-list-alt"></i> 목록보기
            </button>
        
        <!-- detailTable 시작 -->
        <table class="detailTable table table-default">
            <tr class="well well-sm">
                <td colspan="3">공지사항</td>
            </tr>
            
            <tr>
                <td class="" colspan="2">
                    ${dto.subject }
                </td>
            </tr>
            
            <tr>
                <td class="col-md-3">${dto.adminname } <b>관리자</b></td>
                <td class="col-md-3">${dto.regdate }</td>
                <td class="col-md-6">조회&nbsp;&nbsp;<small class="blue">${dto.readcount }</small></td>
            </tr>
            <tr>
                <td colspan="3">
                	<img src="/sybang/images/${dto.imageurl }" style="display: block; margin: 20px auto; width: 50%;">
                
                	${dto.detail }
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <!-- 버튼 시작 -->
                    
                    <div class="btns btn-group">
	                    <!-- 관리자 본인이 쓴 글일 경우 -->
	                    <c:if test="${dto.adminseq == adminSeq && access == 3}">
	                        <button type="button" class="btn btn-default" onclick="location.href='/sybang/notice/edit.do?seq=${dto.seq}';">
	                            <i class="fas fa-edit"></i> 수정하기
	                        </button>
	                    
	                        <button type="button" class="btn btn-default redbg" onclick="location.href='/sybang/notice/delete.do?seq=${dto.seq}';">
	                            <i class="fas fa-trash-alt"></i> 삭제하기
	                        </button>
	                    
                        </c:if>
                        
                    </div>
                    <!-- 버튼 끝 -->
                </td>
            </tr>
        </table>
        <!-- detailTable 끝 -->


        
    </div>
    <!-- detailContainer 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
    <script>

    </script>
	
</body>
</html>