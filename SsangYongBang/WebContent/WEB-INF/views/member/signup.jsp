<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/membersignup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<style>
</style>
</head>
<body>


	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- maincontainer 시작 -->
	<main class="container" id="maincontainer">

		<div class="jumbotron bluebg">
			<h1 class="page-header">
				쌍용방 회원 가입을 시작합니다. <i class="fas fa-laugh-squint bluebg"></i>
			</h1>
		</div>

			<table class="table table-condensed stable">
				<tr>
					<th>아이디(이메일)</th>
					<td><input type="text" id="email" name="email"
						class="form-control" placeholder="이메일을 입력해주세요." required>
						<input type="text" id="valid" name="valid" class="form-control"
						readonly disabled></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw" name="pw"
						class="form-control" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="pwcheck" name="pwcheck"
						class="form-control" required> <input type="text"
						id="pvalid" name="pvalid" class="form-control" readonly disabled>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="name"
						class="form-control" placeholder="이름을 입력해주세요." minlength="2"
						maxlength="4" required> <input type="text" id="nvalid"
						name="nvalid" class="form-control" readonly disabled></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><input type="text" id="ssn1" name="ssn1"
						class="form-control" placeholder="" maxlength="6" required>&nbsp;&nbsp;-&nbsp;&nbsp;<input
						type="password" id="ssn2" name="ssn2" class="form-control"
						placeholder="" maxlength="7" required></td>
				</tr>
				<tr>
					<th>핸드폰 번호</th>
					<td><input type="text" id="phone1" name="phone1"
						class="form-control" placeholder="" maxlength="3" value="010"
						required> &nbsp;&nbsp;-&nbsp;&nbsp; <input type="text"
						id="phone2" name="phone2" class="form-control" placeholder=""
						maxlength="4" required> &nbsp;&nbsp;-&nbsp;&nbsp; <input
						type="text" id="phone3" name="phone3" class="form-control"
						placeholder="" maxlength="4" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="zip" name="zip"
						class="form-control" placeholder="우편 번호">
						<input type="text" id="findaddress"
						name="findaddress" class="form-control"
						onclick="javascript:goJuso();" value="우편 번호 찾기" required>
						<input type="text" id="address1" name="address1"
						class="form-control" placeholder="" required> 
						<input
						type="text" id="address2" name="address2" class="form-control"
						placeholder="상세 주소를 입력해주세요." required></td>
				</tr>
				<tr>
					<th colspan="2">
						<h2>이용 약관</h2>
						<p
							style="border: 1px solid #444; width: 600px; height: 200px; overflow: auto; margin: 0px auto;">
							제6조(회원가입) <br>
							<br> ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를
							함으로서 회원가입을 신청합니다.<br>
							<br> ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한
							회원으로 등록합니다.<br>
							<br> 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만
							제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
							2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br> 3. 기타 회원으로 등록하는 것이 “몰”의
							기술상 현저히 지장이 있다고 판단되는 경우<br>
							<br> ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br>
							<br> ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여
							회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br>
							<br> 제7조(회원 탈퇴 및 자격 상실 등) <br>
							<br> ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br>
							<br> ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br>
							<br> 1. 가입 신청 시에 허위 내용을 등록한 경우<br> 2. “몰”을 이용하여 구입한 재화
							등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br> 3. 다른
							사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br> 4. “몰”을
							이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>
							<br> ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그
							사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br>
							<br> ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고,
							회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br>
							<br> 제8조(회원에 대한 통지)<br>
							<br> ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로
							할 수 있습니다.<br>
							<br> ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에
							갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br>
							<br> 제9조(구매신청 및 개인정보 제공 동의 등) <br>
							<br> ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은
							이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. <br> 1. 재화 등의
							검색 및 선택<br> 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br>
							3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인<br>
							4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭)<br> 5.
							재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의 6. 결제방법의 선택<br>
							<br> ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자,
							2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의
							개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도
							같습니다.)<br>
							<br> ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보
							취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를
							받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과
							관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해
							알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.
						</p>
						<div style="text-align: center; margin-top: 5px;">
							<input type="checkbox" name="agree" id="agree"> <label
								for="agree">약관에 동의합니다.</label>
						</div>
					</th>
				</tr>
			</table>
			<hr>

			<div class="well bluebg" style="height: 70px; padding: -15px;">
				<div class="btns btn-group">
					<button type="button" class="btn btn-default" id="regbtn">
						<i class="fas fa-check-square"></i> 가입하기
					</button>

					<button type="button" class="btn btn-default bluebg"
						onclick="location.href='history.back();';">
						<i class="fas fa-times"></i> 취소하기
					</button>
				</div>
			</div>



	</main>
	<!-- maincontainer 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


	<script>

					/* 도로명 주소 API  시작*/
					var goJuso = function() {

						var pop = window
								.open("/sybang/house/jusoPopup.do", "pop",
										"width=570,height=420, scrollbars=yes, resizable=yes");
					}

					var jusoCallBack = function(roadFullAddr, roadAddrPart1,
							addrDetail, roadAddrPart2, engAddr, jibunAddr,
							zipNo) {

						document.getElementById("zip").value = zipNo;
						document.getElementById("address1").value = roadAddrPart1;

						if (addrDetail.length > 30) {
							alert('상세주소가 너무 길어 다시 입력해야 합니다.');
							return;
						}

						document.getElementById("address2").value = addrDetail;
					}
					/* 도로명 주소 API 끝 */

					var getName = RegExp(/^[가-힣]+$/);
					var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

					// 이메일 유효성 검사
					$("#email").keyup(
							function() {

								var emaillength = $(this).val().length;
								if (emaillength == 0) {
									$("#valid").val("");
								} else if (!getMail.test($("#email").val())) {
									$("#valid").val("이메일 형식이 아닙니다.").css(
											"color", "red");
								} else {
									$("#valid").val("아이디가 적합합니다.").css("color",
											"#486BB8");
								}
							});

					// 비밀번호 검사
					$("#pwcheck").keyup(
							function() {

								if ($("#pw").val() != ($("#pwcheck").val())) {
									$("#pvalid").val("비밀번호가 일치하지 않습니다.").css(
											"color", "red");
								} else if ($("#pw").val() == ($("#pwcheck")
										.val())) {
									$("#pvalid").val("비밀번호가 일치합니다.").css(
											"color", "#486BB8");
								}
							});

					$("#name").keyup(
							function() {

								if (!getName.test($(this).val())) {
									$("#nvalid").val("이름은 한글로만 적어주세요.").css(
											"color", "red");
								} else if (getName.test($(this).val())) {
									$("#nvalid").val("사용하실 수 있는 이름입니다.").css(
											"color", "#486BB8");
								}
							});
					
					$("#regbtn").click(function(){
						
						 if ($("#agree").is(":checked") == false){
							 alert("약관에 동의하셔야 회원 가입을 하실 수 있습니다.");
							 return;
							 
						 } else if ($("#agree").is(":checked") == true){
							
							 var email = $("#email").val();
							 var pw = $("#pw").val();
							 var name = $("#name").val();
							 var ssn = $("#ssn1").val() + '-' + $("#ssn2").val();
							 var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
							 var address = $("#address1").val() + ' ' + $("#address2").val();
							 
							/* console.log(email);
							console.log(pw);
							console.log(name);
							console.log(ssn);
							console.log(phone);
							console.log(address); */
							
							$.ajax({
								
								type: "GET",
								url: "/sybang/member/signupok.do",
								data: "email=" + email + "&pw=" + pw + "&name=" + name + "&ssn=" + ssn + "&phone=" + phone + "&address=" + address,
								success: function(result) {
									if (result == 1) {
										alert("회원 가입이 되었습니다.");
									}
									window.location.href = "/sybang/index.do";
								},
								error:  function(a, b, c){
									console.log(a, b, c);
								}
								
							});
						 }
					});
					
					
				</script>

</body>
</html>