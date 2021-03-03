package com.test.sist.notice;

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
@WebServlet("/notice/post.do")
public class Post extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("email") == null && (String)session.getAttribute("access") != "3") {
			
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("location.href='/sybang/notice/list.do';");
			writer.print("</script>");
			writer.print("</body></html>");

			writer.close();

			return;
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/post.jsp");
		dispatcher.forward(req, resp);
	}
}