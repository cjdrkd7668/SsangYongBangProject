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

<style>


.upperBar {
	margin-left: 200px;
	width: 750px;
}

.wrapper {
	margin-left: 200px;
	margin-bottom: 15px;
	width: 900px;
	height: 550px;
	padding: 17px;

}


#tbl {
    border: 1px solid #999;
    border-collapse: collapse;
    width: 805px;
}

#tbl th, #tbl td {
    border: 1px solid #999;
}

#tbl th {
    background-color: #444;
    color: white;
    padding: 7px;
}

#tbl td {
    height: 80px;
    width: 115px;
    vertical-align: top;
    padding: 15px;
    position: relative;
}

#tbl .no {
    position: absolute;
    right: 10px;
    top: 9px;
}

#tbl td div {
    font-size: .9em;
}


#tbl td:first-child .no {
    color: tomato;
}

#tbl td:last-child .no {
    color: cornflowerblue;
}


.btns {
	margin-left: 430px;
	margin-bottom: 100px;
	
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
		<h4> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 일정 관리</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="wrapper">


    
	    <h1 id="title"></h1>
	    <table id="tbl">
	        <thead>
	            <tr>
	                <th>SUN</th>
	                <th>MON</th>
	                <th>TUE</th>
	                <th>WED</th>
	                <th>THU</th>
	                <th>FRI</th>
	                <th>SAT</th>
	            </tr>
	        </thead>
	        <tbody id="tbody1"></tbody>
	    </table>



			
		</div>


	<!-- 본문 하단 -->

		<div class="btns">
			<button type="button" class="btn btn-default serviceinfobtn">견적상담 일정 등록</button>
			<button type="button" class="btn btn-default serviceinfobtn"><a href="/sybang/servicescheduler/editschedule.do">서비스 일정 등록</a></button>
			<button type="button" class="btn btn-default serviceinfobtn"><a href="/sybang/servicescheduler/editschedule.do">서비스 완료 등록</a></button>
		</div>   
   
   
   <!-- 본문하단 끝 -->>
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
		var title = document.getElementById("title");
		var tbody1 = document.getElementById("tbody1");
		
		var now = new Date();
		
		var lastDay = (new Date(now.getFullYear(), now.getMonth()+1, 0)).getDate(); 
		//해당 월의 마지막 날
		var firstDay = (new Date(now.getFullYear(), now.getMonth(), 1)).getDay();
		//해당 월의 첫 날
		
		title.textContent = now.getFullYear() + "." + (now.getMonth() + 1);
		
		//내용물 채우기
		var temp = "";
		temp = "<tr>";
		
		for (var i=0; i<firstDay; i++) {
		    temp += "<td></td>";
		}
		
		for (var i=1; i<=lastDay; i++) {
		    temp += "<td>";
		    temp += "<span class='no'>" + i + "</span>";
		    temp += "<div></div>";
		    temp += "</td>";
		
		    if ((i + firstDay) % 7 == 0) {
		        temp += "<tr></tr>";
		    }
		
		}
		
		
		var seed = 7;
		
		if (7 - (lastDay % 7 + firstDay) < 0) {
		    seed = 14;
		}
		
		for (var i=0; i<(seed - (lastDay % 7 + firstDay)); i++) {
		    temp += "<td></td>";
		}
		temp += "</tr>";
		
		tbody1.innerHTML = temp;
   
   
		
		
		
    </script>
</body>

</html>