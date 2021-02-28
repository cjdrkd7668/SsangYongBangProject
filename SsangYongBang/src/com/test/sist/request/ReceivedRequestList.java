package com.test.sist.request;

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

import com.test.sist.request.BoardDAO;
import com.test.sist.request.BoardDTO;

@WebServlet("/request/receivedrequestlist.do")
public class ReceivedRequestList extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   
	   HttpSession session = request.getSession();
	   
	   //업체가 본인이 받은 요청서 리스트 조회
	   //목록 & 검색
	   
	   HashMap<String,String> map = new HashMap<String,String>();
	   
	   String approvalFSeq = (String) session.getAttribute("approvalFSeq"); 
	   //로그인한 업체승인번호(세션에 담아둔 것 가져오기)
	   map.put("approvalFSeq", approvalFSeq);
	   
	   String search = request.getParameter("search");
	   
	   if (!(search == null || search.equals(""))) {
		   map.put("search", search);
	   }
	   
	   
	   //DB작업 > select문
	   //2. 목록반환 + JSP 전달 및 호출하기
	   
	   
	   
	   //페이징
	   int nowPage = 0; //현재 페이지 번호
	   int totalCount = 0; // 총 게시물 수
	   int pageSize = 10;  // 1페이지 출력 개수
	   int totalPage = 0; // 총 페이지 수
	   int begin = 0; // rnum 시작번호
	   int end = 0; // rnum 끝번호
	   int n = 0; //페이지바 관련변수
	   int loop = 0; //페이지바 관련변수
	   int blockSize = 10; //페이지바 관련변수
	   
	   
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
	   
	   
	   //1.
	   BoardDAO dao = new BoardDAO();
	   
	   System.out.println(333);
	   ArrayList<BoardDTO> list = dao.receivedlist(map);
	   System.out.println(444);
	   
	   //1.5 데이터 조작 > 등록일 시간없이 출력필요
	   for (BoardDTO dto : list) {
		   
		   dto.setRegDate(dto.getRegDate().substring(0, 10));
	   }
	   
	   System.out.println(555);
	   totalCount = dao.getTotalCount(map); //총 게시물수
	   System.out.println(666);
	   
	   totalPage = (int)Math.ceil((double) totalCount / pageSize); //총페이지 수
	   
	   String pagebar = "";
	   
	   loop = 1;
	   
	   n = ((nowPage - 1) / blockSize) * blockSize + 1;
	   
	   
	   
		
		//이전 10페이지
		
		if (n == 1) {
			pagebar += String.format("<li class='disabled'>"
					+ "            <a href=\"#!\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>");
		} else {				
			pagebar += String.format("<li>"
					+ "            <a href=\"/sybang/request/receivedrequestlist.do?page=%d\" aria-label=\"Previous\">"
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
			
			pagebar += String.format("<a href=\"/sybang/request/receivedrequestlist.do?page=%d\">%d</a></li>", n, n);
			
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
					+ "            <a href=\"/sybang/request/receivedrequestlist.do?page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
			//pagebar += String.format("<a href=\"/codestudy/board/list.do?page=%d\">다음 10페이지</a>", n);
		}
		   
	   
	   //2.
		//로그인 회원번호도 같이 보내기
		request.setAttribute("approvalFSeq", approvalFSeq);
		
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);

	   
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/request/receivedrequestlist.jsp");
      dispatcher.forward(request, response);
      
   }

}

