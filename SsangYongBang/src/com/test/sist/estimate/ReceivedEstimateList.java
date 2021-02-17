package com.test.sist.estimate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/estimate/receivedestimatelist.do")
public class ReceivedEstimateList extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/estimate/receivedestimatelist.jsp");
      dispatcher.forward(request, response);
      
   }

}






