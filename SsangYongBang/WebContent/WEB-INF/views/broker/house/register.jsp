<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중개사 공간</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" type="text/css" href="/sybang/css/broker.css">
<link rel="stylesheet" type="text/css" href="/sybang/css/brokerregister.css">

<style>
    
</style>


</head>
<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>
	<%@include file="/WEB-INF/views/inc/broker_left.jsp"%>


    <div class="container">
        <h1>매물 등록하기</h1>
        <hr>

        <form method="POST" action="">

            <table class="table table-bordered" id="sort">
                <tr>
                    <th colspan="2" class="thhead" style="line-height: 43px;">매물종류</th>

                </tr>
                <tr>
                    <td class="leftsort"><span style="position: relative; top: 15px">건물 유형</span></td>
                    <td>    
                        <div style="position: relative; top: 15px">
                        <label class="radio-inline"><input type="radio" name="apt">아파트</label> 
                        <label class="radio-inline"><input type="radio" name="house">빌라</label> 
                        <label class="radio-inline"><input type="radio" name="villa">주택</label> 
                        <label class="radio-inline"><input type="radio" name="tworoom">투룸</label> 
                        <label class="radio-inline"><input type="radio" name="officetel">오피스텔</label>
                         </div>
                    </td>
                </tr>
                <tr>
                    <td class="leftsort"><span style="position: relative; top: 15px">매물 거래 유형</span></td>
                    <td>
                        <div style="position: relative; top: 15px">
                        <label class="radio-inline"><input type="radio" name="buy">매매</label> 
                        <label class="radio-inline"><input type="radio" name="jeonse">전세</label> 
                        <label class="radio-inline"><input type="radio" name="rent">월세</label>
                     </div>    
                    </td>

                </tr>
            </table>

            <table class="table table-bordered" id="location">
                <tr>
                    <th colspan="3" class="thhead" style="line-height: 43px;">위치정보</th>

                </tr>
                <tr>

                    <td class="leftaddress"><span  style="position: relative; top: 120px">주소</span></td>
                    <td>
                        <div style="margin-left: 10px; margin-top: 10px">
                            <button type="button" class="btn btn-default btn-search">주소검색</button>
                            <input type="text" id="searchaddress" style="width: 425px;">
                            <p>
                                <input type="text" placeholder="상세주소"
                                    style="width: 513px; margin-top: 20px; margin-bottom: 10px;">
                            </p>
                            <p>
                            <div class="detail"></div>
                            </p>
                        </div>
                    </td>
                    <td>
                        <div id="map"
                            style="width: 270px; height: 270px; border: 1px solid black; margin-left: 20px;">
                        </div>
                    </td>
                </tr>
            </table>

            <table class="table table-bordered" id="info">
                <tr>
                    <th colspan="4" class="thhead" style="line-height: 43px;">기본 정보</th>
                </tr>
                <tr>
                    <td class="leftsort" rowspan="2"><span style="position: relative; top: 25px">건물 크기</span></td>
                    <td>공급 면적&nbsp;&nbsp;&nbsp;&nbsp;<input type="text">&nbsp;㎡
                    </td>
                    <td class="leftsort" rowspan="2"><span style="position: relative; top: 25px">건물 층수</span></td>
                    <td>건물 층수&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 50px; text-align: center;"
                            id="building_floor">&nbsp;층
                    </td>
                </tr>
                <tr>
                    <td>전용 면적&nbsp;&nbsp;&nbsp;&nbsp;<input type="text">&nbsp;㎡
                    </td>
                    <td>해당 층수&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 50px; text-align: center;"
                            id="floor">&nbsp;층
                    </td>
                </tr>
                <tr>
                    <td class="leftsort"><span style="position: relative; top: 15px">방 개수</span></td>
                    <td>
                        <div style="position: relative; top: 6px">
                        <select class="form-control" id="roomcount">
                            <option value="">선택하세요.</option>
                            <option value="1">1개</option>
                            <option value="2">2개</option>
                            <option value="3">3개</option>
                            <option value="4">4개</option>
                            <option value="5">5개</option>
                            <option value="6">6개</option>
                            <option value="7">7개</option>
                            <option value="8">8개</option>
                            <option value="9">9개</option>
                            <option value="10">10개</option>
                        </select>
                        </div>
                    </td>
                    <td class="leftsort"><span style="position: relative; top: 15px">욕실 개수</span></td>
                    <td> 
                        <div style="position: relative; top: 6px">
                        <select class="form-control" id="washroom">
                            <option value="">선택하세요.</option>
                            <option value="1">1개</option>
                            <option value="2">2개</option>
                            <option value="3">3개</option>
                            <option value="4">4개</option>
                            <option value="5">5개</option>
                            <option value="6">6개</option>
                            <option value="7">7개</option>
                            <option value="8">8개</option>
                            <option value="9">9개</option>
                            <option value="10">10개</option>
                        </select>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="leftsort"><span style="position: relative; top: 15px">방향</span></td>
                    <td>
                        <div style="position: relative; top: 6px">
                        <select class="form-control" id="direction">
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
                    <td class="leftsort"><span style="position: relative; top: 15px">준공년도</span></td>
                    <td>
                        <div class="form-group" style="position: relative; top: 6px">
                            <select class="form-control" id="year">
                                <option>선택하세요.</option>
                            </select>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="info2"><span style="position: relative; top: 7px">주차 가능 여부</span></td>
                    <td>
                        <span style="position: relative; top: 5px">
                        <label class="radio-inline"><input type="radio" name="ok">가능</label> 
                        <label class="radio-inline"><input type="radio" name="no">없음</label>
                        </span>
                    </td>
                    <td class="info2">
                        <span style="position: relative; top: 7px">엘리베이터</span>
                    </td>
                    <td>
                        <span style="position: relative; top: 5px">
                        <label class="radio-inline"><input type="radio" name="ok">있음</label> 
                        <label class="radio-inline"><input type="radio" name="no">없음</label>
                     </span>
                    </td>
                </tr>
                <tr>
                    <td class="info2"><span style="position: relative; top: 7px">반려동물</span></td>
                    <td colspan="3">
                        <span style="position: relative; top: 5px">
                        <label class="radio-inline"><input type="radio" name="ok">가능</label>
                         <label class="radio-inline"><input type="radio" name="no">불가능</label>
                        </span>
                    </td>
                </tr>
            </table>


            <table class="table table-bordered" id="price">
                <tr>
                    <th colspan="2" class="thhead" style="line-height: 43px;">가격 정보</th>

                </tr>
                <tr>
                    <td class="priceinfo"><span style="position: relative; top: 3px">가격</span></td>
                    <td><input type="text" class="price">&nbsp;만원</td>
                </tr>
                <tr>
                    <td class="priceinfo"><span style="position: relative; top: 3px">월세</span></td>
                    <td><input type="text" class="price">&nbsp;만원</td>
                </tr>
                <tr>
                    <td class="priceinfo"><span style="position: relative; top: 3px">월 관리비</span></td>
                    <td><input type="text" class="price">&nbsp;만원</td>
                </tr>
            </table>


            <table class="table table-bordered" id="desc">
                <tr>
                    <th colspan="2" class="thhead" style="line-height: 43px;">상세 설명</th>

                </tr>
                <tr>
                    <td class="descinfo"><span style="position: relative; top: 12px">제목</span></td>
                    <td><input type="text" name="title" placeholder="예)신논현역 도보 5분거리, 혼자 살기 좋은 방 입니다." class="title">
                    </td>
                </tr>
                <tr>
                    <td class="detailinfo"><span style="position: relative; top: 105px">상세설명</span></td>
                    <td class=""><textarea name="memo" class="memo" placeholder="상세설명 작성 주의사항     
- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다. (홈페이지 주소, 블로그, SNS, 메신저ID, 전화번호, 이메일 등)
- 중개수수료를 언급한 내용은 입력할 수 없습니다. (중개수수료 무료, 꽁짜, 반값 등)

* 주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다."></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="regpic"><span style="position: relative; top: 100px">사진 등록</span></td>
                    <td>
                        <input type="file" class="form-control" style="margin-bottom: 10px;">
                        <input type="file" class="form-control" style="margin-bottom: 10px;">
                        <input type="file" class="form-control" style="margin-bottom: 10px;">
                        <input type="file" class="form-control" style="margin-bottom: 10px;">
                        <input type="file" class="form-control" style="margin-bottom: 10px;">
                    </td>
                </tr>
            </table>
			
			<div class ="btn-group">
				<button type="button" class="btn btn-default btn-cancle">
					<span class="glyphicon glyphicon-remove"></span> 취소하기
				</button>	
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-ok"></span> 등록하기
				</button> 
				
			</div>


        </form>
    </div>
	<script>
        var year = document.getElementById("year");

        for (var i = 1990; i <= 2021; i++) {

            year.innerHTML += "<option value='" + i + "'>" + i + "년</option>";
        }
    </script>

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>