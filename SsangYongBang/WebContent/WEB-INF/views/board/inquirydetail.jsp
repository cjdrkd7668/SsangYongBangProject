<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ######### JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 글 보기</title>
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

/* 댓글 작성자 */
.cmt-name {
	float: left;
	padding-left: 10px;
	width: 180px;
	font-weight: bold;
}

/* 댓글 내용 */
.cmtcomment {
	float: left;
	height: 50px;
	font-size: 1.1em;
	resize: none;
	border: 0px;
}

/* 댓글 작성일 */
.cmt-date {
	float: left;
	width: 170px;
	height: 30px;
	margin-top: -1px;
}

/* 댓글 최신글 badge */
.tbl-comment .badge {
	display: inline-block;
}

/* 댓글 버튼 */
.btn-cmt {
	float: left;
	width: 300px;
	
}

/* 댓글 수정 버튼 */
.btn-cmt .edit {
	border: 0px;
	font-size: 1em;
	float: left;
	width: 80px;
	margin-left: 10px;
}

/* 댓글 삭제 버튼 */
.btn-cmt .delete {
	border: 0px;
	font-size: 1em;
	float: left;
	width: 80px;
	margin-left: 0px;
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

/* 댓글 form */
#cmtform {
	width: 860px;
	height: 80px;
	margin: -30px auto;
}

/* 댓글 작성 text */
#detail {
	width: 100%;
	padding: 10px;
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
				onclick="location.href='/sybang/board/inquirylist.do?search=${search}&page=${page }';">
				<i class="fas fa-list-alt"></i> 목록보기
			</button>
			<%-- <button type="button" class="btn btn-default" onclick="location.href='/sybang/board/freedetail.do?seq=${dto.seq + 1}';">
				다음 글 <i class="fas fa-caret-square-right"></i>
			</button> --%>
		</div>

		<!-- 문의게시판 글 시작 -->
		<table class="table table-default tbl-content ">
			<tr>
				<td colspan="3"
					style="height: 30px; color: gray; padding-left: 20px;">문의게시판</td>
			</tr>
			<tr>
				<td colspan="3" id="content-title"
					style="height: 40px; font-weight: bold; font-size: 1.1em;">${dto.subject }</td>
			</tr>
			<tr id="content-profile">
				<td id="content-name">${dto.authorname }</td>
				<td id="content-date">${dto.regdate }</td>
				<td id="content-readcount">조회&nbsp;&nbsp;<small class="blue">${dto.readcount }</small></td>
			</tr>
			<tr>
				<td colspan="3" id="content-content">${dto.detail }</td>
			</tr>
		</table>
		<!-- 문의게시판 글 끝 -->


		<hr style="width: 850px;">
		
		<div class="btns btn-group btn2" style="float: right;">

			<!-- 본인이 쓴 글일 경우 -->
			
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/board/inquiryedit.do?seq=${dto.seq}';">
					<i class="fas fa-edit"></i> 수정하기
				</button>
				<button type="button" class="btn btn-default"
					onclick="location.href='/sybang/board/inquirydelete.do?seq=${dto.seq}';">
					<i class="fas fa-trash-alt"></i> 삭제하기
				</button>
			
			
			<!-- 관리자일 경우 -->
			<c:if test="${access == 3 }">
			<button type="button" class="btn btn-default" id="cmtbtn">
				<i class="fas fa-comment"></i> 댓글달기
			</button>
			</c:if>
		</div>

		<!-- 문의게시판 댓글 시작 -->
		<table class="table table-default tbl-comment">
			
			<c:forEach items="${clist }" var="cdto">
				<tr>
					
					<td class="well well-sm">
					
					<!-- 댓글 번호 -->
					<input type="hidden" name="seq" value="${cdto.seq }">
					
						
						<div class="cmt-name">${cdto.admname }</div>
						<div class="cmt-date">${cdto.regdate }&nbsp;
						
							<!-- 최신 댓글일 경우 -->
							<c:if test="${cdto.gap < 1 }">
							<span class="badge"
								style="background-color: red;">N</span>
							</c:if>
							
							
													
						</div> <!-- 자기가 쓴 댓글이면 버튼이 보인다. --> 
						<c:if test="${cdto.admseq == seq}">
							<div class="btn-cmt">

								<button class="edit" style="cursor: pointer;" >
									[&nbsp;<i class="fas fa-edit"></i>수정]
								</button>
								<button class="delete" style="cursor: pointer;" onclick="location.href='/sybang/board/inquirydeletecommentok.do?seq=${cdto.seq}&iqrseq=${cdto.iqrseq }';">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;삭제]
								</button>
								
								
								<button type="submit" class="reg hidebtn" style="cursor: pointer;">[&nbsp;<i class="fas fa-check-circle"></i>등록]</button>
								
								<button class="noreg hidebtn" style="cursor: pointer;">[&nbsp;<i class="fas fa-ban"></i>&nbsp;취소]
								</button>
								
							</div>
						</c:if>
						
						<textarea class="cmtcomment"
							style="width: 850px; padding-left: 10px;">${cdto.detail }</textarea>
							
						
					</td>
					
				</tr>
			</c:forEach>

		</table>
		<!-- 문의게시판 댓글 끝 -->

		<!-- 댓글 form 시작 -->
		<form method="POST" action="/sybang/board/inquirycommentok.do">
			<div class="well" id="cmtform">

				<input type="text" class="form-control"
					placeholder="댓글을 작성하고 엔터를 눌러주세요." name="detail" id="detail" >

			</div>
			<!-- 문의게시글 번호 -->
			<input type="hidden" name="iqrseq" value="${dto.seq }">
			
		</form>
		<!-- 댓글 form 끝 -->

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
            
            
            var seq = ${cdto.seq};
            var detail = ${cdto.detail};
            
            
            
            
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
        });

		
		
	</script>
</body>
</html>