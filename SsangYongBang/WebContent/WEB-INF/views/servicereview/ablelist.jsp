<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>list</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>


.upperBar {
	margin-left: 130px;
	width: 750px;
	display: inline-block;
}

.leftSide {
	margin-top: 40px;
	width: 170px;
	float: left;
	
}



.leftchatlist {
	display: inline-block;
	height: 410px;
	width: 500px;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-bottom: 3px solid #ddd;
	padding: 0px;
	border-radius: 10px;
	position: relative;
	top: 10px;
	left: 235px;
	overflow: scroll;
	margin-bottom: 100px;
	-ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */	

}

.leftchatlist::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}


ul {
	list-style: none;
}

.servicelist {
	
	border-radius: 5px;
	margin: 3px;
	padding: 10px;
	font-size:1.3em;
	text-align: center;
	
}

.chatlistHeader {
   background-color: #0084FF;
	border-radius: 0px;
	text-align: center;
	font-size: 1.5em;
	margin-bottom: 10px;
	color: white;
	padding: 4px;
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
	
	
	<div class="leftSide">
	<%@include file="/WEB-INF/views/inc/service_left.jsp"%>	
	</div>
	
		<!--좌측화면 끝 ##########  -->
    

   <!-- 본문 상단 -->
   
   	<div class="upperBar">
   
		<div class="row">
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 후기 쓰기</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->



			<!-- 본문 중간 -->
   
         
         <!-- 채팅방 목록 -->

		<!-- 일정등록 명단 표 -->
	<div class="leftchatlist">
	<div class="chatlistHeader">내가 이용한 서비스업체 목록</div>
	<ul class="chatgroup">
		<c:forEach items="${list}" var="dto">

		<li class="servicelist"> 
					<!-- 업체승인번호는 세션 안에 담아두었으니 견적서번호만 가지고 가도 조회 가능 -->
			<a href="/sybang/servicereview/writereview.do?completionSeq=${dto.completionSeq}">
			${dto.firmName}&nbsp;&nbsp;<span class="badge">등록가능</span>
			</a>
		</li>
		
		</c:forEach>
		<!-- 여기에 추가로 링크 걸어야 함 -->
	</ul>
	</div>   
   
   
      	<!-- 일정등록 가능 명단 끝 -->
   


   
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>