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

@WebServlet("/servicechat/memberchat.do")
public class MemberChat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1.링크로 전달받은 데이터 가져오기
		//2. DB작업 -> select
		//3. 결과 반환 -> JSP 호출
		
		HttpSession session = req.getSession();
		
	   //1.
	   String estimate1thSeq = req.getParameter("estimate1thSeq"); //링크로 건네준 견적서번호
	   String memberSeq = (String) session.getAttribute("seq"); //업체 세션에 담아서 가지고 다니는 업체승인번호
	   //select문에서 쓸 매개변수 정보들 가져오기 끝
	   
	   //2.
	   ChatDAO dao = new ChatDAO();
	   ChatDTO dto = new ChatDTO();
	   
	   //지정한 대화상대(회원 측에서는 각 업체)와의 대화 log 가져오기
	   
	   ArrayList<ChatDTO> chatLogList = dao.membersListChatLog(estimate1thSeq, memberSeq);
	   
	   dao.close();
	   //자원 해제
	   
	   //2.5 데이터 조작
	   //생략
	   
	   //3.
	   req.setAttribute("dto", dto); //dto가져가기
	   req.setAttribute("estimate1thSeq", estimate1thSeq); //견적서번호 가져가기
	   req.setAttribute("chatLogList", chatLogList); //메서드 호출해서 가져온 채팅log목록 가져가기

	   
	   
	   
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicechat/memberchat.jsp");
		dispatcher.forward(req, resp);
	}

}

