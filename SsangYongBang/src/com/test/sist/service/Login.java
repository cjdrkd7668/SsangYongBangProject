package com.test.sist.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/service/login.do")
public class Login extends HttpServlet {
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   //로그인시, from method는 post임
		


	   
	   //email은 email
	   //pw는 pw로 함.
	   //seq는 serviceSeq로 함.
	   
	  //1. 데이터 가져오기
	  //2. DB 작업 -> select (등록 업체회원 여부 확인)
	  //3. 결과 처리
	   
	  //1.
	  String email = request.getParameter("email");
	  String pw = request.getParameter("pw");
	  
	  //2.
	  ServiceDAO dao = new ServiceDAO();
	  ServiceDTO dto = new ServiceDTO();
	  
	  dto.setEmail(email);
	  dto.setPw(pw);
	  
	  int result = dao.getLogin(dto); // 1 or 0 
	  //승인 여부를 확인하는 메서드
	  
	  //3.
	  if (result == 1) {
		  //로그인함
		  
		  HttpSession session = request.getSession();
		  
		  session.setAttribute("email", dto.getEmail());
		  //인증수단
		 
		  
		  
		  ServiceDTO sdto = dao.getService(email);
		  
		  //승인업체 테이블과 조인한 정보 가져와 담기.. 여기서 오류 발생함(널포인익셉션)
		  session.setAttribute("approvalFSeq", sdto.getApprovalFSeq()); //서비스업체승인번호
		  session.setAttribute("access", 2); //서비스업체 접근권한 코드
		  
		  /*
		   * 접근권한
		   * 0 중개사
		   * 1 회원
		   * 2 서비스업체
		   * 3 관리자
		   * 
		   * */
		  
		  //로그인된 상태로, 서비스홈 메인페이지로 보내기
		  response.sendRedirect("/sybang/service/servicemain.do");
		  
		  
		  
	  } else {
		   response.setCharacterEncoding("UTF-8"); 
		   response.setContentType("text/html; charset=UTF-8");
		  
		  //로그인 X
		  PrintWriter writer = response.getWriter();
		  
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('잘못 로그인 정보를 입력하셨거나, 아직 가입이 승인되지 않았습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		  
	  }
	  
	  

   }

}

