package com.test.sist.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 중개사가 로그인하기 위한 클래스입니다.
 * @author 황원준
 *
 */
@WebServlet("/broker/auth.do")
public class Auth extends HttpServlet {
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
	      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/auth.jsp");
	      dispatcher.forward(request, response);
	      
	   }

}
