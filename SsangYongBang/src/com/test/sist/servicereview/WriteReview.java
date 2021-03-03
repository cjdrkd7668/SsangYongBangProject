package com.test.sist.servicereview;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servicereview/writereview.do")
public class WriteReview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String completionSeq = req.getParameter("completionSeq"); //완료 번호
		
		
		HttpSession session = req.getSession();
		//로그인한 게 아니라면
		String memberSeq = (String) session.getAttribute("seq");
		
		if ( memberSeq.equals("") ) {
			
			//1. 내쫒기
			//response.sendRedirect("/codestudy/board/list.do");
			//return;
			
			//2. 경고(JavaScript) + 내쫒기
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("location.href='/codestudy/board/list.do';");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
			
			return;			
			
		}		
		
		
		req.setAttribute("completionSeq", completionSeq); //완료번호 보내기
		req.setAttribute("memberSeq", memberSeq); //번호 보내기
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicereview/writereview.jsp");
		dispatcher.forward(req, resp);
	}

}

