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

<!-- 풀캘린더의 날짜 data 포맷팅을 위해 필요한 파일 cdn: moment 사용시 필요 -->
<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>



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
          
        	initialView: 'dayGridMonth',
        	//timeZone: 'local', // the default (unnecessary to specify)
        	events: function(fetchInfo, successCallback, failureCallback) {
       			//alert(); //이 function이 제대로 되는지 알림창 띄워보기 -> 제대로 실행 확인
        		//얼럿 창은 최초 페이지 로딩 시, 월단위를 바뀔때마다 뜬다. -> 이 함수가 실행되는 때
       			
       			$.ajax({
        			type: 'POST',
        			url: '/sybang/servicescheduler/schedulejsondata.do',
        			dataType: 'json',
        			success:
        				function(result) {
        				
        				var events = []; //캘린더의 이벤트 객체(이 것으로 풀캘린더는 달력 내용을 출력)
						        				
						if(result != null) {
	        				
							$(result).each(function(index, item) {
	        					
								//var startdate = moment(item.startdate).format('YYYY-MM-DD');				
								
								events.push({
									title: item.title,
									//timeZone: local,
									start: moment(item.startdate).format('YYYY-MM-DD'),
									
									//end: enddate,
									//timeZone: local,
									url: item.url
								}); // push하기
	        					
	        					
	        				}); //each 문 끝
	        				console.log(events);
	        				//json데이터가 제대로 왔는지 콘솔 확인
	        				//브라우저 콘솔 
	        				/*
	        				0: {title: "신세경님 완료", start: undefined, end: undefined, url: "estimateConstruction0001.jpg"}
	        				->날짜가 안 뜬다. 포맷팅이 필요하다.. 나머지(고객명 & url은 형식에 맞게끔 제대로 들어갔기 때문에 콘솔 출력되었다)
	        				*/
	        				
	        				//여기 자바 콘솔에서는
	        				//{"title": "신세경님 완료",
	        				//"start": "2021-01-11 00:00:00",
	        				//"end": "2021-01-11 00:00:00",
	        				//"url": "estimateConstruction0001.jpg"}
							
	        				//왜 문자열이 만들어졌는데 -> 브라우저에서는 언디파인드로 뜬는지?...
	        				//해결중 ->시간의 경우, 자바스크립트의 date 타입? json에서 문자로 넘어간 시간은
	        			 	//풀캘린더 events가 인식하지 못해 undefined라고 출력된다.
	        			 	//moment를 이용해서 인식할수 있게 했으나,,,, 자바 콘솔창에 
	        			 	//db내용이 제대로 출력되나(json)으로 정보 만들었을 땐 이상X
	        			 	//브라우저 콘솔창에서 현재 날짜로 출력된다 ..
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