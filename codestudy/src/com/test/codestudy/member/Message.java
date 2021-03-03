package com.test.codestudy.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/message.do")
public class Message extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 > select
		//2. 결과 + JSP 호출하기
		
		//1.
		MemberDAO dao = new MemberDAO();
		
		HttpSession session = req.getSession();
		
		ArrayList<MessageDTO> list = dao.listMessage(session.getAttribute("seq").toString());
		
		
		//쪽지 내용 자르기
		for (MessageDTO dto : list) {
			if (dto.getContent().length() > 35) {
				dto.setContent(dto.getContent().substring(0, 35) + "..");
			}
		}
		
		
		
		//모든 쪽지의 존재를 확인
		//state(0 -> 1)
		dao.updateState(session.getAttribute("seq").toString());
		
		
		
		
		//2.
		req.setAttribute("list", list);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/message.jsp");
		dispatcher.forward(req, resp);

	}

}











