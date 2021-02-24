package com.test.sist.broker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/broker/editok.do")
public class EditOk extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//인코딩 맞추기
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//수정할 내용 가져오기
		HttpSession session = request.getSession();
		String brkEmail = (String)session.getAttribute("email");
		
		String brkpw = request.getParameter("brkPw");
		String brkBusinessName = request.getParameter("brkBusinessName");
		String brkAddress = request.getParameter("brkAddress");
		String brkTel = request.getParameter("brkTel");
		
		//수정하기
		BrokerDAO dao = new BrokerDAO();
		
		int result = dao.updateBroker(brkEmail, brkpw, brkBusinessName, brkAddress, brkTel);
		
		
		if (result == 1) {
			//성공
			response.sendRedirect("/sybang/broker/brokerMain.do");
		} else {
			//실패
			PrintWriter writer = response.getWriter();
			  
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('Edit fail');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}

	}

}
