package com.test.codestudy.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logout.do")
public class Logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 로그 아웃 > 인증 티켓 제거
		//2. 시작 페이지로 이동
		
		//1.
		HttpSession session = request.getSession();
		
		//session.removeAttribute("id"); //로그아웃
		session.invalidate(); //세션 초기화
		
		//2.
		response.sendRedirect("/codestudy/index.do");
	}

}









