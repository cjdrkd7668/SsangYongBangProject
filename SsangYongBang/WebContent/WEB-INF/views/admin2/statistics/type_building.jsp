<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/admin_asset.jsp"%>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/sybang/css/admin2.css">
<%=SITE_TITLE%>
<style type="text/css">
	.radio .cr-icon{color:<%=SITE_COLOR%>}
	label:nth-of-type(1){padding-left:0;margin-left:0;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="wrap">	
		<%@include file="/WEB-INF/views/inc/admin_left.jsp"%>
		<div class="conWrap">
			<h1 class="page_title">건물 형태별 거래량</h1>
			
			<table class="admin_style_01">
				<colgroup>
					<col width="15%">
					<col width="*">
				</colgroup>
				<tr>
					<th align="center" width="150"><b>기간 검색</b></th>
					<td>
						<div style="float:left;">
							<div>
								<span class="input_wrap">
									<input type="hidden" id="sHidden">
									<input type="text" id="sdate" name="sdate" value="2021-02-01" class="box border_input" maxlength="10" style="width:90px;">
									<img src="http://demo3.mallshopping.co.kr/admin/images/button/btn_open.gif" alt="달력" id="sDateImg" style="cursor:pointer">
								</span>
								~
								<span class="input_wrap">
									<input type="hidden" id="eHidden">
									<input type="text" id="edate" name="edate" value="2021-02-21" class="box border_input" maxlength="10" style="width:90px;">
									<img src="http://demo3.mallshopping.co.kr/admin/images/button/btn_open.gif" alt="달력" id="eDateImg" style="cursor:pointer">
								</span>
							</div>
							<div style="padding-top:5px;">
								<span onclick="inputDate('sdate', 'edate', 'W', 0)" class="date_span">이번달</span>
								<span onclick="inputDate('sdate', 'edate', 'T', 0)" class="date_span">오늘</span>
								<span onclick="inputDate('sdate', 'edate', 'T', 1)" class="date_span">어제</span>
								<span onclick="inputDate('sdate', 'edate', 'D', 3)" class="date_span">3일간</span>
								<span onclick="inputDate('sdate', 'edate', 'D', 7)" class="date_span">7일간</span>
								<span onclick="inputDate('sdate', 'edate', 'D', 10)" class="date_span">10일간</span>
								<span onclick="inputDate('sdate', 'edate', 'D', 20)" class="date_span">20일간</span>
								<span onclick="inputDate('sdate', 'edate', 'D', 30)" class="date_span">30일간</span>
							</div>
						</div>
						<div style="float:left;margin-left:10px;"><button class="btn btn-primary">검색</button></div>
					</td>
				</tr>
				<tr>
					<th align="center" width="150"><b>건물 형태</b></th>
					<td>
						<div class="radio">
							<label>
				                <input type="radio" name="type">
				                <span class="cr"><i class="cr-icon fa fa-star"></i></span>
				                	아파트
				            </label>
				            <label>
				                <input type="radio" name="type">
				                <span class="cr"><i class="cr-icon fa fa-star"></i></span>
				                	빌라
				            </label>
				            <label>
				                <input type="radio" name="type">
				                <span class="cr"><i class="cr-icon fa fa-star"></i></span>
				                	주택
				            </label>
				            <label>
				                <input type="radio" name="type">
				                <span class="cr"><i class="cr-icon fa fa-star"></i></span>
				                	원룸
				            </label>
				            <label>
				                <input type="radio" name="type">
				                <span class="cr"><i class="cr-icon fa fa-star"></i></span>
				                	투룸
				            </label>
				            <label>
				                <input type="radio" name="type">
				                <span class="cr"><i class="cr-icon fa fa-star"></i></span>
				                	오피스텔
				            </label>
			            </div>
						
					</td>
				</tr>
			</table>
			
			<div class="btnWrap"></div>
			
		</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript">
		$(".left_menu > ul > li").eq(5).addClass("on").find("li").eq(0).addClass("on");
		
	</script>

</body>
</html>














