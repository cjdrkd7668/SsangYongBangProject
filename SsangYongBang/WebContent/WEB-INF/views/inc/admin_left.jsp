<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qs = request.getQueryString()+""; //쿼리스트링 값이없는 경우 null이 아닌 빈문자열 반환
	
	/* System.out.println("qs : " + qs);
	System.out.println("qs.indexOf(\"&\") : " + qs.indexOf("&")); */
	
	if(qs.indexOf("&") > 0){ //쿼리스트링이 2개이상인 경우
		qs = qs.substring(0,qs.indexOf("&")); //첫번째 값만 반환
	}
	
	/* System.out.println("qs : " + qs);
	System.out.println("qs.indexOf(\"&\") : " + qs.indexOf("&")); */
%>

<style>
.left_menu + script + .container{padding-left:180px;min-height:600px;}

.left_menu{float:left;width:180px;border-right:1px solid #ddd;}
.left_menu li{line-height:28px;}
.left_menu li.on>a{color:#486BB8;}
.left_menu li.depth{background:url("/sybang/images/bottom_icon.png")no-repeat 90% 10px/8px;}
.left_menu li.depth.on ul{display:block !important;}
.left_menu li a{font-size:14px;color:#333;font-weight:bold;margin:4px 16px 6px;}
.left_menu li ul{display:none;text-indent:15px;}
.left_menu li li:last-of-type{padding-bottom:10px;}
</style>

<div class="left_menu">
	<ul>

		<li><a href="/sybang/admin2/config_site.do">사이트 환경설정</a></li>
		<li><a href="/sybang/admin/room/boardlist.do">방 관리</a></li>
		<li><a href="/sybang/admin/house/boardlist.do">매물관리</a></li>
		<li><a href="/sybang/admin/hope/boardlist.do">희망입주조건 관리</a></li>
		<li>
			<a href="/sybang/admin2/member_list.do">사용자 관리</a>
			<ul>
				<li><a href="/sybang/admin2/member_list.do?type=normal">일반회원 관리</a></li>
				<li><a href="/sybang/admin2/member_list.do?type=broker">부동산 중개사 관리</a></li>
				<li><a href="/sybang/admin2/member_list.do?type=firm">서비스 업체 관리</a></li>
			</ul>
		</li>
		<!-- <li>
			<a href="/sybang/admin2/statistics/type_building.do">데이터 센터</a>
			<ul>
				<li><a href="/sybang/admin2/statistics/type_building.do">건물형태별 거래량</a></li>
				<li><a href="/sybang/admin2/statistics/type_contract.do">계약형태별 거래량</a></li>
				<li><a href="/sybang/admin2/statistics/type_area.do">지역별 거래량</a></li>
				<li><a href="/sybang/admin2/statistics/type_age.do">구매자 연령별 거래량</a></li>
				<li><a href="/sybang/admin2/statistics/type_gender.do">구매자 성별별 거래량</a></li>
			</ul>
		</li> -->
		<li><a href="/sybang/approval/boardlist.do">업체 승인</a></li>
		<li><a href="/sybang/admin/review/boardlist.do">후기 삭제 요청</a></li>
		<li class="test"><a href="/sybang/admin2/textManager.do">회사운영정책</a></li>
	</ul>
</div>


<script>
	$(".left_menu>ul>li").each(function(){
	
		var url = window.location.pathname;
		var href = $(this).children("a").attr("href");
		
		if ($(this).find("ul").length) {
			$(this).addClass("depth")
		}
		if(href == url){
			$(this).addClass("on");
			
			$(this).find("li").eq(0).addClass("on");
			$(this).find("li").each(function(){
				href = $(this).children("a").attr("href");
				if (href.substr(href.lastIndexOf("?") + 1,href.length) == "<%=qs%>") {
					$(this).siblings().removeClass("on");
					$(this).addClass("on");
				}
				
			});
		}
	});

	$(".left_menu>ul>li").mouseenter(function(){
			$(this).find("ul").stop().slideDown();
	});
	$(".left_menu>ul>li").mouseleave(function(){
		if (!$(this).hasClass("on")) {
			$(this).find("ul").stop().slideUp();
		}
	});
	


</script>






