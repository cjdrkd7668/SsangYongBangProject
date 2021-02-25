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
        
            <button type="button" id="listBtn" class="btn btn-default" onclick="location.href='/sybang/inquiry/list.do?search=${search}&page=${page }';">
                <i class="fas fa-list-alt"></i> 목록보기
            </button>
        
        <!-- detailTable 시작 -->
        <table class="detailTable table table-default">
            <tr class="well well-sm">
                <td colspan="3">문의게시판</td>
            </tr>
            
            <tr>
                <td class="col-md-10" colspan="2">
                    ${dto.subject }
                </td>
                <td class="col-md-2 blue" style="text-align: right;">
                    <c:if test="${dto.openflag == 1}">
                    공개
                    </c:if>
                    <c:if test="${dto.openflag == 0}">
                    비공개
                    </c:if>
                </td>
            </tr>
            
            <tr>
                <td class="col-md-3">${dto.authorname }</td>
                <td class="col-md-3">${dto.regdate }</td>
                <td class="col-md-6">조회&nbsp;&nbsp;<small class="blue">${dto.readcount }</small></td>
            </tr>
            <tr>
                <td colspan="3">${dto.detail }</td>
            </tr>
            <tr>
                <td colspan="3">
                    <!-- 버튼 시작 -->
                    
                    <div class="btns btn-group">
	                    <!-- 본인이 쓴 글일 경우 -->
	                    <c:if test="${(not empty approBrokerSeq && dto.authorseq == approBrokerSeq && dto.zerobonem == access) || (not empty seq && dto.authorseq == seq && dto.zerobonem == access)}">
	                        <button type="button" class="btn btn-default" onclick="location.href='/sybang/inquiry/edit.do?seq=${dto.seq}';">
	                            <i class="fas fa-edit"></i> 수정하기
	                        </button>
	                    </c:if>
	                    <!-- 본인이 썼거나 관리자일 경우 -->
	                    <c:if test="${(not empty approBrokerSeq && dto.authorseq == approBrokerSeq && dto.zerobonem == access) || (not empty seq && dto.authorseq == seq && dto.zerobonem == access) || (access == 3)}">
	                        <button type="button" class="btn btn-default redbg" onclick="location.href='/sybang/inquiry/delete.do?seq=${dto.seq}';">
	                            <i class="fas fa-trash-alt"></i> 삭제하기
	                        </button>
	                    
                        </c:if>
                        <!-- 관리자일 경우 -->
                        <c:if test="${access == 3}">
	                        <button type="button" class="btn btn-default" id="commentBtn">
	                            <i class="fas fa-comment-alt"></i> 댓글달기
	                        </button>
                        </c:if>
                    </div>
                    <!-- 버튼 끝 -->
                </td>
            </tr>
        </table>
        <!-- detailTable 끝 -->

        <!-- 댓글 form 시작 -->
        <form method="POST" action="/sybang/inquiry/commentok.do">
            <div class="well well-sm" id="commentForm">
                <input type="text" class="form-control" placeholder="댓글을 작성하고 엔터를 눌러주세요." name="detail" id="detail">
            </div>
            <!-- 문의게시글 번호 -->
        	<input type="hidden" name="iqrseq" value="${dto.seq }">
        </form>
        <!-- 댓글 form 끝 -->
        
        

        <!-- commentTable 시작 -->
        <table class="commentTable table table-default">
        	<c:forEach items="${clist }" var="cdto">
            <tr class="well well-sm">
            	<!-- 댓글 번호 -->
				<input type="hidden" name="seq" value="${cdto.seq }">
				
                <td class="col-md-3">${cdto.admname }</td>
                
                <td class="col-md-3">${cdto.regdate }&nbsp;
                	<!-- 최신 댓글일 경우 -->
                	<c:if test="${cdto.gap < 1 }">
                	<span class="badge" style="background-color: red;">N</span>
                	</c:if>
                </td>
                
                <td class="col-md-6 controlBtn">
                	<!-- 자기가 쓴 댓글이면 버튼이 보인다. -->
                	<c:if test="${cdto.admseq == adminSeq}">	
                    <div class="editBtn" onclick="location.href='/sybang/list/editok.do?seq=${cdto.seq}&detail=${cdto.detail }';">[&nbsp;<i class="fas fa-edit"></i>수정]</div>
                    <div class="regBtn">[&nbsp;<i class="fas fa-check-circle"></i> 등록]</div>
                    <div class="delBtn" onclick="location.href='/sybang/inquiry/deletecommentok.do?seq=${cdto.seq}&iqrseq=${cdto.iqrseq }';">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;삭제]</div>
                    <div class="cancelBtn">[&nbsp;<i class="fas fa-ban"></i>&nbsp;취소]</div>
                
                	<input type="hidden" id="cseq" name="cseq" value="${cdto.seq }">
                    <input type="hidden" id="ccomment" name="ccomment" value="${cdto.detail }">
                	</c:if>
                </td>
            </tr>
            <tr class="well well-sm">
                <td colspan="3">
                    <textarea rows="2" class="commentDetail form-control" readonly>${cdto.detail }</textarea>
                </td>
            </tr>
            </c:forEach>
        </table>
        <!-- commentTable 끝 -->
        
    </div>
    <!-- detailContainer 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
    <script>
        var oldDetail;
        var index;

        window.onload = function() {
           $("#commentForm").addClass("hideBtn");
           $(".regBtn").addClass("hideBtn");
           $(".cancelBtn").addClass("hideBtn");
        };

        $("#commentBtn").click(function() {
            $("#commentForm").toggle("hideBtn");
            $("#detail").focus();
        });

        // 댓글 수정 버튼 클릭 시
        $(".editBtn").click(function() {
            index = $(".editBtn").index(this);
            $(".editBtn").eq(index).toggleClass("hideBtn");
            $(".delBtn").eq(index).toggleClass("hideBtn");
            $(".regBtn").eq(index).removeClass("hideBtn");
            $(".cancelBtn").eq(index).removeClass("hideBtn");
            oldDetail = $(".commentDetail").eq(index).val();
            $(".commentDetail").eq(index).removeAttr("readonly");
            $(".commentDetail").eq(index).focus();

        });

        // 댓글 수정 취소 버튼 클릭 시
        $(".cancelBtn").click(function() {
            index = $(".cancelBtn").index(this);
            $(".editBtn").eq(index).toggleClass("hideBtn");
            $(".delBtn").eq(index).toggleClass("hideBtn");
            $(".regBtn").eq(index).addClass("hideBtn");
            $(".cancelBtn").eq(index).addClass("hideBtn");
            $(".commentDetail").eq(index).val(oldDetail);
            $(".commentDetail").eq(index).attr("readonly", true);
        });

        // 댓글 수정 등록 버튼 클릭 시
        $(".regBtn").click(function() {
            $(".editBtn").eq(index).toggleClass("hideBtn");
            $(".delBtn").eq(index).toggleClass("hideBtn");
            $(".regBtn").eq(index).addClass("hideBtn");
            $(".cancelBtn").eq(index).addClass("hideBtn");
            $(".commentDetail").eq(index).val();
            $(".commentDetail").eq(index).attr("readonly", true);
        });

    </script>
	
</body>
</html>