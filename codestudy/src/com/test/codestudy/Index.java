package com.test.codestudy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.codestudy.member.MemberDAO;

@WebServlet("/index.do")
public class Index extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. DB 작업 -> select
		//2. 결과 + JSP 호출하기
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<BarDTO> blist = dao.getBar();
		ArrayList<PiDTO> plist = dao.getPi();
		
		
		request.setAttribute("blist", blist);
		request.setAttribute("plist", plist);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispatcher.forward(request, response);
		
	}

}














