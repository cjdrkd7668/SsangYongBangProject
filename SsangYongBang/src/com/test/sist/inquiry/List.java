package com.test.sist.inquiry;

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

import com.test.sist.inquiry.dao.InquiryDAO;
import com.test.sist.inquiry.dto.InquiryDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/inquiry/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		// 검색어
		String search = req.getParameter("search");

		if (!(search == null || search.equals(""))) {
			map.put("search", search);
		}

		HttpSession session = req.getSession();
		
		String authorseq = "";
		
		if ((String)session.getAttribute("approBrokerSeq") != null) {
			// 중개사일 경우
			authorseq = session.getAttribute("approBrokerSeq").toString();

		} else if ((String)session.getAttribute("seq") != null) {
			// 회원일 경우
			authorseq = session.getAttribute("seq").toString();
		
		} else if ((String)session.getAttribute("adminSeq") != null) {
			// 관리자일 경우
			authorseq = session.getAttribute("adminSeq").toString();
		
		} else {
			
		}
		
		session.setAttribute("authorseq", authorseq);
		
		map.put("authorseq", authorseq);
		
		String access = session.getAttribute("access").toString();
		
		map.put("access", access);
		
		InquiryDAO dao = new InquiryDAO();
		
		//조회수 계산 플래그
		session.setAttribute("inquiryRead", false);

		// 페이징
		int nowPage = 0; // 현재 페이지 번호
		int totalPage = dao.totalPage(); // 총 페이지 수
		
		// inquirylist.do?page=1 식으로 호출할 것이므로
		String page = req.getParameter("page");

		if (page == null || page == "") {
			nowPage = 1; // 기본 1 페이지
			map.put("page", nowPage + "");

		} else {
			nowPage = Integer.parseInt(page); // 넘어온 값
			map.put("page", nowPage + "");

		}

		String pagebar = "";
		int n = ((nowPage - 1) / 10) * 10 + 1;

		// 이전 페이지 설정
		if (n == 1) {
			pagebar += String.format("<li class='disabled'>"
					+ "<a href=\"#!\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>" + "</a>"
					+ "</li>");
		} else {
			pagebar += String.format("<li>"
					+ "<a href=\"/sybang/inquiry/list.do?page=%d\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>"
					+ "</a>" + "</li>", n - 1);
		}

		// 페이지 버튼 수
		int cnt = 1;

		while (!(cnt > 10 || n > totalPage)) {

			if (nowPage == n) {
				pagebar += "<li class= 'active'>";
			} else {
				pagebar += "<li>";
			}

			pagebar += String.format("<a href=\"/sybang/inquiry/list.do?page=%d\">%d</a></li> ", n, n);

			cnt++;
			n++;
		}

		// 다음 10페이지로 이동 시
		if (n > totalPage) { // 마지막 페이지보다 크면

			pagebar += String.format("<li class='disabled'>"
					+ "<a href=\"#!\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>" + "</a>"
					+ "</li>");
		} else {
			pagebar += String.format(
					"<li><a href=\"/sybang/inquiry/list.do?page=%d\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a></li>",
					n);
		}
		
		ArrayList<InquiryDTO> list = dao.list(map);
		
		// 제목, 작성자 길이 수정
		for (InquiryDTO dto : list) {

			if (dto.getSubject().length() > 30) {
				dto.setSubject(dto.getSubject().substring(0, 30) + "...");
			}

			if (dto.getAuthorname().length() > 9) {
				dto.setAuthorname(dto.getAuthorname().substring(0, 9) + "...");
			}
		}
		
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/inquiry/list.jsp");
		dispatcher.forward(req, resp);
	}
}