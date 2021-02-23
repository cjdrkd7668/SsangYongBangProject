package com.test.codestudy.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/send.do")
public class Send extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. DB 작업 + select
		//2. 결과 + JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//1.
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> mlist = dao.listMember(session.getAttribute("seq").toString()); //나 빼고 나머지 모든 사람 가져오기
		
		//2.
		req.setAttribute("mlist", mlist);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/send.jsp");
		dispatcher.forward(req, resp);

	}

}







