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

@WebServlet("/servicechat/memberspartnerlist.do")
public class MembersPartnerList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//1. DB작업 -> select문
		//2. 결과 + jsp 호출하기
		
		//1. 
		ChatDAO dao = new ChatDAO();
		ChatDTO dto = new ChatDTO();
		
		ArrayList<ChatDTO> list = dao.firmlist((String) session.getAttribute("seq"));
		//로그인한 회원의 세션에 들어있는 회원번호를 매개변수로 넘겨, (회원의 경우, 로그인하며 회원번호를 seq로 저장함)
		//대화목록에 보여줄 업체정보, 그다음 페이지로 넘길때 필요한 정보들을 가져온다. 
		
		//1.5 데이터 조작
		//셍략
		
		//테이블열 채팅 상태를 추가한다면 읽음 안읽음 표시 여기서 데이터 update 필요함
		
		//2.
		req.setAttribute("list", list);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicechat/memberspartnerlist.jsp");
		dispatcher.forward(req, resp);
	}

}

