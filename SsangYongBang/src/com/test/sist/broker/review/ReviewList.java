package com.test.sist.broker.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.broker.chat.ChatDAO;
import com.test.sist.broker.chat.ChatDTO;
import com.test.sist.inc.Pagination;

@WebServlet("/broker/review/reviewlist.do")
public class ReviewList extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   //페이징
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한페이지 당 출력 개수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//rnum 시작 번호
		int end = 0;			//rnum 끝 번호
		int n = 0;				//페이지바 관련 변수
		int loop = 0;			//페이지바 관련 변수
		int blockSize = 5;		//페이지바 관련 변수
	   
		
		String page = request.getParameter("page");
		
		if (page == null || page == "") {
			//기본 -> page = 1
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		
		//글 목록
		ReviewDAO dao = new ReviewDAO();
	
		ArrayList<ReviewDTO> list = dao.list(map);
		
		for (ReviewDTO dto : list) {
			
			//날짜에서 시간 잘라내기
			dto.setRegDate(dto.getRegDate().substring(0, 10));
			
			//제목이 너무 길면 자르기
			if (dto.getContent().length() > 34) {
				dto.setContent(dto.getContent().substring(0, 34) + "..");
			}
		}
		
				
		//페이지 바
		totalCount = dao.getTotalCount(); //총 게시물 수
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/sybang/broker/review/reviewlist.do");
			
		//목록 전달
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("nowPage", nowPage);
	   
	 	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/review/reviewlist.jsp");
      dispatcher.forward(request, response);
      
   }
	    	   
}
