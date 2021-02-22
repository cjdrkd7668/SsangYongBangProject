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

@WebServlet("/member/loginok.do")
public class LoginOk extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto.setEmail(email);
		dto.setPw(pw);
		
		int result = dao.login(dto);
		
		//로그인 성공 시
		if (result == 1) {
			
			HttpSession session = req.getSession();
			
			session.setAttribute("email", dto.getEmail());
			
			MemberDTO gdto = dao.getMember(email);
			
			session.setAttribute("seq", gdto.getSeq());
			session.setAttribute("name", gdto.getName());
			
			resp.sendRedirect("/sybang/index.do");
			
		} else {
			//로그인 실패 시
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
	}
}