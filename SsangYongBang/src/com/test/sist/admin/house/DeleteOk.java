package com.test.sist.admin.house;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.house.dao.HouseDAO;

@WebServlet("/admin/house/deleteok.do")
public class DeleteOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//삭제할 글 번호
		String seq = req.getParameter("seq");
		String nowPage = req.getParameter("page");
		
		HouseDAO dao = new HouseDAO();
		//글 삭제
		int result = dao.del(seq);
		
		if (result == 1) {
			resp.sendRedirect("/sybang/admin/house/boardlist.do?page=" + nowPage);
		} else {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><head><meta charset='utf-8'></head><body>");
			writer.print("<script>");
			writer.print("alert('매물 게시글을 삭제하는 것에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
	}
}