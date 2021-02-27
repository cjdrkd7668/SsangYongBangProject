package com.test.codestudy.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex01data.do")
public class Ex01Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(id)
		//2. DB 작업 -> select
		//3. 결과 반환
		
		//1.
		String id = req.getParameter("id");
		
		//2.
		MemberDAO dao = new MemberDAO();
		
		String name = dao.getName(id);
		System.out.println(name);
		
		//3.
		//클라이언트에게 돌려주는 데이터에 한글이 포함이 되어있으면
		//response를 가지고 인코딩 처리를 한다.
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<html><head><meta charset='utf-8'></head><body>");
		writer.print("<script>");
		writer.print("location.href='/codestudy/ajax/ex01.do?name=" + name + "';");
		writer.print("</script>");
		writer.print("</body></html>");
		
		writer.close();
		
		
		
		
		

	}

}













