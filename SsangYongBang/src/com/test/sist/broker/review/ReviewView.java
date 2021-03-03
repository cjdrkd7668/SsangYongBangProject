package com.test.sist.broker.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.broker.chat.ChatDAO;
import com.test.sist.broker.chat.ChatDTO;
/**
 * 리뷰를 상세 조회할 수 있는 클래스입니다.
 * @author 황원준
 *
 */

@WebServlet("/broker/review/reviewview.do")
public class ReviewView extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.
		String seq = request.getParameter("seq");

		// 2.
		ReviewDAO dao = new ReviewDAO();

		ReviewDTO dto = dao.get(seq);

		// 날짜 뒤 시간 자르기
		dto.setRegDate(dto.getRegDate().substring(0, 10));

		// 개행 문자 출력하기
		dto.setContent(dto.getContent().replace("\r\n", "<br>"));

		// 3.
		request.setAttribute("dto", dto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/broker/review/reviewview.jsp");
		dispatcher.forward(request, response);

	}

}
