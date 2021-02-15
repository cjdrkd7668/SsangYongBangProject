<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Plan</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/plan.css">

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
				<h1>스터디 일정 <small>Plan</small></h1>
                
                <table class="calendar">
                    <thead>
                        <tr>
                            <th>SUN</th>
                            <th>MON</th>
                            <th>TUE</th>
                            <th>WED</th>
                            <th>THU</th>
                            <th>FRI</th>
                            <th>SAT</th>
                        <tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><div class="date">1</div></td>
                            <td><div class="date">2</div></td>
                            <td><div class="date">3</div></td>
                            <td><div class="date">4</div></td>
                        </tr>
                        <tr>
                            <td><div class="date">5</div></td>
                            <td><div class="date">6</div></td>
                            <td><div class="date">7</div></td>
                            <td><div class="date">8</div></td>
                            <td><div class="date">9</div></td>
                            <td><div class="date">10</div></td>
                            <td><div class="date">11</div></td>
                        </tr>
                        <tr>
                            <td><div class="date">12</div>
                                <div class="item">- 교재 배포하기</div></td>
                            <td><div class="date">13</div></td>
                            <td><div class="date">14</div></td>
                            <td><div class="date">15</div></td>
                            <td><div class="date">16</div></td>
                            <td><div class="date">17</div></td>
                            <td><div class="date">18</div></td>
                        </tr>
                        <tr>
                            <td><div class="date">19</div></td>
                            <td><div class="date">20</div></td>
                            <td><div class="date">21</div></td>
                            <td><div class="date">22</div></td>
                            <td>
                                <div class="date">23</div>
                                <div class="item" data-toggle="modal" data-target="#myModal">- 템플릿 만들고 주석 제대로 달기</div>
                                <div class="item" data-toggle="modal" data-target="#myModal">- 시수 계산하기</div>
                                <div class="item" data-toggle="modal" data-target="#myModal">- 교재 배포하기</div>
                            </td>
                            <td><div class="date">24</div></td>
                            <td><div class="date">25</div></td>
                        </tr>                        
                        <tr>
                            <td><div class="date">26</div></td>
                            <td><div class="date">27</div></td>
                            <td><div class="date">28</div></td>
                            <td><div class="date">29</div></td>
                            <td><div class="date">30</div></td>
                            <td><div class="date">31</div></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                
                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-plus"></span>
                        등록
                    </button>
                </div>
                <div style="clear:both;"></div>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->
	
	
	<!-- ########## Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">일정</h4>
            </div>
            <div class="modal-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <input type="date" class="form-control" id="itemDate">
                    </li>
                    <li class="list-group-item">
                        <input type="text" class="form-control" id="itemText">
                    </li>
                    <li class="list-group-item">
                        <input type="text" class="form-control" id="itemUser" value="홍길동">
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-floppy-disk"></span> 저장</button>
                <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> 삭제</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span> 닫기</button>                    
            </div>
        </div>
        </div>
    </div>
    <!-- ########## Modal -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
		$('#myModal').on('show.bs.modal', function (e) {
	        //console.log(e.relatedTarget.innerText);
	        if (e.relatedTarget.nodeName == "DIV") {
	            $("#itemText").val(e.relatedTarget.innerText.substr(2));
	        } else {
	            console.log((new Date()).toDateString());
	            $("#itemDate").val((new Date()).toDateString());
	            $("#itemText").val("");
	        }
	    })
    </script>
</body>

</html>