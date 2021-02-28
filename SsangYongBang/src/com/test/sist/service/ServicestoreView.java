package com.test.sist.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/service/ServicestoreView.do")
public class ServicestoreView extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   //1. 데이터 가져오기
	   //2. DB작업 -> select
	   //3. 결과 반환 -> JSP 호출하기 + 전달
	   
	   HttpSession session = request.getSession();
	   
	   
	   //1.
	   String approvalFseq = request.getParameter("approvalFseq"); //스트링쿼리로 넘겨받은 업체승인번호
	   //String search = 
	   //String page = 
	   
	   System.out.println(approvalFseq); //
	   System.out.println("뷰 화면에서 업체승인번호가 넘어왔는지 콘솔확인(위 번호 확인)");
	   
	   //2. 
	   ServiceBoardDAO dao = new ServiceBoardDAO();
	   
	   ServiceDTO dto = dao.get(approvalFseq); //업체승인번호를 매개로 하여 해당업체  가져오는 메서드 호출하기
	   ArrayList<ServiceDTO> rlist = dao.listReview(approvalFseq);//업체승인번호 매개. 후기 목록 가져오기
	   //System.out.println(dto.getId() + "해당업체 정보 한 줄 ");
	   //여기서 계속 오류난다.
	   
	   //에러확인 -> rlist로 받아온 정보를 콘솔에서 확인하기
	   for (ServiceDTO rdto : rlist) {
		   System.out.println(rdto.getReviewContent() + "리뷰글");
	   }
	   
	   dao.close();
	   
	   
	   //2.5 데이터 조작
	   
	   
	   //3.
	   request.setAttribute("dto", dto);
	   request.setAttribute("rlist", rlist);
	   //request.setAttribute("search", o);
	   //우선 검색어, 페이징은 넘기지 말고 시연
	   
      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/service/servicestoreview.jsp");
      dispatcher.forward(request, response);
      
   }

}

