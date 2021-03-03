<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 입주하기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopepost.css">
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- list-container 시작 -->
	<div class="list-container" style="height: 570px; margin-top: -50px;">
		<div class="page-header">
			<h1>희망 입주하기</h1>
		</div>

		<div class="well">입주 조건에 따라 중개사의 추천을 받을 수 있습니다.</div>
		
		<form method="post" action="/sybang/hope/post_ok.do" name="Frm">
		<input type="hidden" name="hAddress">
		<input type="hidden" name="hAddressC">

		<table class="table table-bordered">
			<tr>
				<th>거래 유형</th>
				<td id="hDType">
					<label class="radio-inline"><input type="radio" name="hDType" value="1" checked>매매</label>
					<label class="radio-inline"><input type="radio" name="hDType" value="2">전세</label>
					<label class="radio-inline"><input type="radio" name="hDType" value="3">월세</label>
				</td>
				<th>지역</th>
				<td>
					<select id="sido" class="form-control" style="display:inline-block;width:30%";>
						<option value="">==시/도==</option>
					</select>
					<select id="sigugun" class="form-control" style="display:inline-block;width:30%";>
						<option value="">==군/구==</option>
					</select>
					<select id="dong" class="form-control" style="display:inline-block;width:30%";>
						<option value="">==동/읍/면==</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="hPrice" min="0" max="1000000" step="1" value="${dto.hPrice}">&nbsp;만원</td>
				<th>방 개수</th>
				<td>
					<input type="number" name="hRoomNum" min="1" max="8" step="1" value="${dto.hRoomNum}">&nbsp;개
				</td>
			</tr>
			<tr>
				<th>면적</th>
				<c:if test="${dto.hRent != 0}">
				<td>
				</c:if>
				<c:if test="${dto.hRent == 0}">
				<td colspan=3>
				</c:if>
					<input type="number" name="hArea" min="10" max="300" step="1" value="${dto.hArea}">&nbsp;㎡
				</td>
				<c:if test="${dto.hRent != 0}">
				<th>월세</th>
				<td><input type="number" name="hRent" min="0" max="100000" step="1" value="${dto.hRent}" disabled>&nbsp;만원</td>
				</c:if>
			</tr>
			<tr>
				<th>설명</th>
				<td colspan="3">
					<textarea name="content" class="form-control" rows="6" style="resize: none; font-size: 1em;">${dto.content}</textarea>
				</td>
			</tr>
		</table>

		
		<div class="btns btn-group">
			<button type="submit" class="btn btn-info" style="background-color: #486BB8;">
				<span class="glyphicon glyphicon-ok"></span> 등록하기
			</button>
			<button type="button" class="btn btn-default" onclick="window.history.back()">
				<span class="glyphicon glyphicon-remove"></span> 취소하기
			</button>
			<button type="button" class="btn btn-default" onclick="location.href='/sybang/hope/list.do'">
				<span class="glyphicon glyphicon-list"></span> 목록보기
			</button>
		</div>
		
		</form>

	</div>
	
	<script type="text/javascript">
	jQuery(document).ready(function(){
		  //sido option 추가
		  jQuery.each(hangjungdong.sido, function(idx, code){
		    //append를 이용하여 option 하위에 붙여넣음
		    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
		  });

		  //sido 변경시 시군구 option 추가
		  jQuery('#sido').change(function(){
		    jQuery('#sigugun').show();
		    jQuery('#sigugun').empty();
		    jQuery('#sigugun').append(fn_option('','선택')); //
		    jQuery.each(hangjungdong.sigugun, function(idx, code){
		      if(jQuery('#sido > option:selected').val() == code.sido)
		        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
		    });

		    //세종특별자치시 예외처리
		    //옵션값을 읽어 비교
		    if(jQuery('#sido option:selected').val() == '36'){
		      jQuery('#sigugun').hide();
		      //index를 이용해서 selected 속성(attr)추가
		      //기본 선택 옵션이 최상위로 index 0을 가짐
		      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
		      //trigger를 이용해 change 실행
		      jQuery('#sigugun').trigger('change');
		    }
		  });

		  //시군구 변경시 행정동 옵션추가
		  jQuery('#sigugun').change(function(){
		    //option 제거
		    jQuery('#dong').empty();
		    jQuery.each(hangjungdong.dong, function(idx, code){
		      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
		        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
		    });
		    //option의 맨앞에 추가
		    jQuery('#dong').prepend(fn_option('','선택'));
		    //option중 선택을 기본으로 선택
		    jQuery('#dong option:eq("")').attr('selected', 'selected');

		  });

		  jQuery('#dong').change(function(){
		    var sido = jQuery('#sido option:selected').val();
		    var sigugun = jQuery('#sigugun option:selected').val();
		    var dong = jQuery('#dong option:selected').val();
		    var dongCode = sido + sigugun + dong + '00';
			
			var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido").val());
			var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
			var dongIdx=hangjungdong.dong.findIndex(i=>i.dong==$("#dong").val()&&i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
			
			var sido = hangjungdong.sido[sidoIdx].codeNm;//시
			var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;//시군구
			var dong = hangjungdong.dong[dongIdx].codeNm;//동
			
			var fullAddr = sido + " " + sigungu + " " + dong;
			var fullAddrCode = sidoIdx + " " + sigugunIdx + " " + dongIdx;
			
			document.Frm.hAddress.value = fullAddr;
			document.Frm.hAddressC.value = fullAddrCode;
		  });
		});

		function fn_option(code, name){
		  return '<option value="' + code +'">' + name +'</option>';
		}
		
		$("input[name='hDType']").on('change',function(){
			if ($(this).val() != 3) {
				$("input[name='hRent']").attr("disabled",true);
			}else{
				$("input[name='hRent']").attr("disabled",false);
			}
		});
		
		
		
	</script>
	<!-- list-container 끝 -->
	
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


	<script>
		$(window).load(function(){
			if ("${dto.hDType}" == "매매") {
				$("#hDType label:eq(0) input").prop("checked",true);
			}else if("${dto.hDType}" == "전세") {
				$("#hDType label:eq(1) input").prop("checked",true);
			}else{
				$("#hDType label:eq(2) input").prop("checked",true);
			}
			
			/* $("#sido").val("${dto.hAddress}".split(" ")[0]);
			$("#sigugun").val("${dto.hAddress}".split(" ")[1]);
			$("#dong").val("${dto.hAddress}".split(" ")[2]); */
			
		});
		
	</script>

</body>
</html>