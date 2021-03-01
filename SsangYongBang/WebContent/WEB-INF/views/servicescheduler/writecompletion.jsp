<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>writecompletion</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>


<%--datepicker를 쓰기 위해 CDN으로 가져온 플러그인들. --%>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    <script type='text/javascript'>

    $(function(){

        $('.input-group.date').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyy/mm/dd",

            language: "kr"

        });

    });

    </script>


<style>


.upperBar {
	margin-left: 200px;
	width: 750px;
}

.wrapper {
	margin-left: 355px;
	margin-bottom: 30px;
	width: 550px;
	height: 400px;
	padding: 17px;
	border-bottom: 2px solid #999;
	border-right: 2px solid #999;
	border-radius: 10px;

}

.btns {
	margin-left: 690px;
	margin-bottom: 100px;
	
}

.serveceInfo {
	width: 400px;
	
	margin-bottom: 25px;
	padding-left: 90px;
	
	
}


.serviceinfobtn {

	margin-right: 15px;
}

</style>



</head>

<body>



   <!-- 헤더 가져오기 -->
   <%@include file="/WEB-INF/views/inc/header.jsp"%>
   <!-- 헤더 끝 -->



   <!-- ########## 본문 시작 -->
   <div class="main">
   
   <!-- ########## 좌측 시작 -->
	

		<!--좌측화면 끝 ##########  -->
    
   <!-- 본문 상단 -->
   
   	<div class="upperBar">
   
		<div class="row">
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 일정 등록하기</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="wrapper">
			
			<form method="POST" action="/sybang/servicescheduler/writecompletionok.do" enctype="multipart/form-data">
			
			<div class="charge serveceInfo">
				<label>금액</label>
				<input type="text" name="charge" class="form-control" placeholder="단위 없이 숫자만 입력하세요">
				
			</div>
			<div class="receiptURL serveceInfo">
				<label>견적서 사본</label><input type="file" name="receiptURL" id="file" class="form-control" placeholder="file">
			</div>
		</div>	
		

		<div class="btns">
			<button type="button" class="btn btn-default serviceinfobtn">취소하기</button>
			<button type="submit" class="btn btn-success serviceinfobtn">등록하기</button>
		</div>
		<input type="hidden" name="estimate1thSeq" value="${estimate1thSeq}"> 
		</form>	
		
   
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>