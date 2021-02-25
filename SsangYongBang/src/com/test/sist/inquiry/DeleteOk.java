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

@WebServlet("/inquiry/deleteok.do")
public class DeleteOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		//삭제하려는 글 번호
		String seq = req.getParameter("seq");
		
		InquiryDAO dao = new InquiryDAO();
		
		//글 삭제
		int result = dao.del(seq);
		
		if (result == 1) {
			//성공 시 목록으로 이동
			resp.sendRedirect("/sybang/inquiry/list.do");
			
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