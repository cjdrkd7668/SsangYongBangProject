package com.test.sist.admin.house;

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

@WebServlet("/admin/house/view.do")
public class View extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 매물 게시글 번호
		String seq = request.getParameter("seq");
		String nowPage = request.getParameter("nowPage");
		
		HouseDAO dao = new HouseDAO();
		//매물 게시글 정보
		HouseDTO dto = dao.view(seq);
		ArrayList<String> iList = dao.getImg(seq);
		
		request.setAttribute("dto", dto);
		request.setAttribute("iList", iList);
		request.setAttribute("nowPage", nowPage);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/house/view.jsp");
		dispatcher.forward(request, response);

	}

}