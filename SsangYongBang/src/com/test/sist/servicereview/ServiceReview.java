package com.test.sist.servicereview;

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

import com.test.sist.servicereview.BoardDAO;
import com.test.sist.servicereview.BoardDTO;

@WebServlet("/servicereview/servicereview.do")
public class ServiceReview extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   
	   //목록 & 검색
	   
	   HashMap<String,String> map = new HashMap<String,String>();
	   
	   String search = request.getParameter("search");
	   
	   if (!(search == null || search.equals(""))) {
		   map.put("search", search);
	   }
	   
	   //1. DB 작업 > select
	   //2. 목록 반환 + JSP화면 전달 및 호출하기
	   
	   
	   HttpSession session = request.getSession();
	   
	   //페이징
	   int nowPage = 0; //현재 페이지 번호
	   int totalCount = 0; // 총 게시물 수
	   int pageSize = 10; // 한페이지 당 출력 개수
	   int totalPage = 0; // 총 페이지 수
	   int begin = 0; //rnum 시작 번호
	   int end = 0; //rnum 끝 번호
	   int n = 0; //페이지바 관련 변수
	   int loop = 0; //페이지바 관련 변수
	   int blockSize = 10; //페이지바 관련 변수
	   
	   
	   String page = request.getParameter("page");
	   
		if (page == null || page == "") {
			//기본 -> page = 1
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		map.put("begin", begin + "");
		map.put("end", end + "");

		
		
		//1. DB
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardDTO> list = dao.list(map);
	   
		//데이터 조작 -> 서블릿 역할
		//데이터 출력 -> JSP 역할
		
		//1.5 데이터 조작
		for (BoardDTO dto : list) {
			
			//시간 제외
			dto.setRegDate(dto.getRegDate().substring(0, 10));	
		}
		
		
		//페이지 맞추기
		totalCount = dao.getTotalCount(map); //총게시물 수 가져오기
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize); // 총페이지수
	   
		String pagebar = "";
		
		loop = 1;
		
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (nowPage == n) {
				pagebar += "<li class='active'>";
			} else {
				pagebar += "<li>";
			}
			
			pagebar += String.format("<a href=\"/sybang/servicereview/servicereview.do?page=%d\">%d</a></li>", n, n);
			
			loop++;
			n++;
		}
		
		
		//다음 10페이지로 이동
		if (n > totalPage) {
			pagebar += String.format("<li class='disabled'>"
					+ "            <a href=\"#!\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>");
		} else {
			pagebar += String.format("<li>"
					+ "            <a href=\"/sybang/servicereview/servicereview?page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
		}
			   
	   
		
		
		//2.
		
		
	   
	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/servicereview/servicereview.jsp");
      dispatcher.forward(request, response);
      
   }

}
