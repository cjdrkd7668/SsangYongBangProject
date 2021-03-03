package com.test.sist.free;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.free.dao.FreeCommentDAO;
import com.test.sist.free.dto.FreeCommentDTO;

@WebServlet("/free/commentok.do")
public class CommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		//게시글 번호
		String frseq = req.getParameter("frseq");

		//댓글 내용
		String detail = req.getParameter("detail");
		
		FreeCommentDAO dao = new FreeCommentDAO();
		FreeCommentDTO dto = new FreeCommentDTO();
		
		dto.setFrseq(frseq);
		dto.setDetail(detail);
		
		// 중개사일 경우
		if ((String) session.getAttribute("seq") == null) {
			dto.setAuthorseq((String)session.getAttribute("approBrokerSeq"));
			dto.setZerobonem("0");

		} else {
			// 회원일 경우
			dto.setAuthorseq((String)session.getAttribute("seq"));
			dto.setZerobonem("1");
		}
		
		//댓글 작성
		int result = dao.post(dto);
		
		if (result == 1) {
			
			//성공 시 보고 있던 게시글로 이동
			resp.sendRedirect("/sybang/free/detail.do?seq=" + frseq);
			
		} else {
			
			//실패 시
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