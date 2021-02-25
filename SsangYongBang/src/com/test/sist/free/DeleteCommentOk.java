package com.test.sist.free;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.free.dao.FreeCommentDAO;

@WebServlet("/free/deletecommentok.do")
public class DeleteCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//삭제하려는 댓글 번호
		String seq = req.getParameter("seq");
		
		//삭제하려는 댓글의 글 번호
		String frseq = req.getParameter("frseq");
		
		FreeCommentDAO dao = new FreeCommentDAO();
		
		//댓글 삭제
		int result = dao.del(seq);
		
		if (result == 1) {
			
			//삭제 성공 시
			resp.sendRedirect("/sybang/free/detail.do?seq=" + frseq);
		} else {
			
			//실패 시
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