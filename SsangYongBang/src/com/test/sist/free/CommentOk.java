package com.test.sist.free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/free/commentok.do")
public class CommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//댓글 번호
		String seq = req.getParameter("seq");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/free/commentok.jsp");
		dispatcher.forward(req, resp);
	}
}