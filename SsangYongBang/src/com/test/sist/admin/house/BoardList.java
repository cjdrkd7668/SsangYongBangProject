package com.test.sist.admin.house;

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

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/admin/house/boardlist.do")
public class BoardList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//페이징 
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

		//글 목록 가져오기
		HouseDAO dao = new HouseDAO();
		ArrayList<HouseDTO> hlist = dao.allList(map);
		
		
		
		totalCount = dao.allTotalCount();
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/sybang/admin/house/boardlist.do");
		
		request.setAttribute("hlist", hlist);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/house/boardlist.jsp");
		dispatcher.forward(request, response);

	}

}