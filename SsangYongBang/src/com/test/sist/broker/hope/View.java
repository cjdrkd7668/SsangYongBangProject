package com.test.sist.broker.hope;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/broker/hope/view.do")
public class View extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   
	   //1.
	   String seq = request.getParameter("seq");
	   
	   
	   //2.
	   HopeDAO dao = new HopeDAO();
	   
	   HopeDTO dto = dao.get(seq);
	  
	 
	   //개행 문자 출력하기
	   dto.setContent(dto.getContent().replace("\r\n", "<br>"));
	  
	   //3.
	   request.setAttribute("dto", dto);
	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/hope/view.jsp");
      dispatcher.forward(request, response);
      
   }

}


