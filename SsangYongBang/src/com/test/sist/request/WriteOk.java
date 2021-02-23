package com.test.sist.request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/request/writeok.do")
public class WriteOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//1. 입력받은 데이터 가져오기
		//2. db작업 insert
		//3. 결과 처리
		
		HttpSession session = req.getSession();
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String address = req.getParameter("address"); //주소
		String shape = req.getParameter("shape"); //가옥형태
		String desiredDay = req.getParameter("desiredDay"); //희망서비스일
		String detail = req.getParameter("detail"); //상세사항
		String area = req.getParameter("area"); //평수
		String serviceSeq = req.getParameter("serviceSeq"); //서비스카테고리품목번호
		
		String memberSeq = (String) session.getAttribute("seq");
		//로그인한 회원번호(세션에 담아둔 것 가져오기->별도 승인테이블없이 회원테이블 번호)
		
		//여기까지 가져와야 할 데이터들
		
		//2.
		BoardDAO dao = new BoardDAO(); //전체고객요청서 목록
		BoardDTO dto = new BoardDTO(); //전체요청서 목록
		
		dto.setAddress(address);
		dto.setShape(shape);
		dto.setDesiredDay(desiredDay);
		dto.setDetail(detail);
		dto.setArea(area);
		dto.setServiceSeq(serviceSeq);
		
		dto.setMseq(memberSeq);
		
		int result = dao.write(dto);
		
		if (result == 1) {
			resp.sendRedirect("/sybang/request/requestlist.do");
			//교객 요청서를 썼으니 직접 전체리스트에서 확인 가능하돌록 보내기
		} else {
			
			//글쓰기 실패 -> 경고 + 뒤로 가기
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();				
			
		}
		
		
		
		
	}

}

