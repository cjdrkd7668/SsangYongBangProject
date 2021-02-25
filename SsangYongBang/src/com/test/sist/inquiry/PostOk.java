package com.test.sist.inquiry;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.inquiry.dao.InquiryDAO;
import com.test.sist.inquiry.dto.InquiryDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/inquiry/postok.do")
public class PostOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String openflag = req.getParameter("openflag");
		String detail = req.getParameter("detail");
		
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = new InquiryDTO();
		
		// 중개사일 경우
		if ((String)session.getAttribute("seq") == null) {
			dto.setAuthorseq((String) session.getAttribute("approBrokerSeq"));
			dto.setZerobonem("0");

		} else {
			// 회원일 경우
			dto.setAuthorseq((String) session.getAttribute("seq"));
			dto.setZerobonem("1");
		}
		
		dto.setSubject(subject);
		dto.setOpenflag(openflag);
		dto.setDetail(detail);
		
		//글 작성
		int result = dao.post(dto);
		
		if (result == 1) {
			//성공 시 글 목록으로 이동
			resp.sendRedirect("/sybang/inquiry/list.do");
		
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
