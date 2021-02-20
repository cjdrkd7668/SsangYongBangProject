<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 내놓기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/housepost.css">
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
<!-- list-container 시작 -->
    <div class="list-container" style="height: 950px;">
        <div class="page-header">
            <h1>방 내놓기</h1>
        </div>

        <div class="well red"><span class="glyphicon glyphicon-asterisk red"></span>&nbsp;내놓은 방의 정보가 부정확하거나 운영 방침에 위배되는 경우 중개가 종료됩니다.</div>

        <table class="table table-bordered">
            <tr>
                <th>거래 유형<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td colspan="3">
                    <label class="radio-inline"><input type="radio" name="optradio">매매</label>
                    <label class="radio-inline"><input type="radio" name="optradio">전세</label>
                    <label class="radio-inline"><input type="radio" name="optradio">월세</label>
                </td>
            </tr>
            <tr>
                <th>건물 유형<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td colspan="3">
                    <label class="radio-inline"><input type="radio" name="optradio">아파트</label>
                    <label class="radio-inline"><input type="radio" name="optradio">빌라</label>
                    <label class="radio-inline"><input type="radio" name="optradio">주택</label>
                    <label class="radio-inline"><input type="radio" name="optradio">원룸</label>
                    <label class="radio-inline"><input type="radio" name="optradio">투룸</label>
                    <label class="radio-inline"><input type="radio" name="optradio">오피스텔</label>

                </td>
            </tr>
            <tr>
                <th>가격(보증금)<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;"><input type="number" min="0" max="1000000" step="1">&nbsp;만원</td>
                <th>월세<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;"><input type="number" min="0" max="100000" step="1">&nbsp;만원</td>
            </tr>
            
            <tr>
                <th>관리비</th>
                <td colspan="3"><input type="number" min="0" max="100" step="1">&nbsp;만원</td>
            </tr>
            <tr>
                <th>주소<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td colspan="3"><input type="button" class="btn btn-basic btn-address" value="우편번호 찾기">
                    <input type="text">
                    <p><input type="text" placeholder="상세 주소 입력"></p>
            </tr>
            <tr>
                <th>전용 면적<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;">
                    <input type="number" min="10" max="300" step="1">&nbsp;㎡
                </td>
                <th>공급 면적<span class="glyphicon glyphicon-asterisk red"></span></th>
                <td style="width: 300px;">
                    <input type="number" min="10" max="300" step="1">&nbsp;㎡
                </td>
            </tr>
            <tr>
                <th>방 개수</th>
                <td style="width: 300px;">
                    <input type="number" min="1" max="8" step="1" value="1">&nbsp;개
                </td>
                <th>욕실 개수</th>
                <td style="width: 300px;">
                    <input type="number" min="1" max="5" step="1" value="1">&nbsp;개
                </td>
            </tr>
            <tr class="tr-sel">
                <th>방향</th>
                <td style="width: 300px;">
                    <div class="form-group">
                        <label for="sel1"></label>
                        <select class="form-control" id="sel1" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;">
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
                        <select class="form-control" id="sel2" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;">
                            <option>선택하세요.</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <th>기타 옵션</th>
                <td colspan="3">
                    <label class="checkbox-inline"><input type="checkbox" value="1">주차 가능</label>
<label class="checkbox-inline"><input type="checkbox" value="2">엘리베이터</label>
<label class="checkbox-inline"><input type="checkbox" value="3">반려동물</label>
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td colspan="3">
                    <input type="file" class="form-control">
                    <input type="file" class="form-control">
                </td>
            </tr>
            <tr>
                <th>설명</th>
                <td colspan="3">
                    <textarea class="form-control" rows="3" style="resize: none; font-size: 1em;"></textarea>
                </td>
            </tr>
        </table>


        <div class="btns btn-group">
            <button type="button" class="btn btn-info" style="background-color: #486BB8;">
                <span class="glyphicon glyphicon-ok"></span> 등록하기
            </button>
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/house/list.do'">
                <span class="glyphicon glyphicon-list"></span> 목록보기
            </button>
        </div>

    </div>
    <!-- list-container 끝 -->
    
	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
        var sel2 = document.getElementById("sel2");

        for (var i=1990; i<=2021; i++) {
            
            sel2.innerHTML += "<option value='" + i + "'>" + i + "년</option>";
        }
    </script>
</body>
</html>