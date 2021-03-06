package com.test.sist.admin2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.admin2.dao.AllMemberDAO;
import com.test.sist.admin2.dto.MemberDTO;

@WebServlet("/admin2/member_detail_N.do")
public class Member_detail_N extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		AllMemberDAO dao = new AllMemberDAO();
		MemberDTO dto = dao.getMemberInfo(seq);
		
		req.setAttribute("dto",dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/member_detail_N.jsp");
		dispatcher.forward(req, resp);
	}
}