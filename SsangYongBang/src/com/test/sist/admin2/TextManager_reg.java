package com.test.sist.admin2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.DBUtil;
import com.test.sist.admin2.dao.TextManagerDAO;
import com.test.sist.admin2.dto.TextManagerDTO;

@WebServlet("/admin2/textManager_reg.do")
public class TextManager_reg extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");
		String seq = req.getParameter("seq");
		
		TextManagerDAO dao = new TextManagerDAO();
		TextManagerDTO dto = dao.get(seq);
		
		req.setAttribute("dto",dto);
		req.setAttribute("type",type);
		req.setAttribute("seq",seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/textManager_reg.jsp");
		dispatcher.forward(req, resp);
	}
}























