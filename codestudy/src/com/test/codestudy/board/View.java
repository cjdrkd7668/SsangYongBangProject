package com.test.codestudy.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/view.do")
public class View extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 -> select
		//3. 결과 반환 -> JSP 호출하기 + 전달
		
		HttpSession session = request.getSession();
		
		//1.
		String seq = request.getParameter("seq");
		String search = request.getParameter("search"); //검색어
		
		String page = request.getParameter("page");//???????
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		//2.3 조회수 증가
		if (session.getAttribute("read") == null 
				|| (boolean)session.getAttribute("read") == false) {
			dao.updateReadcount(seq);
			session.setAttribute("read", true);
		}
		
		
		BoardDTO dto = dao.get(seq);
		
		
		//댓글 목록 가져오기
		//현재 보고 있는 글에 달려있는 댓글 목록 가져오기
		ArrayList<CommentDTO> clist = dao.listComment(seq); 
		
		
		dao.close();//****
		
		
		//2.5 데이터 조작
		//개행 문자 출력하기
		dto.setContent(dto.getContent().replace("\r\n", "<br>"));
		
		
		
		//3.
		request.setAttribute("dto", dto);
		request.setAttribute("search", search);
		request.setAttribute("page", page);
		
		request.setAttribute("clist", clist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(request, response);
		
	}

}








