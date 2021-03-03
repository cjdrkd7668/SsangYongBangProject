package com.test.sist.house;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.house.dao.HouseDAO;

@WebServlet("/house/detail.do")
public class Detail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//매물게시판 글 번호
		String seq = req.getParameter("seq"); 
		
		//매물게시판 페이지
		String page = req.getParameter("page"); 
		
		HouseDAO dao = new HouseDAO();
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/house/detail.jsp");
		dispatcher.forward(req, resp);
	}
}