package com.test.codestudy.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex05textdata.do")
public class Ex05TextData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//순수 Text 반환
		
		//1. 단일값
		//2. 다중값
		// a. 객체
		// b. 다중 레코드
		
		//1.
		String name = "홍길동";
		String age = "20";
		String address = "서울시 강남구 역삼동";
		
		//CSV
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain");
		
		PrintWriter writer = resp.getWriter();
		writer.print(name + "," + age + "," + address);
		writer.close();
		
		
	}

}



























