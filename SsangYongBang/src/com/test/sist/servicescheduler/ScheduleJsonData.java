package com.test.sist.servicescheduler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servicescheduler/schedulejsondata.do")
public class ScheduleJsonData extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		//조인해서 가져온 테이블의 select문에서 빼온 정보 (다중값)를 json형식으로 써준다.
		//버튼을 누를 때마다 여기서 json 정보를 쓴다.

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		//이 밑에 테이블에서 가져올 정보를 얻어오기 위한 매개변수 목록을 쓴다.
		
		//매개변수 목록 끝
		
		//DAO와 list를 호출해서 뿌릴 정보의 list를 만든다.
		
		String temp = "";
		
		
		
		//다 출력 후, 해제하기
		writer.close();
		
	}

}

