package com.test.sist.inquiry;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.inquiry.dao.InquiryCommentDAO;
import com.test.sist.inquiry.dto.InquiryCommentDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/inquiry/commentok.do")
public class CommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		//글 번호
		String iqrseq = req.getParameter("iqrseq");
		
		//댓글 내용
		String detail = req.getParameter("detail");
		
		InquiryCommentDAO dao = new InquiryCommentDAO();
		InquiryCommentDTO dto = new InquiryCommentDTO();
		
		dto.setIqrseq(iqrseq);
		dto.setDetail(detail);
		dto.setAdmseq(session.getAttribute("adminSeq").toString());
		
		//댓글 작성
		int result = dao.post(dto);
		
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