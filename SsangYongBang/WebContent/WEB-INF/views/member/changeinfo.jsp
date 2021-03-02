<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" >
<style>
.blue {
	color: #486BB8;
}

.bluebg {
	background-color: #486BB8;
	color: #EEE;
}

.red {
	color: red;
}

</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- info-container 시작 -->
    <div class="info-container" style="margin-top: -50px;">
        <div class="page-header">
            <h1>내 정보 수정</h1>
        </div>

        <table class="table table-condensed" id="changeinfo">
            <tr>
                <th>아이디(이메일)</th>
                <td>${email }</td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="text" id="pw" name="pw" value="${pw }" required>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${name }</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${ssn }</td>
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td><input type="text" id="phone" name="phone" value="${phone }" required></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                	<input type="text" placeholder="우편 번호" class="zip_code" id="zipNo" style="width: 100px;"> 
                	<button type="button" class="zip_code_btn" onclick="javascript:goJuso();">주소 찾기</button>
                    <input type="text" id="address" readonly name="address" value="${address }" required style="width: 300px;"><br/> 
                    <input type="text" placeholder="상세 주소를 입력해주세요." id="addressDetail" name="addressDetail"> 
                </td>
            </tr>
        </table>


        <div class="btns btn-group">
            <button type="button" class="btn btn-info bluebg" id="editInfo">
                <span class="glyphicon glyphicon-ok"></span> 수정하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/member/myinfo.do'">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
        </div>
        <button type="button" class="btn btn-danger" style="float:left; margin-top: 0px;" data-toggle="modal" data-target="#withdrawModal" >
                <i class="fas fa-times-circle"></i> 탈퇴하기
        </button>
        
        <!-- 탈퇴하기 modal 시작 -->
        <div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h1 class="modal-title" style="font-size: 1.5em; text-align: center;">탈퇴하기</h1>
			       </div>
			        
			      <div class="modal-body" style="font-size: 1.2em; text-align: center;">
			      	<h1>정말로 삭제하시겠습니까?&nbsp;<i class="far fa-sad-tear blue"></i></h1>
			      </div>
			      <div class="modal-footer" style="font-size: 1.2em;">
			        <button type="button" class="btn btn-danger" id="withdraw">예, 탈퇴하겠습니다.</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">다시 생각해볼게요.</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 탈퇴하기 modal 끝 -->
        

    </div>
    <!-- info-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
	
		/* 도로명 주소 API  시작*/
		var goJuso = function() {

			var pop = window.open("/sybang/house/jusoPopup.do", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}

		var jusoCallBack = function(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, engAddr, jibunAddr, zipNo) {

			document.getElementById("zipNo").value = zipNo;
			document.getElementById("address").value = roadAddrPart1;

			if (addrDetail.length > 30) {
				alert('상세주소가 너무 길어 다시 입력해야 합니다.');
				return;
			}

			document.getElementById("addressDetail").value = addrDetail;
		}
		/* 도로명 주소 API 끝 */
		
		
		/* 내 정보 수정 */
		$("#editInfo").click(function(){
			var pw = $("#pw").val();
			var phone = $("#phone").val();
			var address = $("#address").val() + " " + $("#addressDetail").val();
			
			$.ajax({
				type: "GET",
				url: "/sybang/member/editinfook.do",
				data: "seq=" + ${seq} + "&pw=" + pw + "&phone=" + phone + "&address=" + address,
				success: function(result) {
					if (result == 1) {
						alert("회원 정보가 수정되었습니다.");
					}
					history.back();
					
				},
				error: function(a, b, c){
					console.log(a, b, c);
				}
			});

		});
		
		/* 회원 탈퇴 */
		$("#withdraw").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/sybang/member/withdrawok.do",
				data: "seq=" + ${seq},
				success: function(result) {
					if (result == 1){
						alert("회원 탈퇴가 되었습니다.");
					}
					window.location.href = "/sybang/index.do";

				},
				error: function(a, b, c){
					console.log(a, b, c);
				}
			});
		});
		
		
	</script>
</body>
</html>