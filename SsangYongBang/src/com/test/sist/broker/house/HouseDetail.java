package com.test.sist.broker.house;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.room.RoomDAO;
import com.test.sist.room.RoomDTO;

@WebServlet("/broker/house/housedetail.do")
public class HouseDetail extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   //글 번호, 돌아갈 페이지 가져오기
 		String seq = request.getParameter("seq");
 		String nowPage = request.getParameter("nowPage");
 		
 		//특정 글 정보 가져오기
 		HouseDAO dao = new HouseDAO();
 		HouseDTO hdto = dao.getHouse(seq);
 		
 		//글 정보 전달
 		request.setAttribute("hdto", hdto);
 		request.setAttribute("nowPage", nowPage);
	   
	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/house/housedetail.jsp");
      dispatcher.forward(request, response);
      
   }

}