package com.test.sist.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/inquirydeleteok.do")
public class InquiryDeleteOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq"); //삭제하려는 글 번호
		InquiryDAO dao = new InquiryDAO();
		
		int result = dao.del(seq);
		
		if (result == 1) {
			
			//삭제 성공 시 -> 목록으로
			resp.sendRedirect("/sybang/board/inquirylist.do");
			
		} else {
			
			//삭제 실패 시
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
