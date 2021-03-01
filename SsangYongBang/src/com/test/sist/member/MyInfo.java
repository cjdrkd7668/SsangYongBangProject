package com.test.sist.member;

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

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/member/myinfo.do")
public class MyInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HashMap<String, String> pmap = new HashMap<String,String>();
		
		HttpSession session = req.getSession();

		//회원 번호
		String authorseq = session.getAttribute("seq").toString();
		pmap.put("authorseq", authorseq);
		
		req.setCharacterEncoding("UTF-8");
		
		MyInfoDAO dao = new MyInfoDAO();
		
		//내가 쓴 글 페이징 - 한 페이지에 5개씩 출력할 예정
		int pnowPage = 0;
		int ptotalPage = dao.ptotalPage(authorseq);
		
		String ppage = req.getParameter("ppage");

		if (ppage == null || ppage == "") {
			pnowPage = 1; // 기본 1 페이지
			pmap.put("ppage", pnowPage + "");

		} else {
			pnowPage = Integer.parseInt(ppage); // 넘어온 값
			pmap.put("ppage", pnowPage + "");

		}

		String ppagebar = "";
		int p = ((pnowPage - 1) / 5) * 5 + 1;

		// 이전 페이지 설정
		if (p == 1) {
			ppagebar += String.format("<li class='disabled'>"
					+ "<a href=\"#!\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>" + "</a>"
					+ "</li>");
		} else {
			ppagebar += String.format("<li>"
					+ "<a href=\"/sybang/member/myinfo.do?ppage=%d\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>"
					+ "</a>" + "</li>", p - 1);
		}

		// 페이지 버튼 수
		int pcnt = 1;

		while (!(pcnt > 5 || p > ptotalPage)) {

			if (pnowPage == p) {
				ppagebar += "<li class= 'active'>";
			} else {
				ppagebar += "<li>";
			}

			ppagebar += String.format("<a href=\"/sybang/member/myinfo.do?ppage=%d\">%d</a></li> ", p, p);

			pcnt++;
			p++;
		}

		// 다음 10페이지로 이동 시
		if (p > ptotalPage) { // 마지막 페이지보다 크면

			ppagebar += String.format("<li class='disabled'>"
					+ "<a href=\"#!\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>" + "</a>"
					+ "</li>");
		} else {
			ppagebar += String.format(
					"<li><a href=\"/sybang/member/myinfo.do?ppage=%d\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a></li>",
					p);
		}
		
		//내가 쓴 글 목록
		ArrayList<MyInfoDTO> plist = dao.postList(pmap);
		
		// 제목, 내용 길이 수정
		for (MyInfoDTO dto : plist) {

			if (dto.getSubject().length() > 30) {
				dto.setSubject(dto.getSubject().substring(0, 30) + "...");
			}

			if (dto.getDetail().length() > 100) {
				dto.setDetail(dto.getDetail().substring(0, 100) + "...");
			}
		}
		
		//총 게시물 수 구하기
		int totalPost = dao.totalPost(authorseq);
		
		//총 댓글 수 구하기
		int totalComment = dao.totalComment(authorseq);
		
		
		
		
		
		req.setAttribute("plist", plist);
		req.setAttribute("ppagebar", ppagebar);
		req.setAttribute("totalPost", totalPost);
		req.setAttribute("totalComment", totalComment);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/myinfo.jsp");
		dispatcher.forward(req, resp);
	}
}