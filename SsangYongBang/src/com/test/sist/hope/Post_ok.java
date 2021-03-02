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

@WebServlet("/hope/post_ok.do")
public class Post_ok extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		String access = (String)(session.getAttribute("access") + "");
		
		if (access.equals("null") || Integer.parseInt(access) != 1) {
			accessBack(resp);
			
			return;
		}
		
		req.setCharacterEncoding("UTF-8");
		
		HopeDAO dao = new HopeDAO();
		HopeDTO dto = new HopeDTO();
		
		String seq = req.getParameter("seq");
		
		dto.setMseq((String) session.getAttribute("seq")); //회원 번호
		dto.setMname((String) session.getAttribute("name")); //회원 이름
		dto.setPhone((String) session.getAttribute("phone")); //회원 전화번호
		dto.sethDType(req.getParameter("hDType")); //희망거래유형
		dto.sethPrice(req.getParameter("hPrice")); //희망가격
		dto.sethRent(req.getParameter("hRent")); //희망월세
		dto.sethAddress(req.getParameter("hAddress")); //지역
		dto.sethAddressC(req.getParameter("hAddressC")); //지역
		dto.sethArea(req.getParameter("hArea")); //희망면적(전용면적)
		dto.sethRoomNum(req.getParameter("hRoomNum")); //희망방개수
		dto.setContent(req.getParameter("content")); //내용
		
		if (seq != null) { //수정
			System.out.println("seq222 : " + seq);
			
			int result = dao.edit(dto);
			
			if (result == 1) {
				//수정 성공
				resp.sendRedirect("/sybang/hope/view.do?seq=" + seq);
				
			} else {
				//수정 실패 -> 경고 + 뒤로 가기
				PrintWriter writer = resp.getWriter();
				resp.setContentType("text/html; charset=UTF-8");
				
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('수정 실패');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			}
		}
		
		int result = dao.write(dto);
		
		
		if (result == 1) {
			//등록 성공
			resp.sendRedirect("/sybang/hope/list.do");
			
		} else {
			//등록 실패 -> 경고 + 뒤로 가기
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			resp.setContentType("text/html; charset=UTF-8");
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('정보를 확인해주세요');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}	
		
		
		
		
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