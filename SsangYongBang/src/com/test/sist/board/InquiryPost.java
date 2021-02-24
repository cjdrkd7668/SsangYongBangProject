package com.test.sist.board;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/board/inquirypost.do")
public class InquiryPost extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		// 로그인 안 한 사람이 URL로 접근 시
		if (session.getAttribute("email") == null) {
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("location.href='/sybang/board/inquirylist.do';");
			writer.print("</script>");
			writer.print("</body></html>");

			writer.close();

			return;
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/inquirypost.jsp");
		dispatcher.forward(req, resp);
	}
}