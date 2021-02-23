package com.test.sist.estimate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sybang/estimate/write.do")
public class Write extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String approvalFSeq = req.getParameter("approvalFSeq"); //업체승인번호
		String requestSeq = req.getParameter("requestSeq"); //고객요청서번호
		
		
		
		//업체승인번호 없으면 견적서 작성XX
		HttpSession session = req.getSession();
		
		if (session.getAttribute("id") == null || session.getAttribute("approval") == null) {
			
			
			//2. 경고(JavaScript) + 내쫒기
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("location.href='/sybang/service/servicemain.do';");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
			
			return;	
		} 
		
		
		req.setAttribute("approvalFSeq", approvalFSeq); //업체승인번호
		req.setAttribute("requestSeq", requestSeq); //고객요청서번호
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/estimate/writeok.jsp");
		dispatcher.forward(req, resp);
	}

}

