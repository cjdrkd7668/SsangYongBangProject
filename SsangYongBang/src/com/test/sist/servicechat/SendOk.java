package com.test.sist.servicechat;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servicechat/sendok.do")
public class SendOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. 받은 데이터 가져오기(estimate1thSeq 견적서번호, whoFlag 글쓴이 식별정보)
		//2. db작업 > insert
		//3. 결과 처리
	
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		System.out.println(111);
		
		String estimate1thSeq = req.getParameter("estimate1thSeq"); //견적서번호
		String whoFlag = req.getParameter("whoFlag");  //글쓴이 식별정보
		String chatContent = req.getParameter("chatContent"); //글내용
		
		System.out.println(estimate1thSeq);
		System.out.println(whoFlag);
		System.out.println(chatContent);
		System.out.println(111);
		
		//받아올 정보들
		
		//2.
		ChatDAO dao = new ChatDAO();
		ChatDTO dto = new ChatDTO();
		
		HttpSession session = req.getSession();
		
		dto.setEstimate1thSeq(estimate1thSeq);
		dto.setWhoFlag(whoFlag);
		dto.setChatContent(chatContent);
		
		int result = dao.send(dto);
		
		//3.
		
		if (result == 1 && whoFlag.equals("1")) {
			//주소 보낼 때 이 사람이 대화하던 상대와의 대화방으로 가야한다. whoFlag가 1이라면 업체 
			resp.sendRedirect("/sybang/servicechat/servicechat.do?estimate1thSeq=" + estimate1thSeq);
			
		} else if (result == 1 && whoFlag.equals("0")) {
			//주소 보낼 때 이 사람이 대화하던 상대와의 대화방으로 가야한다. whoFlag가 0이라면 회원 
			resp.sendRedirect("/sybang/servicechat/memberchat.do?estimate1thSeq=" + estimate1thSeq);
			
		} 
		else {
		
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
