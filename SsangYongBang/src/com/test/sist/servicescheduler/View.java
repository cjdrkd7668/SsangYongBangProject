package com.test.sist.servicescheduler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servicescheduler/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
				
		String EstimateURL = req.getParameter("EstimateURL"); //견적서 이미지

		req.setAttribute("EstimateURL", EstimateURL);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicescheduler/view.jsp");
		dispatcher.forward(req, resp);
	}

}

