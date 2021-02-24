package com.test.sist.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/inquirydetail.do")
public class InquiryDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String page = req.getParameter("page");

		InquiryDAO dao = new InquiryDAO();

		// 조회수 증가
		if (session.getAttribute("read") == null || (boolean) session.getAttribute("read") == false) {
			// null : 북마크로 온 사람, freelist로 온 사람 증가
			dao.updateReadcount(seq);
			session.setAttribute("read", true);
		}
		
		//글 하나 가져오기
		InquiryDTO dto = dao.detail(seq);
		
		//댓글 가져오기
		ArrayList<InquiryCommentDTO> clist = dao.commentList(seq);
		
		dao.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		req.setAttribute("clist", clist);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/inquirydetail.jsp");
		dispatcher.forward(req, resp);
	}
}
