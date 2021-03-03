package com.test.sist.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;





@WebServlet("/service/servicejoinok.do")
public class ServiceJoinOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		req.setCharacterEncoding("UTF-8");

		String id = "";
		String categorySeq = "";
		String pw = "";
		String email = "";
		String address = "";
		String tel = "";
		String introduction = "";
		String portfolio = "";
		int result = 0;
		
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					req,
					req.getRealPath("/files"),
					1024 * 1024 * 10,
					"UTF-8",
					new DefaultFileRenamePolicy()					
				);

			id = multi.getParameter("id");
			categorySeq = multi.getParameter("categorySeq");
			pw = multi.getParameter("pw");
			email = multi.getParameter("email");
			address = multi.getParameter("address");
			tel = multi.getParameter("tel");
			introduction = multi.getParameter("introduction");
			portfolio = multi.getFilesystemName("portfolio");
			
			
			ServiceDAO dao = new ServiceDAO();
			ServiceDTO dto = new ServiceDTO();
			
			dto.setId(id);
			dto.setCategorySeq(categorySeq);
			dto.setPw(pw);
			dto.setEmail(email);
			dto.setAddress(address);
			dto.setTel(tel);
			dto.setIntroduction(introduction);
			dto.setPortfolio(portfolio);

			result = dao.add(dto);
	
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		if (result == 1) {
			
			resp.sendRedirect("/sybang/service/servicemain.do");
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

