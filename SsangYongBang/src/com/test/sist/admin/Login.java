package com.test.sist.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/login.do")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		AdminDAO dao = new AdminDAO();
		AdminDTO dto = new AdminDTO();
		
		dto.setEmail(email);
		dto.setPw(pw);
		
		int result = dao.login(dto);
		
		if (result == 1) {
			response.sendRedirect("/sybang/index.do");
		} else {
			
		}
		
	}

}
