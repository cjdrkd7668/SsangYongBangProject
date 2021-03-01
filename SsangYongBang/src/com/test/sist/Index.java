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

import com.test.sist.free.dao.FreeDAO;
import com.test.sist.free.dto.FreeDTO;


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
	  
	  FreeDAO dao = new FreeDAO();
	  //인기글 가져오기
	  ArrayList<FreeDTO> plist = dao.popular();

	  // 제목 길이 수정
	  for (FreeDTO dto : plist) {

		  if (dto.getSubject().length() > 25) {
			  dto.setSubject(dto.getSubject().substring(0, 25) + "...");
			  }
		  }
	  
	  //최신글 가져오기
	  ArrayList<FreeDTO> llist = dao.latest();
	  
	  // 제목 길이 수정
	  for (FreeDTO dto : llist) {

		  if (dto.getSubject().length() > 25) {
			  dto.setSubject(dto.getSubject().substring(0, 25) + "...");
			  }
		  }
	  
		
		
		request.setAttribute("plist", plist);
		request.setAttribute("llist", llist);
		request.setAttribute("search", search);
	  
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
      dispatcher.forward(request, response);
      
   }

}

