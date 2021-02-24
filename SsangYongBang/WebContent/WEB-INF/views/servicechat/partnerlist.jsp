<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>servicechat</title>


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



#chating {
   display: inline-block;
   width: 700px;
   border: 1px solid #ddd;
   min-height: 500px;
   padding: 0px 0px 30px 0px;
   text-align: center;
   margin-left: 45px;
   margin-top: 40px;
   margin-right: 40px;
   
   
}

#chatingheader {
   
   font-weight: bold;
   font-size: 1.5em;
   color: white;
   background-color: #0084FF;
   height: 40px;   
   margin-bottom: 30px;
   padding: 5px;
}

#chatinglog {

   height: 400px;
   overflow: scroll;
   margin-bottom: 10px;
}

.servicestore {
   text-align: left;
   margin-bottom: 5px;
}

.msg {
   border: 1px solid #ddd;
   border-radius: 10px;
   margin-bottom: 5px;
   padding: 5px;
   font-size: 1.2em;
}

.member {
   border: 1px solie #ddd;
   border-radius: 10px;
   margin-botto: 5px;
   background-color: #0084FF;
   color: white;
   padding: 5px;
   font-size: 1.2em;
}


.enterbox {
   
   margin-bottom: 5px;
}


.serviceway {
	text-align: left;
	margin-bottom: 18px;
	margin-left: 10px;
}

.memberway {
	text-align: right;
	margin-bottom: 18px;
	margin-right: 10px;
}

.inputplace {
	margin-left: 30px;
	margin-right: 20px;
	width: 500px;
	display: inline-block;
	text-align: left;

}

.btnplace {
	display: inline-block;
	text-align: right;
}

.leftchatlist {
	display: inline-block;
	height: 510px;
	width: 200px;
	border: 3px solid  #ddd;
	border-radius: 10px;
	position: relative;
	top: 10px;
	left: -5px;
	overflow: scroll;

}

ul {
	list-style: none;
}

.servicelist {

	border-radius: 5px;
	margin: 3px;
	padding: 10px;
	font-size:1.3em;
	
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





			<!-- 본문 중간 -->
   
            <!-- 채팅창 -->>
            
         <div id="chating">
         
                  <div class="text-center" id="chatingheader">1 : 1 온라인 상담</div>
                  
                  <!-- 채팅말풍선이 보이는 사각형 -->
                  <div id="chatinglog">
                  
                  <!-- 아직 대화상대를 선택하지 않은 상태. 대화 상대를 선택하면 servicechat으로 가도록 한다. -->
 
                     
                  </div>
                  <!-- 채팅 말풍선 보이는 사각형 끝 -->
                  
                  <!-- 메시지 전송 박스 -->
                  <div class="enterbox">
                     <form action="" method="POST">
                     <div class="inputplace">
                     <input type="text" class="form-control" placeholder="내용을 입력하세요">
                     </div>
                     <div class="btnplace">
                     <button type="submit" class="btn btn-success">입력</button>
                     </div>
                     </form>
                  </div>
                  <!-- 메시지 전송박스 끝 -->
                  
            
         </div>         
         <!-- 채팅창 끝 -->
         
         <!-- 채팅방 목록 -->

		<!-- 업체로그인 시, 보일 채팅창목록임 -->
	<div class="leftchatlist">
	<ul class="chatgroup">
		<c:forEach items="${list}" var="dto">
		<li class="servicelist"> ${dto.memberName}&nbsp;&nbsp;<span class="badge">2</span></li>
		</c:forEach>
		<!-- 여기에 추가로 링크 걸어야 함 -->
	</ul>
	</div>   
   
   
      	<!-- 채팅방목록끝 -->
   


   
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>