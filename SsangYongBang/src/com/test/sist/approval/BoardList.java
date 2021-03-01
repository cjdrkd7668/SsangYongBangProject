package com.test.sist.approval;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.house.dao.HouseDAO;
import com.test.sist.house.dto.HouseDTO;
import com.test.sist.inc.Pagination;

@WebServlet("/approval/boardlist.do")
public class BoardList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한페이지 당 출력 개수
		int blockSize = 10; // 페이지바 사이즈
		
		String page = request.getParameter("page");

		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		int begin = 0; 
		int end = 0;
		HashMap<String, String> map = new HashMap<String, String>();
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin + "");
		map.put("end", end + "");
		
		ApprovalDAO dao = new ApprovalDAO();
		ArrayList<ApprovalDTO> aplist = dao.list(map);
		
		totalCount = dao.getTotalCount();
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/sybang/approval/boardlist.do");
		
		request.setAttribute("apList", aplist);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/approval/boardlist.jsp");
		dispatcher.forward(request, response);

	}

}
