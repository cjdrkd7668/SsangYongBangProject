package com.test.sist.hope;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.admin2.dao.AllMemberDAO;
import com.test.sist.admin2.dto.BrokerDTO;
import com.test.sist.admin2.dto.FirmDTO;
import com.test.sist.admin2.dto.MemberDTO;
import com.test.sist.hope.dao.HopeDAO;
import com.test.sist.hope.dto.HopeDTO;

@WebServlet("/hope/list.do")
public class List extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HopeDAO dao = new HopeDAO();
		HopeDTO dto = new HopeDTO();
		
		HashMap<String,String> map = new HashMap<String,String>();
		
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
		
		
		ArrayList<HopeDTO> list = dao.getList(map);
		System.out.println(list);
		int cnt = dao.getCount();
		
		String board_list = "";
		
		for (HopeDTO ldto:list) {
			
		board_list += "<tr onclick=\"location.href='/sybang/hope/view.do?seq=" + ldto.getSeq() + "'\">";
		board_list += "	<td><input type=\"checkbox\" name=\"cbList\"></td>";
		board_list += "	<td>" + ldto.getSeq() + "</td>";
		board_list += "	<td>" + ldto.gethDType() + "</td>";
		board_list += "	<td>";
		
		if (ldto.gethDType().equals("월세")) {
			board_list += ldto.gethRentPrice() + "<span>만원</span>";
		}else {
			board_list += ldto.gethPrice() + "<span>만원</span>";
		}
		
		board_list += "	<td>" + ldto.gethAddress() + "</td>";
		board_list += "	<td>" + ldto.gethArea() + "</td>";
		board_list += "	<td>" + ldto.gethRoomNum() + "</td>";
		board_list += "</tr>";
		
		}
		
		totalCount = cnt; //총 게시물 수
//				System.out.println(totalCount); //274개
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize); //총 페이지 수
//				System.out.println(totalPage); //27페이지면 -> 28페이지
		
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
					+ "            <a href=\"/sybang/hope/list.do?&page=%d\" aria-label=\"Previous\">"
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
			
			pagebar += String.format("<a href=\"/sybang/hope/list.do?&page=%d\">%d</a></li>", n, n);
			
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
					+ "            <a href=\"/sybang/hope/list.do?page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
		}
		
		//2.
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("board_list", board_list);
		req.setAttribute("cnt", cnt);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hope/list.jsp");
		dispatcher.forward(req, resp);
	}
}