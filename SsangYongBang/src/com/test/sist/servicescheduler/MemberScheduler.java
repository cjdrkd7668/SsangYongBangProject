package com.test.sist.servicescheduler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servicescheduler/memberscheduler.do")
public class MemberScheduler extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   //1. DB작업 -> select 
	   //2. 결과 + JSP 호출하기
	   
	   //SchedulerDAO dao = new SchedulerDAO();
	   //ArrayList<SchedulerDTO> list = dao.
	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/servicescheduler/memberscheduler.jsp");
      dispatcher.forward(request, response);
      
   }

}