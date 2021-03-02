package com.test.sist.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/editinfook.do")
public class EditInfoOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		String phone = req.getParameter("phone").replace("-", "");
		String address = req.getParameter("address");
		
		MemberDTO dto = new MemberDTO();
		dto.setSeq(seq);
		dto.setPw(pw);
		dto.setPhone(phone);
		dto.setAddress(address);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.edit(dto);
		dao.close();
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}
}