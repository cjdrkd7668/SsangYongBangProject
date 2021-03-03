<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 내놓기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/housepost.css">
<style>

.list-container input[type="text"] {
	width: 300px;
	margin: 5px 0px;
}

.list-container input {
	color: #555;
	border: 1px solid #ccc;
	outline: none;
}

</style>
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
<!-- list-container 시작 -->
    <div class="container list-container" style="margin-top: -50px;">
        <div class="page-header">
            <h1>방 내놓기</h1>
        </div>

        <div class="well red"><span class="glyphicon glyphicon-asterisk red"></span>&nbsp;내놓은 방의 해당 정보가 부정확하거나 운영 방침에 위배되는 경우 중개가 종료됩니다.</div>
		
		<form method="POST" action="/sybang/house/postok.do" encType="multipart/form-data">
		
        <table class="table table-bordered">
            <tr>
                <th>거래 유형<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td colspan="3">
                    <label class="radio-inline"><input type="radio" name="dType" value="매매" required>매매</label>
                    <label class="radio-inline"><input type="radio" name="dType" value="전세">전세</label>
                    <label class="radio-inline"><input type="radio" name="dType" value="월세">월세</label>
                </td>
            </tr>
            <tr>
                <th>건물 유형<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td colspan="3">
                    <label class="radio-inline"><input type="radio" name="bType" value="아파트" required>아파트</label>
                    <label class="radio-inline"><input type="radio" name="bType" value="빌라">빌라</label>
                    <label class="radio-inline"><input type="radio" name="bType" value="주택">주택</label>
                    <label class="radio-inline"><input type="radio" name="bType" value="원룸">원룸</label>
                    <label class="radio-inline"><input type="radio" name="bType" value="투룸">투룸</label>
                    <label class="radio-inline"><input type="radio" name="bType" value="오피스텔">오피스텔</label>

                </td>
            </tr>
            <tr>
                <th>가격(보증금)<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;"><input type="number" min="0" max="1000000" step="1" name="price" required>&nbsp;만원</td>
                <th>월세<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;"><input type="number" min="0" max="100000" step="1" name="rent" required>&nbsp;만원</td>
            </tr>
            <tr>
                <th>해당 층<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;"><input type="number" min="0" max="1000" step="1" name="selectedFloor" required>&nbsp;</td>
                <th>건물 총 층<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;"><input type="number" min="0" max="1000" step="1" name="totalFloor" required>&nbsp;</td>
            </tr>
            <tr>
                <th>관리비</th>
                <td colspan="3"><input type="number" min="0" max="100" step="1" name="monthlyFee"  required>&nbsp;만원</td>
            </tr>
            <tr>
                <th>주소<span class="glyphicon glyphicon-asterisk red"></span>
                <td colspan="3">
                	<input type="text" placeholder="우편 번호" class="zip_code" id="zipNo"> 
                	<button type="button" class="zip_code_btn" onclick="javascript:goPopup();">주소 찾기</button><br/>
                    <input type="text" placeholder="기본 주소" id="address" readonly name="address" required><br/> 
                    <input type="text" placeholder="상세 주소" id="addressDetail" readonly name="addressDetail" required> 
                </td>
            </tr>
            <tr>
                <th>전용 면적<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;">
                    <input type="number" min="10" max="300" step="1" name="exclusiveArea" required>&nbsp;㎡
                </td>
                <th>공급 면적<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;">
                    <input type="number" min="10" max="300" step="1" name="supplyArea" required>&nbsp;㎡
                </td>
            </tr>
            <tr>
                <th>방 개수</th>
                <td style="width: 300px;">
                    <input type="number" min="1" max="8" step="1" value="1" name="roomNum" required>&nbsp;개
                </td>
                <th>욕실 개수</th>
                <td style="width: 300px;">
                    <input type="number" min="1" max="5" step="1" value="1" name="bathroomNum" required>&nbsp;개
                </td>
            </tr>
            <tr class="tr-sel">
                <th>방향</th>
                <td style="width: 300px;">
                    <div class="form-group">
                        <label for="sel1"></label>
                        <select class="form-control" id="sel1" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;" name="direction" required>
                          <option>선택하세요.</option>
                          <option>동향</option>
                          <option>서향</option>
                          <option>남향</option>
                          <option>남동향</option>
                          <option>남서향</option>
                          <option>북향</option>
                        </select>
                      </div>
                </td>
                <th>준공년도</th>
                <td style="width: 300px;">
                    <div class="form-group">
                        <label for="sel1"></label>
                        <select class="form-control" id="sel2" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;" name="completionYear" required>
                            <option>선택하세요.</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <th>기타 옵션</th>
                <td colspan="3">
                    <label class="checkbox-inline"><input type="checkbox" value="1" name="parkingFlag">주차 가능</label>
<label class="checkbox-inline"><input type="checkbox" value="1" name="elevator">엘리베이터</label>
<label class="checkbox-inline"><input type="checkbox" value="1" name="pet">반려동물</label>
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td colspan="3">
                    <input type="file" class="form-control" name="url1" required>
                    <input type="file" class="form-control" name="url2" required>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">
                    <input type="text" name="subject" required>
                </td>
            </tr>
            <tr>
                <th>설명</th>
                <td colspan="3">
                    <textarea class="form-control" rows="3" style="resize: none; font-size: 1em;" name="detail" required></textarea>
                </td>
            </tr>
        </table>

        <div class="btns btn-group">
            <button type="submit" class="btn btn-info" style="background-color: #486BB8;">
                <span class="glyphicon glyphicon-ok"></span> 등록하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/index.do'">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/house/list.do'">
                <span class="glyphicon glyphicon-list"></span> 목록보기
            </button>
        </div>
	
		</form>
		
		
    </div>
    <!-- list-container 끝 -->
    
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
        var sel2 = document.getElementById("sel2");

        for (var i=1990; i<=2021; i++) {
            
            sel2.innerHTML += "<option value='" + i + "'>" + i + "년</option>";
        }
        
        /* 도로명 주소 API  시작*/
        var goPopup = function(){ 
        	
        	var pop = window.open("/sybang/house/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        	
        } 
        
        var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
        	
        	document.getElementById("zipNo").value = zipNo; 
        	document.getElementById("address").value = roadAddrPart1; 
        	
        	if(addrDetail.length>30){ 
        		alert('상세주소가 너무 길어 다시 입력해야 합니다.'); 
        		return;
        	} 
        	
        	document.getElementById("addressDetail").value = addrDetail; 
        }
        /* 도로명 주소 API 끝 */
        
    </script>
</body>
</html>