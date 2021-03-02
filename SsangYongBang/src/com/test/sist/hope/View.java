package com.test.sist.hope;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.hope.dao.HopeDAO;
import com.test.sist.hope.dto.HopeDTO;

@WebServlet("/hope/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String access = (String)(session.getAttribute("access") + "");
		
		if (access.equals("null") || Integer.parseInt(access) != 1) {
			accessBack(resp);
			return;
		}
		
		HopeDAO dao = new HopeDAO();
		HopeDTO dto = new HopeDTO();
		
		String seq = req.getParameter("seq");
		
		dto = dao.getItem(seq);
		
		req.setAttribute("dto",dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hope/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void accessBack(HttpServletResponse resp) throws IOException {
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.print("<html><head><meta charset='utf-8'></head><body>");
		writer.print("<script>");
		writer.print("alert('일반 회원으로 로그인하셔야 이용 가능합니다.');");
		writer.print("history.back();");
		writer.print("</script>");
		writer.print("</body></html>");
		
		writer.close();
	}
}