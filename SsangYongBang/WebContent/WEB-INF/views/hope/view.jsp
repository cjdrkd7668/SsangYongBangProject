<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 입주 정보 글</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/hopepost.css">
</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	
    <!-- list-container 시작 -->
    <div class="list-container" style="height: 550px; margin-top: -50px;">
        <div class="page-header">
            <h1>희망 입주 정보</h1>
        </div>

        <table class="table table-bordered">
            <tr>
                <th>거래 유형</span></th>
                <td>
                    전세
                </td>
                <th>지역</th>
                <td>
                    <!-- address 시작 -->
                <div class="address">
                    서울시 강남구 역삼동
                </div>
                <!-- address 끝 -->
                </td>
            </tr>
            <tr>
                <th>가격</th>
                <td>2억 3000만원</td>
                <th>월세</th>
                <td>-</td>
            </tr>
            <tr>
                <th>면적</th>
                <td>
                    36.24㎡
                </td>
                <th>방 개수</th>
                <td>
                    1개
                </td>
            </tr>
            <tr>
                <th>설명</th>
                <td colspan="3">
                    <textarea class="form-control" rows="6" style="resize: none; font-size: 1em;">희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.희망 입주 글 내용입니다.</textarea>
                </td>
            </tr>
        </table>

        
        <div class="btns btn-group">
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-ok"></span> 수정하기
            </button>
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-trash"></span> 삭제하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/hope/list.do'">
                <span class="glyphicon glyphicon-list"></span> 목록보기
            </button>
        </div>

    </div>
    <!-- list-container 끝 -->
    
    <!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

    
</body>
</html>