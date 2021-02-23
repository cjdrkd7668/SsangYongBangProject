package com.test.codestudy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq, subject, content)
		//2. DB 작업 -> update
		//3. 결과 반환 -> 알림
		
		HttpSession session = req.getSession();
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String seq = req.getParameter("seq"); //수정할 글번호
		
		
		//2.
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setSeq(seq); //글번호
		
		int result = dao.edit(dto); //글수정하기
		
		if (result == 1) {
			//글수정 성공 -> 게시판 목록으로 이동
			//resp.sendRedirect("/codestudy/board/list.do");
			
			//글수정 성공 -> 글보기로 이동(view.do)
			//http://localhost:8090/codestudy/board/view.do?seq=8
			resp.sendRedirect("/codestudy/board/view.do?seq=" + seq);
			
			
		} else {
			//글수정 실패 -> 경고 + 뒤로 가기
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






