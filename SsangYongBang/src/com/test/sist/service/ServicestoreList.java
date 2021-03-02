package com.test.sist.service;

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

@WebServlet("/service/ServicestoreList.do")
public class ServicestoreList extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   //목록 or 검색
	   // - 목록: list.do
	   // - 검색: list.do?search=게시판
	   
	   HttpSession session = request.getSession();
	   String categoryNum = request.getParameter("categoryNum");
	   
	   
	   HashMap<String,String> map = new HashMap<String,String>();
	   
	   String search = request.getParameter("search");
	   
	   if (!(search == null || search.equals(""))) {
		   map.put("categoryNum", categoryNum);
		   map.put("search", search);
	   }
	   
	   
	   //1. DB작업 -> select
	   //2. 목록 반환 + JSP 전달 & 호출
	   
	 
	   
	   //페이징
	   int nowPage = 0;		//현재 페이지 번호
	   int totalCount = 0;  //총 게시물 수
	   int pageSize = 9; //한페이지 당 출력 개수
	   int totalPage = 0; //총 페이지 수
	   int begin = 0;	// rnum 시작 번호
	   int end = 0; //rnum 끝 번호
	   int n = 0;		//페이지바 관련 변수
	   int loop = 0; 	//페이지바 관련 변수
	   int blockSize = 9; //페이지바 관련변수
	   
	   String page = request.getParameter("page");
	   
	   if (page == null || page =="") {
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
	   ServiceBoardDAO dao = new ServiceBoardDAO();
	   ArrayList<ServiceDTO> list = dao.list(map);
	   
	   //1.5 데이터 조작
	   //생략
	   for (ServiceDTO dto : list) {
		   
		   System.out.println(dto.getCategorySeq() + dto.getApprovalFSeq() + dto.getId() + dto.getAddress() + dto.getPortfolio());
	   }
	   /*
		콘솔에 해당 정보들이 찍히는 것 확인되었음.
	   */
	   
	   //총 페이지 수 계산
	   totalCount = dao.getToatalCount(map); //총 게시물 개수
	   
	   totalPage = (int) Math.ceil((double) totalCount / pageSize);
	   
		   
	   String pagebar = "";
	   
		loop = 1;
		//n = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
	   
	   
		if (n == 1) {
			pagebar += String.format("<li class='disabled'>"
					+ "            <a href=\"#!\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>");
		} else {				
			pagebar += String.format("<li>"
					+ "            <a href=\"/sybang/service/ServicestoreList.do?page=%d\" aria-label=\"Previous\">"
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
			
			pagebar += String.format("<a href=\"/sybang/service/ServicestoreList.do?page=%d\">%d</a></li>", n, n);
			
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
					+ "            <a href=\"/sybang/service/ServicestoreList.do?page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
			//pagebar += String.format("<a href=\"/codestudy/board/list.do?page=%d\">다음 10페이지</a>", n);
		}


		//2.
		

		
		request.setAttribute("categoryNum", categoryNum);
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("list", list);
		
	   
		
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/service/servicestorelist.jsp");
      dispatcher.forward(request, response);
      
   }

}

