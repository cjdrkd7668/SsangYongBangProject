package com.test.sist.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/mypostok.do")
public class MyPostOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		//데이터 받아오기
		//회원 번호
		String authorseq = req.getParameter("authorseq");
		String zerobonem = "1"; //회원일 경우 1
		
		MyPostDAO dao = new MyPostDAO();
		
		//페이징
		int nowPage = 0;
		int totalPage = dao.postTotalPage(authorseq); //총 페이지 수

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
					+ "<a href=\"/sybang/member/mypostok.do?page=%d\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>"
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

			pagebar += String.format("<a href=\"/sybang/member/mypostok.do?page=%d\">%d</a></li> ", n, n);

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
					"<li><a href=\"/sybang/member/mypostok.do?page=%d\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a></li>",
					n);
		}
		
		MyPostDTO dto = new MyPostDTO();
		
		dto.setAuthorseq(authorseq);
		dto.setZerobonem(zerobonem);
		

		//내가 글 쓴 목록 받아오기
		ArrayList<MyPostDTO> plist = dao.postList(authorseq);
		
		dao.close();
		
		PrintWriter writer = resp.getWriter();
		writer.print(plist);
		writer.close();
	}
}
