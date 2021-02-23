package com.test.codestudy.inc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.codestudy.member.MemberDAO;

@WebServlet("/inc/header.do")
public class Header extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		//쪽지 상태
		//
		
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		
		int count = 0;
		
		if (session.getAttribute("id") != null) {
			count = dao.getCountMessage(session.getAttribute("seq").toString());
		}
		
		request.setAttribute("count", count);		
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/inc/header.jsp");
		dispatcher.include(request, response);
		
	}

}










