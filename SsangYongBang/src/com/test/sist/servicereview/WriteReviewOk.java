package com.test.sist.servicereview;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.sist.service.ServiceDAO;
import com.test.sist.service.ServiceDTO;
import com.test.sist.servicescheduler.SchedulerDAO;
import com.test.sist.servicescheduler.SchedulerDTO;

@WebServlet("/servicereview/writereviewok.do")
public class WriteReviewOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//1. 데이터 가져오기(subjecct, content)
		//2. DB작업 > insert
		//3. 결과처리
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String memberSeq = req.getParameter("memberSeq");
		
		//String memberSeq = "";
		String content = "";
		String contentURL = "";
		String completionSeq = "";
		int result = 0;
		
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					req,
					req.getRealPath("/files"),
					1024 * 1024 * 10,
					"UTF-8",
					new DefaultFileRenamePolicy()					
				);

			content = multi.getParameter("content");
			completionSeq = multi.getParameter("completionSeq");
			contentURL = multi.getFilesystemName("contentURL");
			memberSeq = multi.getParameter("memberSeq");
			
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = new BoardDTO();
			
			dto.setContentURL(contentURL);
			dto.setReviewContent(content);
			dto.setCompletionSeq(completionSeq);
			dto.setMemberSeq(memberSeq);
			
			result = dao.add(dto);
	
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		if (result == 1) {
			
			resp.sendRedirect("/sybang/servicereview/servicereview.do");
			//업체 회원가입 성공 시, 서비스업체 메인 페이지로 보내기
			
			
		} else {
			//회원 가입 실패
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

