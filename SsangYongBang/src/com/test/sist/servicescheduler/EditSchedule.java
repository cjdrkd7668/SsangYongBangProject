package com.test.sist.servicescheduler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servicescheduler/editschedule.do")
public class EditSchedule extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/servicescheduler/editschedule.jsp");
      dispatcher.forward(request, response);
      
   }

}