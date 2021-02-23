package com.test.codestudy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/deletecommentok.do")
public class DeleteCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(seq, bseq)
		//2. DB 작업 -> delete
		//3. 결과 처리
		
		//1.
		String seq = req.getParameter("seq");//삭제 댓글 번호
		String bseq = req.getParameter("bseq"); //view.do로 돌아갈 때 사용할 글번호
		
		//2.
		BoardDAO dao = new BoardDAO();
		int result = dao.deleteComment(seq);
		
		//3.
		if (result == 1) {
			//글쓰기 성공
			resp.sendRedirect("/codestudy/board/view.do?seq=" + bseq);
			
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









