<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>saleschart</title>


<link rel="stylesheet" href="/sybang/css/servicemain.css">

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>


.upperBar {
	margin-left: 200px;
	width: 750px;
}

.wrapper {
	margin-left: 185px;
	width: 750px;
	height: 800px;

	padding: 17px;
}

.monthTable {
	margin-top: 50px;
	margin-left: 120px;
	border: 1px solid #ddd;
	border-radius: 7px;
	padding: 8px;

}

</style>


    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Sales'],
          ['01',  1000],
          ['03',  170],
          ['06',  20],
          ['09',  50],
          ['12',  1050]
        ]);

        var options = {
          title: '연도별 매출액 차트',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script> 


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
		<h4><span class="glyphicon glyphicon-usd" aria-hidden="true"></span> 매출 조회</h4>
		</div>

	</div>
   
   
   <!-- 본문 상단 끝 -->





			<!-- 본문 중간 -->

		<div class="wrapper">
			
			<select></select>
			<!--  구글 선차트 가져오기 -->
			<div id="curve_chart" style="width: 900px; height: 500px"></div>
			<!-- 구글차트 끝 -->

			<div class="monthTable">
				<table class="table">
					<thead>
					<tr>
						<th>번호(월별 매출)</th>
						<th>일자</th>
						<th>매출액</th>
					</tr>
					</thead>
					<tbody>
						<td>1</td>
						<td>2020-01-03</td>
						<td>100,000</td>
					</tbody>
				</table>
			
			</div>

		</div>
      
   


   
   
   
   
   
   
   </div>
   <!-- ########## 본문 끝 -->
   
   <!-- 푸터가져오기 -->
      <%@include file="/WEB-INF/views/inc/footer.jsp"%>   
   

   

   <script>
    
    </script>
</body>

</html>