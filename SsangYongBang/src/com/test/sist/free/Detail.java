package com.test.sist.free;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.free.dao.FreeDAO;
import com.test.sist.free.dto.FreeCommentDTO;
import com.test.sist.free.dto.FreeDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/free/detail.do")
public class Detail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//자유게시판 글 번호
		String seq = req.getParameter("seq");
		
		//자유게시판 검색어
		String search = req.getParameter("search");
		
		//자유게시판 페이지
		String page = req.getParameter("page");
		
		FreeDAO dao = new FreeDAO();
		
		//조회수 증가
		if (session.getAttribute("freeRead") == null || (boolean)session.getAttribute("freeRead") == false) {
			
			dao.updateReadcount(seq);
			session.setAttribute("freeRead", true);
		}
		
		//선택한 자유게시판 글 하나 가져오기
		FreeDTO dto = dao.detail(seq);
		
		//댓글 가져오기
		ArrayList<FreeCommentDTO> clist = dao.commentList(seq);
		
		dao.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		req.setAttribute("clist", clist);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/free/detail.jsp");
		dispatcher.forward(req, resp);
	}
}