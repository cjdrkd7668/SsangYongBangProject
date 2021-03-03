package com.test.sist.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.admin2.dao.TextManagerDAO;
import com.test.sist.admin2.dto.TextManagerDTO;

@WebServlet("/notice/page.do")
public class Page extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		TextManagerDAO dao = new TextManagerDAO();
		TextManagerDTO dto = dao.get(seq);
		
		req.setAttribute("dto",dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/page.jsp");
		dispatcher.forward(req, resp);
	}
}

