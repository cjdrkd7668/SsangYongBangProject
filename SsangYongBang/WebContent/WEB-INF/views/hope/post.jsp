<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 입주하기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopepost.css">
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- list-container 시작 -->
    <div class="list-container" style="height: 570px;">
        <div class="page-header">
            <h1>희망 입주하기</h1>
        </div>

        <div class="well">입주 조건에 따라 중개사의 추천을 받을 수 있습니다.</div>

        <table class="table table-bordered">
            <tr>
                <th>거래 유형</span></th>
                <td>
                    <label class="radio-inline"><input type="radio" name="optradio">매매</label>
                    <label class="radio-inline"><input type="radio" name="optradio">전세</label>
                    <label class="radio-inline"><input type="radio" name="optradio">월세</label>
                </td>
                <th>지역</th>
                <td>
                    <!-- address 시작 -->
                <div class="address">
                    <select class="form-control">
                        <option value="">시/도</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                    <select class="form-control">
                        <option value="">시/군/구</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                    <select class="form-control">
                        <option value="">읍/면/동</option>
                        <option value="1">서울시</option>
                        <option value="2">경기도</option>
                        <option value="3">인천시</option>
                        <option value="4">강원도</option>
                        <option value="5">대전시</option>

                    </select>
                </div>
                <!-- address 끝 -->
                </td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="number" min="0" max="1000000" step="1">&nbsp;만원</td>
                <th>월세</th>
                <td><input type="number" min="0" max="100000" step="1">&nbsp;만원</td>
            </tr>
            <tr>
                <th>면적</th>
                <td>
                    <input type="number" min="10" max="300" step="1">&nbsp;㎡
                </td>
                <th>방 개수</th>
                <td>
                    <input type="number" min="1" max="8" step="1" value="1">&nbsp;개
                </td>
            </tr>
            <tr>
                <th>설명</th>
                <td colspan="3">
                    <textarea class="form-control" rows="6" style="resize: none;"></textarea>
                </td>
            </tr>
        </table>

        
        <div class="btns btn-group">
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-ok"></span> 등록하기
            </button>
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/hope/list.do'">
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