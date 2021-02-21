<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중개사 공간</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/broker.css">

<style>
h1 {
	text-align: center;
}

.container-pay {
	width: 500px;
	padding-top: 20px;
}


.btn-group {
	float: left;
    position: relative;
    left: 20%
}

.btn-cancel {
	margin-right: 5px;
}
</style>


</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>


	<h1>광고 결제</h1>
	<hr>
	<div class="container container-pay">
		<form action="" name="cal">
			<table class="table table-bordered">
				<tr>
					<th>개수</th>
					<td><select class="form-control" id="trn"
						style="width: 200px;">
							<option value="">선택하세요.</option>
							<option value="1">10개</option>
							<option value="2">20개</option>
							<option value="3">30개</option>
							<option value="4">40개</option>
							<option value="5">50개</option>
							<option value="6">60개</option>
							<option value="7">70개</option>
							<option value="8">80개</option>
							<option value="9">90개</option>
							<option value="10">100개</option>
					</select></td>
				</tr>
				<tr>
					<th>기간</th>
					<td><span id="cost" data-val="88000">30일</span></td>
				</tr>
				<tr>
					<th>금액</th>
					<td><span id="total">0</span>원</td>
				</tr>
			</table>
			
			<div class ="btn-group">
				<button type="button" class="btn btn-default btn-cancel">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button>	
				
				<button type="button" class="btn btn-default ">
					<span class="glyphicon glyphicon-ok"></span> 결제하기
				</button> 
				
			</div>
		</form>
	</div>

	<script>

        $("document").ready(function () {
            var cost = $('#cost').data('val');
            $('#trn').change(function () {
                var optionSelected = $(this).val();
                var tot = parseInt(cost) * parseInt(optionSelected);
                $('#total').html(tot);
            });
        });
    </script>
	


	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


</body>
</html>