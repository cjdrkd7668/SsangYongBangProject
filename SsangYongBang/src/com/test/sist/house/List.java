package com.test.sist.house;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.inc.Pagination;
import com.test.sist.room.RoomDAO;
import com.test.sist.room.RoomDTO;

@WebServlet("/house/list.do")
public class List extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//접속한 회원이 누군지 알아내기
		HttpSession session = request.getSession();
		String seq = (String)session.getAttribute("seq");
		
		//현재 페이지 수 구하기
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한페이지 당 출력 개수
		int blockSize = 10;		//페이지바 사이즈
		
		String page = request.getParameter("page");
		
		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//페이지 당 첫 글과 마지막 글에 대한 인덱스 구하기
		int begin = 0;			//rnum 시작
		int end = 0;			//rnum 끝
		HashMap<String, String> map = new HashMap<String, String>();
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		//글 목록
		RoomDAO dao = new RoomDAO();

		ArrayList<RoomDTO> myList = dao.getMyList(map, seq);
		
		//페이지 바
		totalCount = dao.getMyTotalCount(seq); //총 게시물 수
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/sybang/house/list.do");
		
		//목록 전달
		request.setAttribute("armList", myList);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/house/list.jsp");
		dispatcher.forward(request, response);

	}

}
