package com.test.sist.broker.review;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/broker/review/deleteOk.do")
public class DeleteOk extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");

		String seq = (String)session.getAttribute("approBrokerSeq"); //중개사 번호
		String requestContent = request.getParameter("requestContent"); //요청 내용
		String reviewSeq = request.getParameter("reviewSeq"); //후기 게시글 번호
		
		ReviewDAO dao = new ReviewDAO();
				
		int result = dao.deleteReview(seq, requestContent, reviewSeq);
			
		
		if (result == 1) {
			//성공
			response.sendRedirect("/sybang/broker/review/reviewlist.do");
		} else {
			//실패
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			
			writer.print("<html><head><meta charset='utf-8'></head><body>");
			writer.print("<script>");
			writer.print("alert('삭제 요청에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		
	}

}
