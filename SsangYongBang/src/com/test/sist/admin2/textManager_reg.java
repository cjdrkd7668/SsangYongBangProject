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

@WebServlet("/admin2/textManager_reg.do")
public class textManager_reg extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		textManagerDAO dao = new textManagerDAO();
		
		textManagerDTO dto = dao.get(seq);
		
		req.setAttribute("dto",dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/textManager_reg.jsp");
		dispatcher.forward(req, resp);
	}
}























