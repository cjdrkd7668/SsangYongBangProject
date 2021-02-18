package com.test.sist.admin2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin2/member_list.do")
public class Member_list extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String t = req.getParameter("type");
		if (t == null) {
			t = "normal";
		}
		
		req.setAttribute("member_type",t);
		
		if (t.equals("normal") || t.equals("null")) {
			req.setAttribute("member_tName","회원");
		}else if (t.equals("broker")) {
			req.setAttribute("member_tName","중개사");
		}else if (t.equals("firm")) {
			req.setAttribute("member_tName","업체");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/member_list.jsp");
		dispatcher.forward(req, resp);
	}
}