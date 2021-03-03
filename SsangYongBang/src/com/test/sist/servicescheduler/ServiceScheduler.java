package com.test.sist.servicescheduler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 이 클래스는 서비스 업체의 일정관리 servlet이다. 풀캘린더 라이브러리를 활용했다.
 * @see <a href="https://fullcalendar.io/">fullcalendar 공식 Docs</a>
 * @author 김소리
 *
 */

@WebServlet("/servicescheduler/servicescheduler.do")
public class ServiceScheduler extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   //1. DB작업 -> select 
	   //2. 결과 + JSP 호출하기
	   
	   //SchedulerDAO dao = new SchedulerDAO();
	   //ArrayList<SchedulerDTO> list = dao.
	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/servicescheduler/servicescheduler2.jsp");
      dispatcher.forward(request, response);
      
   }

}