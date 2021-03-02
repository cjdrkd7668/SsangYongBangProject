package com.test.sist.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/withdrawok.do")
public class WithdrawOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.withdraw(seq);
		dao.close();
		
		HttpSession session = req.getSession();
		session.invalidate();

		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}
}
