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

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/board/inquiryeditok.do")
public class InquiryEditOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq"); //글 번호
		String subject = req.getParameter("subject");
		String detail = req.getParameter("detail");
		
		//TODO /* openflag 안 받았다 */
		
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = new InquiryDTO();
		
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setDetail(detail);
		
		//글 수정하기
		int result = dao.edit(dto);
		
		if (result == 1) {
			
			//수정 성공 시 수정한 글로
			resp.sendRedirect("/sybang/board/inquirydetail.do?seq=" + seq);
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
