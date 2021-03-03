package com.test.sist.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/service/servicedata.do")
public class ServiceData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		//1 데이터 가져오기
		//2. DB작업
		//3. 결과 반환
		
		
		//1.
		String email = req.getParameter("email");
		
		//2.
		ServiceDAO dao = new ServiceDAO();
		
		int result = dao.checkEmail(email);
		
		
		
		//3. 결과반환
		PrintWriter writer = resp.getWriter();
		
		writer.print(result);
		
		writer.close();
		
		
		
	}

}

