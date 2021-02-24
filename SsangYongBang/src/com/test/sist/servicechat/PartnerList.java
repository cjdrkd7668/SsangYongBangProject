package com.test.sist.servicechat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servicechat/partnerlist.do")
public class PartnerList extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//1. DB 작업 > select
		//2. 결과 + JSP 호출하기
		
		
		//1.
		
		ChatDAO dao = new ChatDAO();
		ChatDTO dto = new ChatDTO();
		
		
		ArrayList<ChatDTO> list = dao.list((String) session.getAttribute("approvalFSeq"));
		
		//데이터 조작 -> 서블릿 담당
		//데이터 출력 -> JSP 담당
		
		
		//1.5 데이터 조작
		//셍략
		
		//테이블열 채팅 상태를 추가한다면 읽음 안읽음 표시 여기서 데이터 update 필요함
		
		//2.
		req.setAttribute("list", list);
		
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicechat/partnerlist.jsp");
		dispatcher.forward(req, resp);
	}

}
