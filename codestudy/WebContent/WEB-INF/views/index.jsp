<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Hello</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>

</style>
</head>

<body>

	<!-- ########## 상단 헤더 시작 -->	
	<%
		out.flush();
	    RequestDispatcher dheader = request.getRequestDispatcher("/inc/header.do");
	    dheader.include(request, response);
	%>
	<!-- ########## 상단 헤더 끝 -->


	<!-- ########## 본문 시작 -->
	<div class="main">

		<!-- ########## 좌측 시작 -->
		<div class="menu col-sm-12 col-md-3">
			<!-- ########## 메뉴 시작 -->
			<%
				out.flush();
			    RequestDispatcher dmenu = request.getRequestDispatcher("/inc/menu.do");
				dmenu.include(request, response);
			%>
			<!-- ########## 메뉴 끝 -->

			<!-- ########## 인증 시작 -->
			<%
				out.flush();
			    RequestDispatcher dauth = request.getRequestDispatcher("/inc/auth.do");
			    dauth.include(request, response);
			%>
			<!-- ########## 인증 끝 -->

			<!-- ########## 채팅 시작 -->
			<%
				out.flush();
			    RequestDispatcher dchat = request.getRequestDispatcher("/inc/chat.do");
				dchat.include(request, response);
			%>
			<!-- ########## 채팅 끝 -->
		</div>
		<!-- ########## 좌측 끝 -->



		<!-- ########## 내용 시작 -->
		<div class="content col-sm-12 col-md-9">
			<div>
				<h1>
					시작 <small>Hello</small>
				</h1>
				<div style="min-height: 747px">
				
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>게시물수</th>
						</tr>
						<c:forEach items="${blist}" var="bdto">
						<tr>
							<td>${bdto.mseq}</td>
							<td>${bdto.name}</td>
							<td>${bdto.cnt}</td>
						</tr>
						</c:forEach>
					</table>
					
					
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>게시물수</th>
						</tr>
						<c:forEach items="${plist}" var="pdto">
						<tr>
							<td>${pdto.mseq}</td>
							<td>${pdto.name}</td>
							<td>${pdto.cnt}</td>
						</tr>
						</c:forEach>
					</table>
					
					<hr>
					
					<div id="chart1"></div>
					
					<hr>
					
					<div id="chart2"></div>
					
					
				
				</div>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script src="/codestudy/js/highcharts.js"></script>
	<script>
    
	
	//바 차트
	Highcharts.chart('chart1', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: '회원별 게시물 수 + 댓글 수'
	    },
	    xAxis: {
	        categories: [
	        			<c:forEach items="${blist}" var="bdto" varStatus="status">
	        			'${bdto.name}'
	        			<c:if test="${status.index < blist.size() - 1}">
	        			,
	        			</c:if>
	        			</c:forEach>
	        			],
	        title: {
	            text: null
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: '게시물수 + 댓글수',
	            align: 'high'
	        },
	        labels: {
	            overflow: 'justify'
	        }
	    },
	    tooltip: {
	        valueSuffix: '개'
	    },
	    plotOptions: {
	        bar: {
	            dataLabels: {
	                enabled: true
	            }
	        }
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'top',
	        x: -40,
	        y: 80,
	        floating: true,
	        borderWidth: 1,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
	        shadow: true
	    },
	    credits: {
	        enabled: false
	    },
	    series: [
	    
	    
	    {
	        name: '게시물 수',
	        data: [
	        	<c:forEach items="${blist}" var="bdto" varStatus="status">	
	        	${bdto.cnt}
	        	<c:if test="${status.index < blist.size() - 1}">
    			,
    			</c:if>
	        	</c:forEach>
	        	]
	    }
	    
	    ,
	    
	    {
	        name: '댓글 수',
	        data: [
	        	<c:forEach items="${plist}" var="pdto" varStatus="status">	
	        	${pdto.cnt}
	        	<c:if test="${status.index < plist.size() - 1}">
    			,
    			</c:if>
	        	</c:forEach>
	        	]
	    }
	    
	    
	    
	    ]
	});
	
	
	
	//파이 차트
	Highcharts.chart('chart2', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: '게시물 수'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.y:.0f}개</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '개'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {y:.0f}개'
	            }
	        }
	    },
	    series: [{
	        name: '게시물수',
	        colorByPoint: true,
	        data: [
	        	
	        <c:forEach items="${blist}" var="bdto">	
	        {
	            name: '${bdto.name}',
	            y: ${bdto.cnt}    
	        }
	        	        
	        ,
	        
	        </c:forEach>	        
	        
	        ]
	    }]
	});
	
    </script>
</body>

</html>













