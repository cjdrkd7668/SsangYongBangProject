package com.test.sist.inquiry;

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
@WebServlet("/inquiry/post.do")
public class Post extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//로그인 안 하거나 관리자나 업체가 URL로 접근 시
		if (session.getAttribute("email") == null || (session.getAttribute("seq") == null && session.getAttribute("approBrokerSeq") == null)) {
			
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("location.href='/sybang/inquiry/list.do';");
			writer.print("</script>");
			writer.print("</body></html>");

			writer.close();

			return;
			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/inquiry/post.jsp");
		dispatcher.forward(req, resp);
	}
}