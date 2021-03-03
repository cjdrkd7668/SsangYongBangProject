package com.test.codestudy.board;

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

@WebServlet("/board/list.do")
public class List extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//목록 or 검색
		// - 목록: list.do
		// - 검색: list.do?search=게시판
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		String search = request.getParameter("search");
		
		if (!(search == null || search.equals(""))) {
			map.put("search", search);
		}
		
		
		
		
		
		//1. DB 작업 > select
		//2. 목록 반환 + JSP 전달 & 호출하기
		
		
		HttpSession session = request.getSession();
		
		//view.do -> 새로고침 조회수 증가 방지 -> 플래그 생성
		session.setAttribute("read", false);
		
		
		
		
		
		
		//페이징
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한페이지 당 출력 개수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//rnum 시작 번호
		int end = 0;			//rnum 끝 번호
		int n = 0;				//페이지바 관련 변수
		int loop = 0;			//페이지바 관련 변수
		int blockSize = 10;		//페이지바 관련 변수
		
		
		//list.do
		//list.do -> list.do?page=1
		//list.do -> list.do?page=2
		
		String page = request.getParameter("page");
		
		if (page == null || page == "") {
			//기본 -> page = 1
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//nowPage -> 현재 보려는 페이지 번호
		//1page -> where rnum between 1 and 10
		//2page -> where rnum between 11 and 20
		//3page -> where rnum between 21 and 30
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		
		
		//1.
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardDTO> list = dao.list(map);
		
		
		//데이터 조작 -> 서블릿 담당
		//데이터 출력 -> JSP 담당
		
		//1.5 데이터 조작
		for (BoardDTO dto : list) {
			
			//날짜에서 시간 잘라내기
			dto.setRegdate(dto.getRegdate().substring(0, 10));
			
			//제목이 너무 길면 자르기
//			if (dto.getSubject().length() > 34) {
//				dto.setSubject(dto.getSubject().substring(0, 34) + "..");
//			}
			
		}
		
		
		
		//페이지바 만들기
		/*
		<li>
            <a href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li><a href="/codestudy/board/list.do">1</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
		*/
		
		
		//총 페이지 수 계산하기
		//총 게시물 수 = 274개
		//총 페이지 수 = 274 / 10 -> 27.4 -> 28페이지
		
		totalCount = dao.getTotalCount(map); //총 게시물 수
		//System.out.println(totalCount); //274개
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize); //총 페이지 수
		//System.out.println(totalPage); //27페이지 -> 28페이지
		
		
		String pagebar = "";
		
//		for (int i=1; i<= totalPage; i++) {
//			
//			if (nowPage == i) {
//				pagebar += "<li class='active'>";
//			} else {
//				pagebar += "<li>";
//			}
//			
//			pagebar += String.format("<a href=\"/codestudy/board/list.do?page=%d\">%d</a></li>", i, i);
//		}
		
		loop = 1;
		//n = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		//list.do?page=1
		//1 2 3 4 5 6 7 8 9 10
		
		//list.do?page=3
		//1 2 3 4 5 6 7 8 9 10
		
		//list.do?page=10
		//1 2 3 4 5 6 7 8 9 10
		
		//list.do?page=11
		//11 12 13 14 15 16 17 18 19 20
		
		
		
		//이전 10페이지
		
		if (n == 1) {
			pagebar += String.format("<li class='disabled'>"
					+ "            <a href=\"#!\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>");
		} else {				
			pagebar += String.format("<li>"
					+ "            <a href=\"/codestudy/board/list.do?page=%d\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>", n - 1);
		}
		
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (nowPage == n) {
				pagebar += "<li class='active'>";
			} else {
				pagebar += "<li>";
			}
			
			pagebar += String.format("<a href=\"/codestudy/board/list.do?page=%d\">%d</a></li>", n, n);
			
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
					+ "            <a href=\"/codestudy/board/list.do?page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
			//pagebar += String.format("<a href=\"/codestudy/board/list.do?page=%d\">다음 10페이지</a>", n);
		}
		
		//2.
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	

}






