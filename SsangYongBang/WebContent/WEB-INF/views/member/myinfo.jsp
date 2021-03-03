<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/mypage.css">
<style>
.page-bar {
	margin-left: 200px;
	text-align: center;
}

.list-container {
    padding: 20px;
    width: 1000px;
    margin: 30px auto;
    height: 1050px;
}

.off {
	display: none;
}

#writecomment #nav,
#writereview #nav {
  width: 500px;
  text-align: center;
}

#writecomment #nav a,
#writereview #nav a {
  display: inline-block;
  color: #3B79BC;
  width: 35px;
  height: 35px;
  padding: 6px;
  border: 1px solid #EEE;
}

#writecomment #nav a.active,
#writereview #nav a.active {
  background: #3B79BC;
  color: #EEE;
}
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

<!-- list-container 시작 -->
    <div class="list-container" style="margin-top: -50px;">
        <div class="page-header">
            <h1>내 정보 관리</h1>
            <hr>
            <div class="myinfo-container well">
                <table class="table" id="myinfo">
                    <tr>
                        <td rowspan="2"><img src="/sybang/images/nopic.jpg" height="100px;"></td>
                        <td style="font-size: 1.3em;">${name } (${email })</td>
                        <td rowspan="2"><a href="/sybang/member/changeinfo.do" class="btn btn-default" value=""
                            style="font-size: 1.1em; text-align: center; margin-top: 25px;">내 정보 수정</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            총 게시물&nbsp;&nbsp;<strong style="color: #3777BA;">${totalPost}</strong>개
                            / 총 댓글&nbsp;&nbsp;<strong style="color: #3777BA;">${totalComment}</strong>개
                        </td>
                    </tr>
                </table>

            </div>
        </div>

        <ul class="nav nav-tabs" style="clear: both;">
            <li class="active"><a data-toggle="tab" id="myPost" href="#writepost">내가 쓴 글</a></li>
            <li><a data-toggle="tab" id="myComment" href="#writecomment">내가 쓴 댓글</a></li>
            <li><a data-toggle="tab" id="myReview" href="#writereview">내 후기/평점</a></li>
        </ul>

        <!-- tab-content 시작 -->
        <div class="tab-content">

            <!-- 내가 쓴 글 시작 -->
            <div class="tab-pane fade in active" id="writepost">
            	<div id="btn-post">
                        <button type="button" class="btn btn-default" id="ckAll">
                            <span class="glyphicon glyphicon-ok"></span> 전체 선택
                        </button>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span> 삭제
                        </button>
                    </div>
                    <div style="clear: both;"></div>
                <table class="table table-condensed" id="tbl-post">
                    
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    
                    <!-- 받아온 내가 쓴 글 목록을 forEach로  -->
                    <c:forEach items="${plist }" var="pdto">
                    <tr>
                        <td><input type="checkbox" class="ckItem"></td>
                        <td style="font-size: 1.2em;">${pdto.seq }</td>
						<!-- 해당 글이 자유게시판 글일 경우 -->
                        <c:if test="${pdto.which eq '자유게시판' }">
                        	<td onclick="location.href='/sybang/free/detail.do?seq=${pdto.seq}';" style="font-size: 1.2em;">
                        	${pdto.subject }&nbsp;(${pdto.ccount})
                        </c:if>
                        <!-- 해당 글이 문의게시판 글일 경우 -->
                        <c:if test="${pdto.which eq '문의게시판' }">
	                        <td onclick="location.href='/sybang/inquiry/detail.do?seq=${pdto.seq}';" style="font-size: 1.2em;">
	                        ${pdto.subject }&nbsp;(${pdto.ccount})
                        </c:if>
							
							<!-- 최신 글 시작 -->
							<c:if test="${pdto.gap < 1 }">
								<span class="badge" style="background-color: red;">N</span>
							</c:if>
							<!-- 최신 글 끝 -->
                           
                            <div class="post-content" style="font-size: 0.9em;">${pdto.detail }</div>
                            <div class="post-type" style="font-size: 0.8em;">게시판 : ${pdto.which }</div>
                        </td>
                        <td>
                            <div class="post-date" style="font-size: 1.1em;">${pdto.regdate }</div>
                        </td>
                        <td>
                            <div class="post-readcount" style="font-size: 1.2em;">${pdto.readcount }</div>
                        </td>
                    </tr>
                    </c:forEach>
                </table>

                <!-- page-bar 시작 -->
				<nav class="col-md-8 page-bar">
					<ul class="pagination">${ppagebar }
					</ul>
				</nav>
				<!-- page-bar 끝 -->
            </div>
            <!-- 내가 쓴 글 끝 -->

            <!-- 내가 쓴 댓글 시작 -->
            <div class="tab-pane fade" id="writecomment">
            <div id="btn-comment">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-ok"></span> 전체 선택
                        </button>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span> 삭제
                        </button>
                    </div>
                    <div style="clear: both;"></div>
                <table class="table table-condensed" id="tblcomment">
                	<thead>
                	</thead>
                    <tbody>
	                    
                    </tbody>
                </table>
                
				
            </div>
            <!-- 내가 쓴 댓글 끝 -->

            <!-- 내 후기 시작 -->
            <div class="tab-pane" id="writereview">
                <table class="table table-condensed" id="tblreview">
                	<thead>
	                    <tr>
	                        <th class="col-md-3">중개사</th>
	                        <th class="col-md-2">평점</th>
	                        <th class="col-md-5">후기</th>
	                        <th class="col-md-2">작성일</th>
	                    </tr>
                    </thead>
                    <tbody>
	                    
                    </tbody>
                </table>

                
            </div>
            <!-- 내 후기 끝 -->

        </div>
        <!-- tab-content 끝 -->







    </div>
    <!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
	
		$("#ckAll").click(function(){
			
			if ($(".ckItem").prop("checked")) {
				$(".ckItem").prop("checked", false);	
			} else {
				$(".ckItem").prop("checked", true);
			}
		});
	
		//내가 쓴 댓글 클릭 시
		$("#myComment").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/sybang/member/mycommentdata.do",
				data: "authorseq=" + ${seq},
				dataType: "json",
				async: false,
				success: function(result) {
					$("#tblcomment tbody").html("");
					
					$(result).each(function(index, item) {
						let temp = "";
						temp += "<tr onclick=\"location.href=\'/sybang/free/detail.do?seq=" + item.frseq + "\';\">";
						temp += "<td><input type=\"checkbox\"></td>";
						temp += "<td><div class=\"cmt-date\">" + item.regdate + "</div>";
						//temp += "<c\:if test=\"" + item.gap "< 1\"><span class=\"badge\" style=\"background-color: red\;\">N</span></c\:if>;
						temp += "<div class=\"cmt-content\">" + item.detail + "</div>";
						temp += "<div class=\"cmt-title\">원문 제목 : " + item.subject +"</div>";
						temp += "</td>";
						temp += "</tr>";
						
						$("#tblcomment tbody").append(temp);
					});
				},
				error: function(a, b, c) {
					alert("가져올 댓글이 없습니다.");
					console.log(a, b, c);
				}
			});
		});
	
		//내가 쓴 댓글 페이징
		$("#myComment").click(function() {
			
			$("#nav").remove();
			
			$("#tblcomment").after("<div class=\"col-md-12 page-bar\" id=\"nav\">");
			
			//총 개수
			var rowtotal = $("#tblcomment").find("tr").length;
			
			//총 페이지 수
			var total = Math.ceil(rowtotal/5);
			
			var i = 0;
			
			for (; i < total; i++){
				$("<a class=\"pagination\" href=\"#\"></a>").attr("rel", i).html(i+1).appendTo("#nav");
			}
			
			$("#tblcomment").find("tr").addClass("off").slice(0, 5).removeClass("off");
			
			var link = $("#nav a");
			
			link.on("click", function(evt) {
				evt.preventDefault();
				
				if ($(this).hasClass("active")) {
					return;
				}
				link.removeClass("active");
				$(this).addClass("active");
				
				var nowPage = $(this).attr("rel");
				var begin = nowPage * 5;
				var end = begin + 5;
				
				$("#tblcomment").find("tr").css("opacity", "0").addClass("off").slice(begin, end).removeClass("off").animate({opacity: 1}, 300);
			});
			
			link.filter(":first").addClass("active");
			
		});
		
		
		//내 후기 클릭 시
		$("#myReview").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/sybang/member/myreviewdata.do",
				data: "mseq=" + ${seq},
				dataType: "json",
				async: false,
				success: function(result) {
					$("#tblreview tbody").html("");
					
					$(result).each(function(index, item) {
						let temp = "";
						temp += "<tr>";
						temp += "<td style=\"font-size: 1.1em;\">" + item.bname + "</td>";
						temp += "<td style=\"font-size: 1.1em; color: #486BB8;\">" + item.star + "</td>";
						temp += "<td style=\"font-size: 1.1em;\">" + item.detail + "</td>";
						temp += "<td style=\"font-size: 1.1em;\">" + item.regdate + "</td>";
						temp += "</tr>";
						
						$("#tblreview tbody").append(temp);
					});
				},
				error: function(a, b, c) {
					alert("가져올 후기가 없습니다.");
					console.log(a, b, c);
				}
			});
			
			//내 후기 페이징
			$("#myReview").click(function() {
				
				$("#nav").remove();
				
				$("#tblreview").after("<div class=\"col-md-12 page-bar\" id=\"nav\">");
				
				//총 개수
				var rowtotal = $("#tblreview tbody").find("tr").length;
				
				//총 페이지 수
				var total = Math.ceil(rowtotal/5);
				
				var i = 0;
				
				for (; i < total; i++){
					$("<a class=\"pagination\" href=\"#\"></a>").attr("rel", i).html(i+1).appendTo("#nav");
				}
				
				$("#tblreview").find("tr").addClass("off").slice(0, 5).removeClass("off");
				
				var link = $("#nav a");
				
				link.on("click", function(evt) {
					evt.preventDefault();
					
					if ($(this).hasClass("active")) {
						return;
					}
					link.removeClass("active");
					$(this).addClass("active");
					
					var nowPage = $(this).attr("rel");
					var begin = nowPage * 5;
					var end = begin + 5;
					
					$("#tblreview").find("tr").css("opacity", "0").addClass("off").slice(begin, end).removeClass("off").animate({opacity: 1}, 300);
				});
				
				link.filter(":first").addClass("active");
				
			});
			
			
			
		});
		
		
		
		
		
	</script>
	
</body>
</html>