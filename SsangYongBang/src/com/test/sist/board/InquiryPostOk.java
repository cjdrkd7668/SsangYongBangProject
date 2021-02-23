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

@WebServlet("/board/inquirypostok.do")
public class InquiryPostOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String openflag = req.getParameter("openflag");
		String detail = req.getParameter("detail");
		
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = new InquiryDTO();
		
		dto.setAuthorseq((String)session.getAttribute("seq"));
		dto.setSubject(subject);
		dto.setOpenflag(openflag);
		dto.setDetail(detail);
		
		int result = dao.post(dto);
		
		if (result == 1) {
			
			//글쓰기 성공 시
			resp.sendRedirect("/sybang/board/inquirylist.do");
			
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