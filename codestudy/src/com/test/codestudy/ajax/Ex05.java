package com.test.codestudy.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex05.do")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 -> select -> 부서 목록
		//2. 결과 + JSP 호출하기
		
		MemberDAO dao = new MemberDAO();
		ArrayList<String> list = dao.listBuseo();
		
		
		req.setAttribute("list", list);		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ajax/ex05.jsp");
		dispatcher.forward(req, resp);

	}

}























