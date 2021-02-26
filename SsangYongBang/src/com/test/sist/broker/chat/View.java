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
	   
	   
	   //1.
	   String seq = request.getParameter("seq");
	   
	   
	   //2.
	   ChatDAO dao = new ChatDAO();
	   
	   ChatDTO dto = dao.get(seq);
	  
	   //날짜 뒤 시간 자르기
	   dto.setRegDate(dto.getRegDate().substring(0, 10));
		  
	   //개행 문자 출력하기
	   dto.setContent(dto.getContent().replace("\r\n", "<br>"));
	  
	   //3.
	   request.setAttribute("dto", dto);
	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/chat/view.jsp");
      dispatcher.forward(request, response);
      
   }

}


