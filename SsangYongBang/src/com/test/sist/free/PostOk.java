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
import com.test.sist.free.dto.FreeDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/free/postok.do")
public class PostOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		//데이터 가져오기
		String subject = req.getParameter("subject");
		String detail = req.getParameter("detail");
		
		FreeDAO dao = new FreeDAO();
		FreeDTO dto = new FreeDTO();

		//중개사일 경우
		if ((String)session.getAttribute("seq") == null) {
			dto.setAuthorseq((String)session.getAttribute("approBrokerSeq"));
			dto.setZerobonem("0");
			
		} else {
			//회원일 경우
			dto.setAuthorseq((String)session.getAttribute("seq"));
			dto.setZerobonem("1");
		}
		
		
		dto.setSubject(subject);
		dto.setDetail(detail);
		
		//글쓰기
		int result = dao.post(dto);
		
		if (result == 1) {
			
			//성공 시
			resp.sendRedirect("/sybang/free/list.do");
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