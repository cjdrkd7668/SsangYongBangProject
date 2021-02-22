package com.test.sist.inc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.member.MemberDAO;

@WebServlet("/inc/header.do")
public class Header extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/inc/header.jsp");
		dispatcher.forward(request, response);
		
	}

}
