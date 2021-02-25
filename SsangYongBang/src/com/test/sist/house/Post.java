package com.test.sist.house;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/house/post.do")
public class Post extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String access = (String)(session.getAttribute("access") + "");
		
		if (access.equals("null")) {
			accessBack(resp);
		} else {
			if (Integer.parseInt(access) != 1) {
				accessBack(resp);
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/house/post.jsp");
				dispatcher.forward(req, resp);
			}
			
		}
		
	}

	private void accessBack(HttpServletResponse resp) throws IOException {
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.print("<html><head><meta charset='utf-8'></head><body>");
		writer.print("<script>");
		writer.print("alert('일반 회원으로 로그인하셔야 이용 가능합니다.');");
		writer.print("history.back();");
		writer.print("</script>");
		writer.print("</body></html>");
		
		writer.close();
	}
}