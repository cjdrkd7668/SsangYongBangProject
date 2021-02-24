package com.test.sist.admin.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/review/deleteok.do")
public class DeleteOk extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String[] seqs = request.getParameter("seq").split("_");
		
		AdminReviewDAO dao = new AdminReviewDAO();
		
		int result = 0;
		
		if ((Integer)session.getAttribute("access") == 3) {
			result = dao.deleteReviewRequest(seqs);
		}
		
		if (result != 0) {
			response.sendRedirect("/sybang/admin/review/boardlist.do");
		} else {
			//삭제 실패
			PrintWriter writer = response.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('Deletion Failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		
		
	}

}
