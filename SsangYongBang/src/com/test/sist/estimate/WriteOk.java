package com.test.sist.estimate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.service.ServiceDTO;

@WebServlet("/estimate/writeok.do")
public class WriteOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 입력받은 데이터 갖고오기
		//2. DB 작업 insert
		//3. 결과처리
	
		
		HttpSession session = req.getSession();
		
		//1.
		req.setCharacterEncoding("UTF-8");

		
		
		String approvalFSeq = (String) session.getAttribute("approvalFSeq"); //업체승인번호 ->세션에서 가져오기
		String requestSeq = req.getParameter("requestSeq"); //고객요청서번호 -> hidden 태그로 받아오기
		
		int estimatedCost = Integer.parseInt(req.getParameter("estimatedCost")); //예상비용
		String eContent = req.getParameter("eContent"); //상세 내용
		
		//여기까지 가져와야할 데이터 목록들.
		
		//2.
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		
		dto.setApprovalFSeq(approvalFSeq); //업체승인번호
		dto.setRequestSeq(requestSeq); //요청서번호
		
		dto.setEstimatedCost(estimatedCost); //예상비용
		dto.seteContent(eContent); //상세내용
		
		int result = dao.write(dto);
		
		if (result == 1) {
			resp.sendRedirect("/sybang/request/requestlist.do");
		} else {
			
			//글쓰기 실패 -> 경고 + 뒤로 가기
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();			
		}

		
	}

}

