<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Review</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/review.css">

<style>

</style>
</head>

<body>

	<!-- ########## 상단 헤더 시작 -->
	<%
		out.flush();
	    RequestDispatcher dheader = request.getRequestDispatcher("/inc/header.do");
	    dheader.include(request, response);
	%>
	<!-- ########## 상단 헤더 끝 -->


	<!-- ########## 본문 시작 -->
	<div class="main">

		<!-- ########## 좌측 시작 -->
		<div class="menu col-sm-12 col-md-3">
			<!-- ########## 메뉴 시작 -->
			<%
				out.flush();
			    RequestDispatcher dmenu = request.getRequestDispatcher("/inc/menu.do");
				dmenu.include(request, response);
			%>
			<!-- ########## 메뉴 끝 -->

			<!-- ########## 인증 시작 -->
			<%
				out.flush();
			    RequestDispatcher dauth = request.getRequestDispatcher("/inc/auth.do");
			    dauth.include(request, response);
			%>
			<!-- ########## 인증 끝 -->

			<!-- ########## 채팅 시작 -->
			<%
				out.flush();
			    RequestDispatcher dchat = request.getRequestDispatcher("/inc/chat.do");
				dchat.include(request, response);
			%>
			<!-- ########## 채팅 끝 -->
		</div>
		<!-- ########## 좌측 끝 -->



		<!-- ########## 내용 시작 -->
		<div class="content col-sm-12 col-md-9">
			<div>
				<h1>코드 리뷰 <small>Review</small></h1>
                
                <table class="table write">
                    <tr>
                        <td>
                            <input type="text" class="form-control" placeholder="subject" id="subject">
                        </td>
                    </tr>
                    <tr>
                        <td id="content">
                            <textarea class="form-control" id="code" placeholder="code">package com.test.array;

import java.util.Arrays;

public class Ex15_Array_question {
    
    public static void main(String[] args) {
        
        //q007();
        //q008();
        q009();
        
    }

    private static void q007() {

        //중복값 제거 난수
        int[] nums = new int[5];
        
        //난수 생성 -> (중복 체크) -> 배열 대입
        
        for (int i=0; i&lt;nums.length; i++) {
            
            int n = (int)(Math.random() * 10) + 1; //1~10
            
            if (!duplicate(i, n, nums)) {
                nums[i] = n;
            } else {
                i--;
            }
            
        }//for
        
        System.out.println(Arrays.toString(nums));
        
    }
    
    public static boolean duplicate(int i, int n, int[] nums) {
        
        boolean duplicate = false;
        
        for (int j=0; j&lt;i; j++) {
            if (nums[j] == n) {
                duplicate = true;
                break;
            }
        }
        
        return duplicate;
        
    }

    private static void q008() {

        //배열 삽입(우측 시프트 -> Right Shift)
        String[] color = { "빨강", "노랑", "파랑", "검정", "하양", "초록", "보라" };
        System.out.println(Arrays.toString(color));
        
        String newColor = "주황";
        int insertIndex = 2;
        
        //기존의 요소들을 우측으로 옮긴다 -> 빈방 발생 -> 새 요소를 삽입
        for (int i=color.length-2; i>=insertIndex; i--) { //********
            
            color[i+1] = color[i];
            System.out.println(Arrays.toString(color));
            
        }
        
        color[insertIndex] = newColor; //삽입
        System.out.println(Arrays.toString(color));
        
        
        
        
    }

    private static void q009() {

        //배열 삭제
        String[] color = { "빨강", "노랑", "파랑", "검정", "하양", "초록", "보라" };
        System.out.println(Arrays.toString(color));
        
        int deleteIndex = 2;
        
        for (int i=deleteIndex; i&lt;color.length-1; i++) {
            
            color[i] = color[i+1];
            System.out.println(Arrays.toString(color));
            
        }
        
        color[color.length-1] = "";
        System.out.println(Arrays.toString(color));
        
    }

}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" min="1" class="linenumber form-control">
                            -
                            <input type="number" min="1" class="linenumber form-control">
                            <input type="text" class="linecomment form-control" placeholder="comment">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" min="1" class="linenumber form-control">
                            -
                            <input type="number" min="1" class="linenumber form-control">
                            <input type="text" class="linecomment form-control" placeholder="comment">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" min="1" class="linenumber form-control">
                            -
                            <input type="number" min="1" class="linenumber form-control">
                            <input type="text" class="linecomment form-control" placeholder="comment">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" min="1" class="linenumber form-control">
                            -
                            <input type="number" min="1" class="linenumber form-control">
                            <input type="text" class="linecomment form-control" placeholder="comment">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" min="1" class="linenumber form-control">
                            -
                            <input type="number" min="1" class="linenumber form-control">
                            <input type="text" class="linecomment form-control" placeholder="comment">
                        </td>
                    </tr>
                </table>


                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/review/list.do';">
                        <span class="glyphicon glyphicon-chevron-left"></span>
						뒤로
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/review/writeok.do';">
                        <span class="glyphicon glyphicon-plus"></span>
						쓰기
                    </button>
                </div>
                <div style="clear:both;"></div>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
	
		$("textarea").linenumbers();
		
	    $("#content textarea").eq(0).css({
	        "padding-top": "5px",
	        "line-height": "21px",
	        "padding-left": "40px"
	    });
	    
    </script>
</body>

</html>