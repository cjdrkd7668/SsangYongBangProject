<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/mypage.css">
<style>
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- info-container 시작 -->
    <div class="info-container" style="margin-top: -50px;">
        <div class="page-header">
            <h1>회원 정보 수정</h1>
        </div>

        <table class="table table-bordered" id="changeinfo">
            <tr>
                <th>아이디</th>
                <td>hong</td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password">
                    <label><input type="checkbox">비밀번호 변경</label>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>1999년 9월 9일</td>
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td><input type="text" value="010-1234-5678"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" value="hong@test.com"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="button" class="btn btn-basic" value="우편번호 찾기">
                    <input type="text">
                    <p><input type="text" placeholder="상세 주소 입력"></p>
                </td>
            </tr>
        </table>


        <div class="btns btn-group">
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-ok"></span> 수정하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/sybang/member/myinfo.do'">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
        </div>

    </div>
    <!-- info-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>