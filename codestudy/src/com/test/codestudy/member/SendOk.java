package com.test.codestudy.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/sendok.do")
public class SendOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(content, mseq x n)
		//2. DB 작업 > insert
		//3. 결과 처리
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String content = req.getParameter("content");
		String[] mseq = req.getParameterValues("mseq"); //체크 박스들..
		
		//2.
		MemberDAO dao = new MemberDAO();
		MessageDTO dto = new MessageDTO();
		
		HttpSession session = req.getSession();
		
		dto.setContent(content);
		dto.setRmseq(mseq); //받는 회원들
		dto.setSmseq(session.getAttribute("seq").toString()); //보내는 회원(나)
		
		int result = dao.send(dto);
		
		//3.
		if (result == mseq.length) {
			resp.sendRedirect("/codestudy/member/message.do");
		} else {
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














