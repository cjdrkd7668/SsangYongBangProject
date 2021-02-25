package com.test.sist.free;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.free.dao.FreeDAO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/free/deleteok.do")
public class DeleteOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session =req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		//글 번호 받기
		String seq = req.getParameter("seq");
		
		FreeDAO dao = new FreeDAO();
		
		//글 삭제
		int result = dao.del(seq);
		
		if (result == 1) {
			
			//삭제 성공 시 -> 자유게시판 목록으로 이동
			resp.sendRedirect("/sybang/free/list.do");
		} else {
			
			//삭제 실패 시
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