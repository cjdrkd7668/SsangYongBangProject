package com.test.sist.free;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.free.dao.FreeDAO;
import com.test.sist.free.dto.FreeDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/free/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		//수정할 글 번호
		String seq = req.getParameter("seq");
		String subject = req.getParameter("subject");
		String detail = req.getParameter("detail");
		
		FreeDAO dao = new FreeDAO();
		FreeDTO dto = new FreeDTO();
		
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setDetail(detail);
		
		//글 수정하기
		int result = dao.edit(dto);
		
		if (result == 1) {
			
			//수정 성공 시
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('수정되었습니다.'); location.href='/sybang/free/detail.do?seq=" + seq +"';");
			writer.print("</script>");
			writer.print("</body></html>");
		
		} else {
			
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
