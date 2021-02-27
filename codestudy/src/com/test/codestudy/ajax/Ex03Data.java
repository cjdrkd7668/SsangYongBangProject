package com.test.codestudy.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex03data.do")
public class Ex03Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(ajax -> id)
		//2. DB 작업 -> select
		//3. 결과 반환
		
		//1.
		String id = req.getParameter("id");
		
		//2.
		MemberDAO dao = new MemberDAO();
		
		int result = dao.checkId(id);
		
		//3.
		PrintWriter writer = resp.getWriter();
		
		writer.print(result);
		
		writer.close();
		
	}

}















