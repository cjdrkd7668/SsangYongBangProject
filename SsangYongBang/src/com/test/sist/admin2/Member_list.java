package com.test.sist.admin2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.admin2.dao.Member_listDAO;
import com.test.sist.admin2.dto.BrokerDTO;
import com.test.sist.admin2.dto.FirmDTO;
import com.test.sist.admin2.dto.MemberDTO;

@WebServlet("/admin2/member_list.do")
public class Member_list extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		String mType = req.getParameter("type"); //일반회원:member, 중개사:broker, 업체:firm
		if (mType == null) { //null이면 일반회원으로
			mType = "normal";
		}
		
		req.setAttribute("member_type",mType);
		
		
		
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
		
		String page = req.getParameter("page");
		
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
		
		
		Member_listDAO dao = new Member_listDAO();
		
		if (mType.equals("normal") || mType.equals("null")) { //회원메뉴
			req.setAttribute("member_tName","회원");
			req.setAttribute("member_t","N");
			
			ArrayList<MemberDTO> list = dao.getMemberInfo(map);
			int cnt = dao.getMemberCnt();
			
			req.setAttribute("list",list);
			req.setAttribute("cnt",cnt);
			
		}else if (mType.equals("broker")) { //중개사메뉴
			req.setAttribute("member_tName","중개사");
			req.setAttribute("member_t","B");
			
			ArrayList<BrokerDTO> list = dao.getBrokerInfo(map);
			int cnt = dao.getBrokerCnt();
			
			req.setAttribute("list",list);
			req.setAttribute("cnt",cnt);
			
		}else if (mType.equals("firm")) { //업체메뉴
			req.setAttribute("member_tName","업체");
			req.setAttribute("member_t","F");
			
			ArrayList<FirmDTO> list = dao.getFirmInfo(map);
			int cnt = dao.getFirmCnt();
			
			req.setAttribute("list",list);
			req.setAttribute("cnt",cnt);
			
		}
		
		
		totalCount = (int) req.getAttribute("cnt"); //총 게시물 수
//		System.out.println(totalCount); //274개
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize); //총 페이지 수
//		System.out.println(totalPage); //27페이지면 -> 28페이지
		
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
					+ "            <a href=\"/sybang/admin2/member_list.do?type=%s&page=%d\" aria-label=\"Previous\">"
					+ "                <span aria-hidden=\"true\">&laquo;</span>"
					+ "            </a>"
					+ "        </li>", mType, n - 1);
		}
		
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (nowPage == n) {
				pagebar += "<li class='active'>";
			} else {
				pagebar += "<li>";
			}
			
			pagebar += String.format("<a href=\"/sybang/admin2/member_list.do?type=%s&page=%d\">%d</a></li>", mType, n, n);
			
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
					+ "            <a href=\"/sybang/admin2/member_list.do?type=%s&page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", mType, n);
		}
		
		//2.
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("nowPage", nowPage);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/member_list.jsp");
		dispatcher.forward(req, resp);
	}
}







