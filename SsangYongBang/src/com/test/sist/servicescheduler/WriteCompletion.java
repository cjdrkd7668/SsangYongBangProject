package com.test.sist.servicescheduler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servicescheduler/writecompletion.do")
public class WriteCompletion extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String estimate1thSeq = req.getParameter("estimate1thSeq"); //견적서 번호
		
		
		HttpSession session = req.getSession();
		//승인된 업체 계정으로 로그인한 게 아니라면
		String approvalFSeq = (String) session.getAttribute("approvalFSeq");
		
		if ( approvalFSeq.equals("") ) {
			
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
		
		
		req.setAttribute("estimate1thSeq", estimate1thSeq); //견적서 번호 보내기
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicescheduler/writecompletion.jsp");
		dispatcher.forward(req, resp);
	}

}

