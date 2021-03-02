package com.test.sist.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/notice/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//글 번호
		String seq = req.getParameter("seq");
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.detail(seq);
		
		HttpSession session = req.getSession();
		
		if (!session.getAttribute("adminSeq").toString().equals(dto.getAdminseq())) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('잘못된 접근입니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
			return;
		}

		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/edit.jsp");
		dispatcher.forward(req, resp);
	}
}