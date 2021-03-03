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
   width: 800px;
   border: 1px solid #ddd;
   min-height: 550px;
   padding: 0px 0px 30px 0px;
   text-align: center;
   margin-left: 110px;
   margin-bottom: 130px;
   
   
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
   padding-top: 25px;

}




.servicestore {
   text-align: left;
   margin-bottom: 10px;
}

.memberName {
	text-align: right;
	margin-bottom: 10px;
}

.msg {
   border: 1px solid #ddd;
   border-radius: 10px;
   margin-bottom: 5px;
   padding: 5px;
   font-size: 0.9em;

}

.member {
   border: 1px solie #ddd;
   border-radius: 10px;
   margin-botto: 5px;
   background-color: #0084FF;
   color: white;
   padding: 5px;
   font-size: 0.9em;
}


.enterbox {
   
   margin-bottom: 5px;
}


.serviceway {
	text-align: left;
	margin-bottom: 25px;
	margin-left: 10px;
	width: 750px;
	margin-right: 80px;

	
}

.memberway {
	text-align: right;
	margin-bottom: 25px;
	margin-right: 10px;
	width: 700px;
	margin-left: 80px;
	
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
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 1:1 문의</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->
   
            <!-- 채팅창 -->
            
         <div id="chating">
         
                  <div class="text-center" id="chatingheader">1 : 1 온라인 상담</div>
                  
                  <!-- 채팅말풍선이 보이는 사각형 -->
                  <div id="chatinglog">
                  
                  	 <c:forEach items="${chatLogList}" var="dto">
                  	 
                     <c:if test="${dto.whoFlag == '1' }"> <!-- whoflag가 1이면 업체 말임 -->
                     <div class="serviceway">
                       <div class="servicestore">${dto.firmName}</div>  
                        <span class="msg">

                        	${dto.chatContent}
                        	
                        </span>
                     </div>
                     <div style="clear: both"></div>
                     </c:if>
                     
                     <c:if test="${dto.whoFlag == '0' }"> <!-- whoFlag가 0이면 회원 말임 -->
                     <div class="memberway">
                     	<div class="memberName">${dto.memberName} 님</div>  
                        <span class="member">
                        	
                        	${dto.chatContent }
                        	
                        </span>
                     </div>
                     <div style="clear: both"></div>
                     </c:if>
                     
                     </c:forEach>
                    
                     
                  </div>
                  <!-- 채팅 말풍선 보이는 사각형 끝 -->
                  
                  <!-- 메시지 전송 박스 -->
                  <div class="enterbox">
                  	<!-- 별도의 send.do 없이 sendok로 넘어가게 된다. -->
                     <form action="/sybang/servicechat/sendok.do" method="POST">
                     <div class="inputplace">
                     <input type="text" name="chatContent" id="chatContent" class="form-control" placeholder="내용을 입력하세요">
                     </div>
                     <div class="btnplace">
                     <button type="submit" class="btn btn-success">입력</button>
                     </div>
                     <input type="hidden" name="estimate1thSeq" value="${estimate1thSeq}"> 
                     <!-- 견적서번호 가져가기. 이 시점에서 dto에 담은 것은  null임. request로 estimate1thSeq를 가져왔으므로 dto에 담은 것과 헷갈리지 않기-->
                     <input type="hidden" name="whoFlag" value="1"> <!-- 업체 시점 send이므로 1 가져가기 -->
                     </form>
                     
                  </div>
                  <!-- 메시지 전송박스 끝 -->
                  
            
         </div>         
         <!-- 채팅창 끝 -->
         

      
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>