package com.test.sist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.member.chat.ChatDAO;
import com.test.sist.member.chat.ChatDTO;


@WebServlet("/index.do")
public class Index extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	  HashMap<String, String> map = new HashMap<String, String>();
	  
	  //검색어
	  String search = request.getParameter("search");
	  
	  //검색어 map에 저장
	  if (!(search == null || search.equals(""))) {
			map.put("search", search);
		}
	  
	  HttpSession session = request.getSession();
	  
	  ChatDAO dao = new ChatDAO();
	  
	  //중개사 목록을 가져온다
	  ArrayList<ChatDTO> blist = dao.blist();
	  
	  //공지사항 목록을 가져온다.
	  
	  
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
      dispatcher.forward(request, response);
      
   }

}

