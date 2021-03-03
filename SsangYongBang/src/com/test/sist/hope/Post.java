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

import com.test.sist.hope.dto.HopeDTO;

@WebServlet("/hope/post.do")
public class Post extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String access = (String)(session.getAttribute("access") + "");
		
		if (access.equals("null") || Integer.parseInt(access) != 1) {
			accessBack(resp);
			return;
		}
		
		HopeDTO dto = new HopeDTO();
		String seq = req.getParameter("seq");
		
		if (seq != null) {
			
			dto.setSeq(seq); //글 번호
			dto.setMseq((String) session.getAttribute("seq")); //회원 번호
			dto.setMname(req.getParameter("mname")); //회원 이름
			dto.setPhone(req.getParameter("phone")); //회원 전화번호
			dto.sethDType(req.getParameter("hDType")); //희망거래유형
			dto.sethPrice(req.getParameter("hPrice")); //희망가격
			dto.sethRent(req.getParameter("hRent")); //희망월세
			dto.sethAddress(req.getParameter("hAddress")); //지역
			dto.sethArea(req.getParameter("hArea")); //희망면적(전용면적)
			dto.sethRoomNum(req.getParameter("hRoomNum")); //희망방개수
			dto.setContent(req.getParameter("content")); //내용
			
			req.setAttribute("dto",dto);
		}
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hope/post.jsp");
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