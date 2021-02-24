<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ######### JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 보기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/freedetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>

/* 글 작성자 */
#content-name {
	padding-left: 20px;
	float: left;
	width: 220px;
}

/* 글 작성일 */
#content-date {
	float: left;
	width: 200px;
	padding-left: 20px;
}

/* 글 조회수 */
#content-readcount {
	float: left;
	width: 479px;
	padding-left: 20px;
}

.btn-cmt .reg {
	border: 0px;
	font-size: 1em;
	float: left;
	width: 80px;
	margin-left: 10px;
}

.btn-cmt .noreg {
	border: 0px;
	font-size: 1em;
	float: left;
	width: 80px;
	margin-left: 0px;
}

.hidebtn {
	display: none;
}

.showbtn {
	display: block;
}

.read {
	readonly: "false";
}
</style>
</head>
<body style="overflow-y: scroll;">

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- board-container 시작 -->
	<div class="board-container" style="height:100%;">
		<div class="btns btn-group btn1">
			<!-- <button type="button" class="btn btn-default">
				<i class="fas fa-caret-square-left"></i> 이전 글
			</button> -->
			<button type="button" class="btn btn-default"
				onclick="location.href='/sybang/notice/list.do?&page=${page }';">
				<i class="fas fa-list-alt"></i> 목록보기
			</button>
			<%-- <button type="button" class="btn btn-default" onclick="location.href='/sybang/board/freedetail.do?seq=${dto.seq + 1}';">
				다음 글 <i class="fas fa-caret-square-right"></i>
			</button> --%>
		</div>

		<!-- 공지사항 글 시작 -->
		<table class="table table-default tbl-content ">
			<tr>
				<td colspan="3"
					style="height: 30px; color: gray; padding-left: 20px;">공지사항</td>
			</tr>
			<tr>
				<td colspan="3" id="content-title"
					style="height: 40px; font-weight: bold; font-size: 1.1em;">${dto.subject }</td>
			</tr>
			<tr id="content-profile">
				<td id="content-name">${dto.adminname } <b>관리자</b></td>
				<td id="content-date">${dto.regdate }</td>
				<td id="content-readcount">조회&nbsp;&nbsp;<small class="blue">${dto.readcount }</small></td>
			</tr>
			<tr>
				<td colspan="3" id="content-content">${dto.detail }</td>
			</tr>
		</table>
		<!-- 공지사항 글 끝 -->


		<hr style="width: 850px;">
		
		<div class="btns btn-group btn2" style="float: right;">

			<!-- 본인이 쓴 글일 경우 -->
			<c:if test="${dto.adminseq == adminSeq && access == 3}">
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/notice/edit.do?seq=${dto.seq}';">
					<i class="fas fa-edit"></i> 수정하기
				</button>
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/notice/delete.do?seq=${dto.seq}';">
					<i class="fas fa-trash-alt"></i> 삭제하기
				</button>
			</c:if>
		</div>
	</div>
	<!-- board-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
		var cmtbtn = document.getElementById("cmtbtn");
		var cmtform = document.getElementById("cmtform");
		
		var edit = document.getElementsByClassName("edit");
		var del = document.getElementsByClassName("delete");
		var reg = document.getElementsByClassName("reg");
		var noreg = document.getElementsByClassName("noreg");
		var cmt = document.getElementsByClassName("cmtcomment");

		/* 댓글달기 클릭 전 보이지 않게 */
		cmtform.classList.toggle("hidebtn");
		
		$(".cmtcomment").attr("readonly", "true");

		/* 댓글달기 클릭하면 보인다 */
		cmtbtn.onclick = function() {
			cmtform.classList.toggle("showbtn");
			$('#detail').focus();
		};
		
		/* 댓글 수정 클릭 시 */
		$(".edit").click(function() {
			var index = $(".edit").index(this);
            this.classList.add("hidebtn");
            del[index].classList.add("hidebtn");
            reg[index].classList.toggle("showbtn");
            noreg[index].classList.toggle("showbtn");
            
            
            
        });

        $(".noreg").click(function() {
        	var index = $(".noreg").index(this);
            this.classList.remove("showbtn");
            reg[index].classList.remove("showbtn");
            edit[index].classList.remove("hidebtn");
            del[index].classList.remove("hidebtn");
            
        });
        
        $(".reg").click(function() {
        	var index = $(".reg").index(this);
        	
        	var cseq = $("#cseq").val();
            var ccomment = $("#ccomment").val();
            
            document.cmttempform.action="freeeditcomment.do?cseq="+cseq+"&ccomment="+ccomment;
            document.cmttempform.submit();
            
            alert("수정되었습니다.");
        });

		
		
	</script>
</body>
</html>