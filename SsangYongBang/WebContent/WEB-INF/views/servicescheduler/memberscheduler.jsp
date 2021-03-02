<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>membersServiceSchedule</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link href='/sybang/fullcalendar/main.css' rel='stylesheet' />
<script src='/sybang/fullcalendar/main.js'></script>

<!-- 풀캘린더의 날짜 data 포맷팅을 위해 필요한 파일 cdn: moment 사용시 필요 -->
<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>



<style>

.upperBar {
	margin-left: 20px;
	width: 750px;
	display: inline-block;
	
}

.leftSide {
	margin-top: 30px;
	width: 150px;
	float: left;
	
}


.wrapper {
	margin-left: 150px;
	margin-bottom: 100px;
	width: 1100px;
	height: 800px;
	padding: 17px;

}


.btns {
	margin-left: 520px;
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
	
		<h3> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>${name}님의 일정 관리</h3>
		
	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->


		
		<div class="wrapper">
			
			<div id='calendar'></div>
			
		</div>


	<!-- 본문 하단 -->

   
   <!-- 본문하단 끝 -->
   

   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

	<!-- 풀캘린더 관련 자바스크립트 -->   
	<script>
	
    document.addEventListener('DOMContentLoaded', function() {
    	
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
          
        	initialView: 'dayGridMonth',
        	//timeZone: 'local', // the default (unnecessary to specify)
        	events: function(fetchInfo, successCallback, failureCallback) {
       			//alert(); //이 function이 제대로 되는지 알림창 띄워보기 -> 제대로 실행 확인
        		//얼럿 창은 최초 페이지 로딩 시, 월단위를 바뀔때마다 뜬다. -> 이 함수가 실행되는 때
       			
       			$.ajax({
        			type: 'POST',
        			url: '/sybang/servicescheduler/membersjsondata.do', //이 jsondata 서블릿은 회원 기준 조회
        			dataType: 'json',
        			success:
        				function(result) {
        				
        				var events = []; //캘린더의 이벤트 객체(이 것으로 풀캘린더는 달력 내용을 출력)
						        				
						if(result != null) {
	        				//$(result).each(function(index, item) {
							$(result).each(function(index, item) {
	        					
								//현재 null로 받아지기 때문에 현재 날짜가 출력된 상황임
								
								events.push({
									title: item.title,
									//timeZone: local,
									start: moment(item.start).format('YYYY-MM-DD'), 
									
									//end: enddate,
									//timeZone: local,
									url: item.url
								}); // push하기
	        					
	        					
	        				}); //each 문 끝
	        				console.log(events);
	        				//json데이터가 제대로 왔는지 콘솔 확인
	        			 	//만약 날짜가 전달되지 않는다면, 브라우저 콘솔창에서 현재 날짜로 출력된다 ..
						} //if문 끝
						
						successCallback(events);
        				//calendar.render();
        			} //success : function(result)끝
        		
        		}); //ajax 끝
      
        	} //event: function 끝
        	
        });
        calendar.render();
      });
	
	</script>
 
</body>

</html>