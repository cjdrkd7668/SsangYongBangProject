package com.test.codestudy.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/registerok.do")
public class RegisterOk extends HttpServlet {
	
	//doGet or doPost
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. 파일 업로드 처리(pic)
		//3. DB 작업 > insert
		//4. 결과 반환 > 처리
		
		//1. + 2.
		req.setCharacterEncoding("UTF-8");
		
		String id = "";
		String name = "";
		String email = "";
		String pw = "";
		String pic = "";
		int result = 0; //업무 결과
		
		try {
			
			//WebContent > WEB-INF > lib > 
			// - cos.jar
			// - jstl-1.2.jar
			// - ojdbc6.jar
			
			//파일업로드 완료
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/pic"),
										1024 * 1024 * 10,
										"UTF-8",
										new DefaultFileRenamePolicy()					
									);
			
			System.out.println(req.getRealPath("/pic"));
			
			
			//첨부파일명 -> 첨부파일을 안눌렀으면? -> null or ""
			//System.out.println(multi.getFilesystemName("pic"));
			
			//req.getParameter() -> multi.getParameter()
			id = multi.getParameter("id");
			name = multi.getParameter("name");
			email = multi.getParameter("email");
			pw = multi.getParameter("pw");
			pic = multi.getFilesystemName("pic") != null ?
						multi.getFilesystemName("pic") : "nopic.png";
			
			System.out.println(pic);
			
			//DB 작업 -> 위임
			// - DAO + DTO
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			
			dto.setId(id);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPw(pw);
			dto.setPic(pic);
			
			result = dao.add(dto); //위임 -> 1(성공) 0(실패)
						
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		//결과 : JSP 작업 X -> Servlet 작업 O
		if (result == 1) {
			//회원 가입 성공
			resp.sendRedirect("/codestudy/index.do");
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












