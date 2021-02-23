package com.test.sist.admin.hope;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.inc.Pagination;

@WebServlet("/admin/hope/boardlist.do")
public class BoardList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
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
		
		//글 목록
		AdminHopeDAO dao = new AdminHopeDAO();

		ArrayList<AdminHopeDTO> ahlist = dao.getList(nowPage);
		
		//페이지 바
		totalCount = dao.getTotalCountHope(); //총 게시물 수

		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/sybang/admin/hope/boardlist.do");
		
		//목록 전달
		request.setAttribute("ahlist", ahlist);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/hope/boardlist.jsp");
		dispatcher.forward(request, response);

	}

}
