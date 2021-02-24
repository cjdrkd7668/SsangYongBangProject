package com.test.sist.estimate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/estimate/adoptok.do")
public class AdoptOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//입력받은 데이터 가져오기
		//DB작업 (이번엔 프로시저 활용 예정)
		// 결과 처리
		
		
		//1.
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String approvalFSeq = req.getParameter("approvalFSeq"); //업체승인번호 가져오기
		String estimate1thSeq = req.getParameter("estimate1thSeq"); // 해당견적서(채택버튼누른 후) 가져오기
		String firmName = req.getParameter("firmName"); //채택한 업체의 이름 가져오기
		
		String memberSeq = (String) session.getAttribute("seq"); // 로그인한 회원의 세션에서 회원번호 가져오기
		
		//여기까지 필요한 정보들 가져오기
		
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setApprovalFSeq(approvalFSeq); //업체 승인번호
		dto.setSeq(estimate1thSeq); //채택한 업체 견적서 번호
		dto.setFirmName(firmName); // 채택한 업체명
		
		
		//dto.setMseq(memberSeq); //여기서 왜 오류가 나는가?...
		System.out.println(estimate1thSeq); //1번이 뜬다.. 뭔가 다른 번호가 가져와졌다 -> 번호 43이 떠야 된다
		System.out.println("위점검필요");
		int result = dao.adopt(dto);
		System.out.println(222);
		
		if (result == 1) {
			
			resp.sendRedirect("/sybang/servicechat/servicechat.do");
			//1:1 온라인문의로 보내보기
		} else {
			
			//채택 실패 -> 경고 + 뒤로 가기
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
