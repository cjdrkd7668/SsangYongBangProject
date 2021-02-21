package com.test.sist.broker.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/broker/chat/view.do")
public class View extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/chat/view.jsp");
      dispatcher.forward(request, response);
      
   }

}


