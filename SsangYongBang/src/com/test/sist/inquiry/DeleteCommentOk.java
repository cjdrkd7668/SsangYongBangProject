package com.test.sist.inquiry;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.inquiry.dao.InquiryCommentDAO;

/**
 * DeleteCommentOk. 문의게시판의 댓글 삭제를 위한 서블릿입니다.
 * @author 이찬미
 *
 */
@WebServlet("/inquiry/deletecommentok.do")
public class DeleteCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//삭제하려는 댓글 번호
		String seq = req.getParameter("seq");
		
		//삭제하려는 댓글의 글 번호
		String iqrseq = req.getParameter("iqrseq");
		
		InquiryCommentDAO dao = new InquiryCommentDAO();
		
		//댓글 삭제
		int result = dao.del(seq);
		
		if (result == 1) {
			
			//성공 시 보고 있던 게시글로 이동
			resp.sendRedirect("/sybang/inquiry/detail.do?seq=" + iqrseq);
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