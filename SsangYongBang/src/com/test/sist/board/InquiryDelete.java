package com.test.sist.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/inquirydelete.do")
public class InquiryDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		//삭제하려는 글 번호
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/inquirydelete.jsp");
		dispatcher.forward(req, resp);
	}
}