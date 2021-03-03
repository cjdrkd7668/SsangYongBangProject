package com.test.sist.inquiry;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.inquiry.dao.InquiryDAO;
import com.test.sist.inquiry.dto.InquiryDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/inquiry/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = dao.detail(seq);
		
		HttpSession session = req.getSession();
		
		if (!session.getAttribute("authorseq").toString().equals(dto.getAuthorseq())) {
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
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/inquiry/edit.jsp");
		dispatcher.forward(req, resp);
	}
}