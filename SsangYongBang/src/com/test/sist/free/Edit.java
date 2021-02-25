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
@WebServlet("/free/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//글 번호
		String seq = req.getParameter("seq");
		
		FreeDAO dao = new FreeDAO();
		FreeDTO dto = dao.detail(seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/free/edit.jsp");
		dispatcher.forward(req, resp);
	}
}