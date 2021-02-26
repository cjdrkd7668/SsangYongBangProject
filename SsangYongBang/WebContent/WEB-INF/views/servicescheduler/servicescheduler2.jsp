<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>serviceschedule</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link href='/sybang/fullcalendar/main.css' rel='stylesheet' />
<script src='/sybang/fullcalendar/main.js'></script>


<style>

.upperBar {
	margin-left: 130px;
	width: 750px;
	display: inline-block;
}

.leftSide {
	margin-top: 30px;
	width: 150px;
	float: left;
	
}


.wrapper {
	margin-left: 200px;
	margin-bottom: 15px;
	width: 900px;
	height: 1000px;
	padding: 17px;

}


.btns {
	margin-left: 450px;
	margin-bottom: 40px;
	
}

td{
    width: 80px;
    height: 60px;
    text-align: center;
    font-size: 20px;
    font-family: 굴림;
    border:2px solid #ddd;
    border-radius: 8px;/*모서리 둥글게*/
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
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 일정 관리</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<form>
		<div class="btns">
			<button type="button" class="btn btn-default serviceinfobtn">견적상담 일정 등록</button>
			<button type="button" class="btn btn-default serviceinfobtn"><a href="/sybang/servicescheduler/editschedule.do">서비스 일정 등록</a></button>
			<button type="button" class="btn btn-default serviceinfobtn"><a href="/sybang/servicescheduler/editschedule.do">서비스 완료 등록</a></button>
		</div>   
   		</form>


		<div class="wrapper">
			
			<div id='calendar'></div>
			
		</div>


	<!-- 본문 하단 -->

   
   <!-- 본문하단 끝 -->>
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

	<!-- 풀캘린더 관련 자바스크립트 -->   
	<script>
	
	  document.addEventListener('DOMContentLoaded', function() {
		  
	    var calendarEl = document.getElementById('calendar');
	    
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      
	    	//event 소스-> 풀캘린더의 옵션 활용에 대한 내용인 것 같음
	    	initialView: 'dayGridMonth'
	    	
	    	
	    	<!-- 여기서부터 Ajax로 풀캘린더에 같이 합칠 정보를(이벤트데이터) 가져와야 한다.  -->
	    	
	    	events:function(fetchInfo, successCallback, failureCallback) {
	    		alert();
	    		<!--  이 이벤트는 달력의 이전 달 혹은 다음달 버튼을 누를 때마다 ajax로 받아오는 것임. -->
	    		$.ajax({
	    			type: 'POST',
	    			url: '/sybang/servicescheduler/schedulejsondata.do',
	    			dataType: 'json',
	    			success:
	    				function(result) {
	    				
	    				var events = []; <!-- events라는 풀캘린더에서 쓰이는 객체를 만든다. -->
	    				
	    				if (result != null) {
	    					
	    					<!-- 이 부분에서 each로 돌며 정보를 push한다. -->
	    					$.each(result, function(index, element) {
	    						
	    						
	    						
	    					}); <!-- each 끝-->
	    					
	    					console.log(events); <!-- each로 돌려서 나오는 값을 콘솔에 찍어보기 -->
	    					
	    				} //if문 끝 
	    				successCallback(events);
	    				//풀캘린더 DOC 설명
	    				//The successCallback function must be called when the custom event function has generated its events. 
	    				//It is the event function’s responsibility 
	    				//to make sure successCallback is being called with an array of parsable Event Objects.
	    				
	    				//calendar.render();
	    				
	    			}//success: function 끝
	    			
	    		}); //ajax 끝
	    			    		
	    	}, //events:function 끝
	    
	    	
	    	
	    }); //new 풀캘린더 끝
	    
	    calendar.render(); //캘린더를 만든다.
	  
	  });
	
	</script>
 
</body>

</html>