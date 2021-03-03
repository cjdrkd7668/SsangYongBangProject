package com.test.sist.broker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/broker/brokerdata.do")
public class BrokerData extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.
		String email = request.getParameter("email");
				
		//2.
		BrokerDAO dao  = new BrokerDAO();
		
		int result = dao.checkEmail(email);
		
		//3. 결과반환
		PrintWriter writer = response.getWriter();
		
		writer.print(result);
		
		writer.close();
				
				
		
	}

}
