package com.test.sist.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/signupok.do")
public class SignupOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String ssn = req.getParameter("ssn");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		
		MemberDTO dto = new MemberDTO();
		dto.setEmail(email);
		dto.setPw(pw);
		dto.setName(name);
		dto.setSsn(ssn);
		dto.setPhone(phone);
		dto.setAddress(address);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.signup(dto);
		dao.close();
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
		
		
	}
}
