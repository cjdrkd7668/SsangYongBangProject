package com.test.codestudy.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex02data.do")
public class Ex02Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//클라이언트가 서버로 데이터를 보내는 방식
		//1. <form> + submit
		//2. url?key=value
		//3. ajax
		//결론. 서버는 클라이언트가 어떤 방식으로 데이터를 보냈는지 구분하지 않는다.
		
//		String num = req.getParameter("num");
//		
//		String result = "";
//		
//		if (num.equals("100"))
//			result = "백";
//		else if (num.equals("200"))
//			result = "이백";
//		else if (num.equals("300"))
//			result = "삼백";
		
		
		
		String id = req.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		String name = dao.getName(id);		
		
		
		//반환값 처리(******)
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(name);
		
		writer.close();
		

	}

}













