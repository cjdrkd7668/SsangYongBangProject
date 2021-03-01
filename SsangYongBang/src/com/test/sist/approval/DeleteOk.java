package com.test.sist.approval;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/approval/deleteok.do")
public class DeleteOk extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String[] ctgAndSeq = request.getParameter("seq").split("_");
		
		String ctg = ctgAndSeq[0];
		String seq = ctgAndSeq[1];
		
		System.out.println(ctg + "무야" + seq);
		
		ApprovalDAO dao = new ApprovalDAO();
		
		int result = 0;
		
		if ((Integer)session.getAttribute("access") == 3) {
			
			if (ctg.equals("부동산 중개사")) {
				result = dao.deleteBroker(seq);
			} else {
				result = dao.deleteFirm(seq);				
			}
			
		}
		
		if (result != 0) {
			response.sendRedirect("/sybang/approval/boardlist.do");
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

