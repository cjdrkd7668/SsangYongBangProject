package com.test.sist.broker.house;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.house.dao.HouseDAO;
import com.test.sist.house.dto.HouseDTO;

@WebServlet("/broker/house/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//매물 게시글 번호
		String seq = req.getParameter("seq");
		String nowPage = req.getParameter("nowPage");
		
		HouseDAO dao = new HouseDAO();
		//매물 게시글 정보 
		HouseDTO dto = dao.view(seq);
		ArrayList<String> iList = dao.getImg(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("iList", iList);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/broker/house/view.jsp");
		dispatcher.forward(req, resp);
	}
}