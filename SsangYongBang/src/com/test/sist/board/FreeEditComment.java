package com.test.sist.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/freeeditcomment.do")
public class FreeEditComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//댓글 번호
		String seq = req.getParameter("seq");
		
		//글 번호
		String frseq = req.getParameter("frseq");
		
		FreeDAO dao = new FreeDAO();
		FreeDTO dto = dao.detail(frseq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/freeeditcomment.jsp");
		dispatcher.forward(req, resp);
	}
}