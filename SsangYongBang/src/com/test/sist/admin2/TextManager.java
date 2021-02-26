package com.test.sist.admin2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.admin2.dao.TextManagerDAO;
import com.test.sist.admin2.dto.TextManagerDTO;

@WebServlet("/admin2/textManager.do")
public class TextManager extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TextManagerDAO dao = new TextManagerDAO();
		
		ArrayList<TextManagerDTO> list = dao.list();
		
		req.setAttribute("list",list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/textManager.jsp");
		dispatcher.forward(req, resp);
	}
}























