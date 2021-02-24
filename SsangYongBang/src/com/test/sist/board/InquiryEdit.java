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
@WebServlet("/board/inquiryedit.do")
public class InquiryEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = dao.detail(seq);
		
		HttpSession session = req.getSession();

		//작성자가 아닐 경우
		if (!dto.getAuthorseq().equals((String)session.getAttribute("seq"))) {
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");

			writer.close();
			return; // ***
		}
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/inquiryedit.jsp");
		dispatcher.forward(req, resp);
	}
}