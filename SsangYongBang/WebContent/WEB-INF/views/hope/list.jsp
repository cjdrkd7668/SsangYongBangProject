<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 입주 정보</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopelist.css">

<style type="text/css">
	.list-container{height:auto;}
	.pagebar{text-align:center;}
</style>

</head>
<body>

<!-- header 가져오기######## -->
<%@include file="/WEB-INF/views/inc/header.jsp"%>

<!-- list-container 시작 -->
<div class="list-container" style="margin-top: -50px;">
	<div class="page-header">
		<h1>희망 입주 정보</h1>
		<div class="well well-sm" style="float:left;">총 <b>${cnt}</b>개의 희망 입주글이 등록되어 있습니다.</div>
	</div>
	
	<form name="Frm">
	<input type="hidden" name="seqs">
	
	<table class="table table-hover">   
		<tr>
			<th><input type="checkbox" name="cbListAll"></th>
			<th>번호</th>
			<th style="width:50px">거래 유형</th>
			<th>가격</th>
			<th style="width:100px">지역</th>
			<th>면적</th>
			<th>방 개수</th>
		</tr>
		${board_list}
	</table>

	<nav class="pagebar">
		<ul class="pagination">
			${pagebar}
		</ul>
	</nav>

	<div class="btns btn-group">
		<button type="button" class="btn btn-default" onclick="create()">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</button>
		<button type="button" class="btn btn-default" onclick="del()">
			<span class="glyphicon glyphicon-trash"></span> 삭제하기
		</button>
	</div>
	
	</form>

	<script type="text/javascript">
	
		function create(){
			var f = document.Frm
			f.method="post";
			f.action="/sybang/hope/post.do";
			f.submit();
		}
	
		function del(){
			var f = document.Frm;
			f.method="post";
			f.action="/sybang/hope/post_del_ok.do";
			if (f.seqs.value == "") {
				alert("삭제할 항목을 선택하세요")
				return false;
			}
			var c = confirm("삭제하시겠습니까?")
			if (c) {
				f.submit();
			}
		}
	
		let cbs = [];
		
		$("input[name='cbListAll']").click(function(){
			let c;
			let l;
			if ($(this).is(":checked")) {
				c = true;
			}else{
				c = false;
			}
			$(this).parents("table").find("input[name=cbList]").prop("checked",c);
			$("input[name='cbList']").each(function(idx){
				if (c) {
					cbs[idx] = $(this).parent().next().text();
				}else{
					cbs[idx] = null;
				}
			});
			$("input[name='seqs']").val(cbs);
		});
		
		let cbi = 0;
		$("input[name='cbList']").click(function(){
			event.stopPropagation();
			let c = $(this).parent().next().text();
			if($(this).is(":checked")){
				cbs[cbi] = c;
				cbi++;
			}else{
				cbs[cbs.indexOf(c)] = null;
			}
			$("input[name='seqs']").val(cbs);
		});
		
		$("tr>td:first-of-type()").click(function(){
			event.stopPropagation();
		});

	</script>
</div>
<!-- list-container 끝 -->
	
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>