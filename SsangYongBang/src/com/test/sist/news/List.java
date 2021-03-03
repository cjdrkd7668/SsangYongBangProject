package com.test.sist.news;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/news/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		HttpSession session = req.getSession();
		
		NewsDAO dao = new NewsDAO();
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/news/list.jsp");
		dispatcher.forward(req, resp);
	}
}