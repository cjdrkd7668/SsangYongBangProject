package com.test.sist.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.admin2.dto.AdminDTO;

@WebServlet("/broker/brokerMain.do")
public class BrokerMain extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	   //String email = "wowbudongsan@naver.com";
	   HttpSession session = request.getSession();
	   
	   
	   String email = (String) session.getAttribute("email");
	   //session.getAttribute("approBrokerSeq");
	   
	   //System.out.println("approBrokerSeq:"+session.getAttribute("approBrokerSeq"));
	   //System.out.println("email:"+session.getAttribute("email"));
	   
	   BrokerDAO dao= new BrokerDAO();
	   BrokerDTO bdto = dao.getBroker(email);
	   
	   
	   request.setAttribute("bdto", bdto);

	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/brokerMain.jsp");
      dispatcher.forward(request, response);
      
   }

}


