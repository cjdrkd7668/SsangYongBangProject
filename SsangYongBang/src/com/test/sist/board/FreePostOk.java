package com.test.sist.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/freepostok.do")
public class FreePostOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String detail = req.getParameter("detail");

		FreeDAO dao = new FreeDAO();
		FreeDTO dto = new FreeDTO();
		
		dto.setAuthorseq((String)session.getAttribute("seq")); //로그인 한 회원 번호
		dto.setSubject(subject);
		dto.setDetail(detail);
		
		//글쓰기
		int result = dao.post(dto);
		
		if (result == 1) {
			
			//글쓰기 성공 시
			resp.sendRedirect("/sybang/board/freelist.do");
			
		} else {
			
			//글쓰기 실패 시
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