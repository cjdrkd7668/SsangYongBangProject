package com.test.sist.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/freedeletecommentok.do")
public class FreeDeleteCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq"); // 댓글 번호
		String frseq = req.getParameter("frseq"); // 글 번호

		FreeCommentDAO dao = new FreeCommentDAO();

		// 댓글 삭제
		int result = dao.del(seq);

		if (result == 1) {

			// 댓글 삭제 성공 시
			resp.sendRedirect("/sybang/board/freedetail.do?seq=" + frseq);
		
		} else {
			
			//댓글 삭제 실패 시
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
