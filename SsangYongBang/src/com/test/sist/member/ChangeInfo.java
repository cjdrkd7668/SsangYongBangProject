package com.test.sist.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/member/changeinfo.do")
public class ChangeInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember((String)session.getAttribute("email"));
		
		req.setAttribute("pw", dto.getPw());
		req.setAttribute("ssn", dto.getSsn());
		req.setAttribute("phone", dto.getPhone().substring(0, 3) + "-" + dto.getPhone().substring(3, 7) + "-" + dto.getPhone().substring(7, 11));
		req.setAttribute("address", dto.getAddress());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/changeinfo.jsp");
		dispatcher.forward(req, resp);
	}
}
