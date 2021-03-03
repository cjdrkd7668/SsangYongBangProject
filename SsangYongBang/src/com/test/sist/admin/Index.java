package com.test.sist.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/index.do")
public class Index extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String name = session.getAttribute("adminName").toString();
		
		AdminDAO dao = new AdminDAO();
		AdminDTO dto = dao.getAdminMain();
		
		request.setAttribute("dto", dto);
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/index.jsp");
		dispatcher.forward(request, response);

	}

}
