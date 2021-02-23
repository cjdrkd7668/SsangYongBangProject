package com.test.sist.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/login.do")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		AdminDAO dao = new AdminDAO();
		AdminDTO dto = new AdminDTO();
		
		dto.setId(email);
		dto.setPw(pw);
		
		int result = dao.login(dto);
		
		HttpSession session = request.getSession();
		
		if (result == 1) {
			
			AdminDTO adto = dao.getAdmin(email);
			
			//인증 티켓
			session.setAttribute("email", email);
			
			//관리자 정보
			session.setAttribute("adminSeq", adto.getSeq());
			session.setAttribute("adminName", adto.getName());
			
			//접근 권한
			/*
			 0 -> 부동산 중개사
			 1 -> 일반 회원
			 2 -> 서비스 업체
			 3 -> 관리자
			*/
			session.setAttribute("access", 3);
			
			response.sendRedirect("/sybang/index.do");
			
		} else {
			
			//로그인 실패
			PrintWriter writer = response.getWriter();
			  
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('login fail');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
			
		}
		
	}

}
