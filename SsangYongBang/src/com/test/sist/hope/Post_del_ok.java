package com.test.sist.hope;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.hope.dao.HopeDAO;
import com.test.sist.hope.dto.HopeDTO;

@WebServlet("/hope/post_del_ok.do")
public class Post_del_ok extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String access = (String)(session.getAttribute("access") + "");
		
		if (access.equals("null") || Integer.parseInt(access) != 1) {
			accessBack(resp);
			
			return;
		}
		
		String seq = req.getParameter("seq");
		
		
		HopeDTO dto = new HopeDTO();
		HopeDAO dao = new HopeDAO();
		
		if (seq == null) {
			String seqs = req.getParameter("seqs");
			seq = seqs = "'" + seqs.replace(",","','") + "'";
		}
		int result = dao.remove(seq);
		
		
//		if (result == 1) {
			//삭제 성공
			resp.sendRedirect("/sybang/hope/list.do");
			
//		} else {
//			//삭제 실패 -> 경고 + 뒤로 가기
//			PrintWriter writer = resp.getWriter();
//			resp.setContentType("text/html; charset=UTF-8");
//			
//			writer.print("<html><body>");
//			writer.print("<script>");
//			writer.print("alert('삭제 실패');");
//			writer.print("history.back();");
//			writer.print("</script>");
//			writer.print("</body></html>");
//			
//			writer.close();
//		}

		
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