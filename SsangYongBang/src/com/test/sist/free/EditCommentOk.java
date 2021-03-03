package com.test.sist.free;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.free.dao.FreeCommentDAO;
import com.test.sist.free.dto.FreeCommentDTO;

@WebServlet("/free/editcommentok.do")
public class EditCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 받아오기
		String seq = req.getParameter("seq");
		String detail = req.getParameter("detail");
		
		FreeCommentDTO dto = new FreeCommentDTO();
		dto.setSeq(seq);
		dto.setDetail(detail);
		
		FreeCommentDAO dao = new FreeCommentDAO();
		int result = dao.edit(dto);
		dao.close();
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}
}