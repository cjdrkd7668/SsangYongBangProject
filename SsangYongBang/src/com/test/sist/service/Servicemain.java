package com.test.sist.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 이 클래스는 서비스업체의 main 홈 servlet 클래스이다.
 * @author kimsolee
 *
 * */

@WebServlet("/service/servicemain.do")
public class Servicemain extends HttpServlet {
	
	
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/service/servicemain.jsp");
      dispatcher.forward(request, response);
      
   }

}

