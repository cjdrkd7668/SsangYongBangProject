<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/sybang/css/mypage.css">
<style>
</style>
</head>

<body>

	<!-- header 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

<!-- list-container 시작 -->
    <div class="list-container">
        <div class="page-header">
            <h1>내 정보 관리</h1>
            <hr>
            <div class="myinfo-container well">
                <table class="table" id="myinfo">
                    <tr>
                        <td rowspan="2"><img src="/sybang/images/man_02.png" height="100px;"></td>
                        <td style="font-size: 1.3em;">hong</td>
                        <td rowspan="2"><a href="/sybang/member/changeinfo.do" class="btn btn-default" value=""
                            style="font-size: 1.1em; text-align: center; margin-top: 25px;">내 정보 수정</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            총 게시물&nbsp;&nbsp;<b>5개</b>
                            / 총 댓글&nbsp;&nbsp;<b>10개</b>
                        </td>
                    </tr>
                </table>

            </div>
        </div>

        <ul class="nav nav-tabs" style="clear: both;">
            <li class="active"><a data-toggle="tab" href="#writepost">내가 쓴 글</a></li>
            <li><a data-toggle="tab" href="#writecomment">내가 쓴 댓글</a></li>
            <li><a data-toggle="tab" href="#writereview">내 후기/평점</a></li>
        </ul>

        <!-- tab-content 시작 -->
        <div class="tab-content">

            <!-- 내가 쓴 글 시작 -->
            <div class="tab-pane fade in active" id="writepost">
                <table class="table table-condensed" id="tbl-post">
                    <div id="btn-post">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-ok"></span> 전체 선택
                        </button>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span> 삭제
                        </button>
                    </div>
                    <div style="clear: both;"></div>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="post-title">제목입니다.&nbsp;<span class="badge"
                                    style="background-color: red;">N</span></div>
                            <div class="post-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글
                                내용입니다.글 내용입니다.글 내용입니다.</div>
                            <div class="post-type">게시판 : 자유게시판</div>
                        </td>
                        <td>
                            <div class="post-date">2021-02-18</div>
                        </td>
                        <td>
                            <div class="post-readcount">0</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="post-title">제목입니다.&nbsp;<span class="badge"
                                    style="background-color: red;">N</span></div>
                            <div class="post-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.</div>
                            <div class="post-type">게시판 : 자유게시판</div>
                        </td>
                        <td>
                            <div class="post-date">2021-02-18</div>
                        </td>
                        <td>
                            <div class="post-readcount">0</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="post-title">제목입니다.&nbsp;</div>
                            <div class="post-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.</div>
                            <div class="post-type">게시판 : 자유게시판</div>
                        </td>
                        <td>
                            <div class="post-date">2021-02-18</div>
                        </td>
                        <td>
                            <div class="post-readcount">0</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="post-title">제목입니다.&nbsp;</div>
                            <div class="post-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.</div>
                            <div class="post-type">게시판 : 자유게시판</div>
                        </td>
                        <td>
                            <div class="post-date">2021-02-18</div>
                        </td>
                        <td>
                            <div class="post-readcount">0</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="post-title">제목입니다.&nbsp;</div>
                            <div class="post-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.</div>
                            <div class="post-type">게시판 : 자유게시판</div>
                        </td>
                        <td>
                            <div class="post-date">2021-02-18</div>
                        </td>
                        <td>
                            <div class="post-readcount">0</div>
                        </td>
                    </tr>
                </table>

                <!-- page-bar 시작 -->
                <nav class="page-bar">
                    <ul class="pagination">
                        <li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        <li class="active"><a href="#!">1</a></li>
                        <li><a href="#!">2</a></li>
                        <li><a href="#!">3</a></li>
                        <li><a href="#!">4</a></li>
                        <li><a href="#!">5</a></li>
                        <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                    </ul>
                </nav>
                <!-- page-bar 끝 -->
            </div>
            <!-- 내가 쓴 글 끝 -->

            <!-- 내가 쓴 댓글 시작 -->
            <div class="tab-pane fade" id="writecomment">
                <table class="table table-condensed" id="tbl-comment">
                    <div id="btn-comment">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-ok"></span> 전체 선택
                        </button>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span> 삭제
                        </button>
                    </div>
                    <div style="clear: both;"></div>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="cmt-date">2021-02-18&nbsp;<span class="badge"
                                    style="background-color: red;">N</span></div>
                            <div class="cmt-content">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글
                                내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</div>
                            <div class="cmt-title">원문 제목 : 제목입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="cmt-date">2021-02-18&nbsp;<span class="badge"
                                    style="background-color: red;">N</span></div>
                            <div class="cmt-content">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.
                            </div>
                            <div class="cmt-title">원문 제목 : 제목입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="cmt-date">2021-02-18&nbsp;</div>
                            <div class="cmt-content">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.
                            </div>
                            <div class="cmt-title">원문 제목 : 제목입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="cmt-date">2021-02-18&nbsp;</div>
                            <div class="cmt-content">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.
                            </div>
                            <div class="cmt-title">원문 제목 : 제목입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="cmt-date">2021-02-18&nbsp;</div>
                            <div class="cmt-content">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.
                            </div>
                            <div class="cmt-title">원문 제목 : 제목입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="cmt-date">2021-02-18&nbsp;</div>
                            <div class="cmt-content">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.
                            </div>
                            <div class="cmt-title">원문 제목 : 제목입니다.</div>
                        </td>
                    </tr>
                </table>
                <!-- page-bar 시작 -->
                <nav class="page-bar">
                    <ul class="pagination">
                        <li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        <li class="active"><a href="#!">1</a></li>
                        <li><a href="#!">2</a></li>
                        <li><a href="#!">3</a></li>
                        <li><a href="#!">4</a></li>
                        <li><a href="#!">5</a></li>
                        <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                    </ul>
                </nav>
                <!-- page-bar 끝 -->
            </div>
            <!-- 내가 쓴 댓글 끝 -->

            <!-- 내 후기 시작 -->
            <div class="tab-pane" id="writereview">
                <table class="table table-condensed" id="tbl-review">
                    <div id="btn-review">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-ok"></span> 전체 선택
                        </button>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span> 삭제
                        </button>
                    </div>
                    <div style="clear: both;"></div>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="review-title">제목입니다.&nbsp;<span class="badge"
                                    style="background-color: red;">N</span></div>
                            <div class="review-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글
                                내용입니다.글 내용입니다.글 내용입니다.</div>
                        </td>
                        <td>
                            <div class="review-date">2021-02-18</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="review-title">제목입니다.&nbsp;</div>
                            <div class="review-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글
                                내용입니다.글 내용입니다.글 내용입니다.</div>
                        </td>
                        <td>
                            <div class="review-date">2021-02-18</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="review-title">제목입니다.&nbsp;</div>
                            <div class="review-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글
                                내용입니다.글 내용입니다.글 내용입니다.</div>
                        </td>
                        <td>
                            <div class="review-date">2021-02-18</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="review-title">제목입니다.&nbsp;</div>
                            <div class="review-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글
                                내용입니다.글 내용입니다.글 내용입니다.</div>
                        </td>
                        <td>
                            <div class="review-date">2021-02-18</div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>
                            <div class="review-title">제목입니다.&nbsp;</div>
                            <div class="review-content">글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글 내용입니다.글
                                내용입니다.글 내용입니다.글 내용입니다.</div>
                        </td>
                        <td>
                            <div class="review-date">2021-02-18</div>
                        </td>
                    </tr>
                </table>

                <!-- page-bar 시작 -->
                <nav class="page-bar">
                    <ul class="pagination">
                        <li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        <li class="active"><a href="#!">1</a></li>
                        <li><a href="#!">2</a></li>
                        <li><a href="#!">3</a></li>
                        <li><a href="#!">4</a></li>
                        <li><a href="#!">5</a></li>
                        <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                    </ul>
                </nav>
                <!-- page-bar 끝 -->
            </div>
            <!-- 내 후기 끝 -->

        </div>
        <!-- tab-content 끝 -->







    </div>
    <!-- list-container 끝 -->

	<!-- footer 가져오기######## -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>