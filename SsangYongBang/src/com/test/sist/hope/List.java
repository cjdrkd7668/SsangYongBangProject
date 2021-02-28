package com.test.sist.hope;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.hope.dao.HopeDAO;
import com.test.sist.hope.dto.HopeDTO;

@WebServlet("/hope/list.do")
public class List extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HopeDAO dao = new HopeDAO();
		HopeDTO dto = new HopeDTO();
		ArrayList<HopeDTO> list = dao.getList();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hope/list.jsp");
		dispatcher.forward(req, resp);
	}
}