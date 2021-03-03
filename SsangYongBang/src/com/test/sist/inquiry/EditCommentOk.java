package com.test.sist.inquiry;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.inquiry.dao.InquiryCommentDAO;
import com.test.sist.inquiry.dto.InquiryCommentDTO;

@WebServlet("/inquiry/editcommentok.do")
public class EditCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 받아오기
		String seq = req.getParameter("seq");
		String detail = req.getParameter("detail");
		
		InquiryCommentDTO dto = new InquiryCommentDTO();
		dto.setSeq(seq);
		dto.setDetail(detail);
		
		InquiryCommentDAO dao = new InquiryCommentDAO();
		int result = dao.edit(dto);
		dao.close();
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}
}