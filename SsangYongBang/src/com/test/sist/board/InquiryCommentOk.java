package com.test.sist.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/inquirycommentok.do")
public class InquiryCommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8"
				);
		
		//게시글 번호
		String iqrseq = req.getParameter("iqrseq");
		String detail = req.getParameter("detail");
		
		InquiryCommentDAO dao =  new InquiryCommentDAO();
		InquiryCommentDTO dto = new InquiryCommentDTO();
		
		dto.setIqrseq(iqrseq);
		dto.setDetail(detail);
		//관리자 번호
		dto.setAdmseq((String)session.getAttribute("seq"));
		
		//댓글 작성
		int result = dao.post(dto);
		
		if (result == 1) {
			// 댓글 작성 성공 시 -> 보고 있던 게시글로 이동
			resp.sendRedirect("/sybang/board/inquirydetail.do?seq=" + iqrseq);
			
		} else {
			// 댓글 작성 실패 시
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