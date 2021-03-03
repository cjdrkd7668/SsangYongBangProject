package com.test.sist.broker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/broker/joinok.do")
public class JoinOk extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		request.setCharacterEncoding("UTF-8");
		
		String email = "";
		String pw = "";
		String name = "";
		String businessName = "";
		String brokerNum = "";
		String address = "";
		String tel = "";
		String businessNum = "";
		String documentURL = "";
		int result = 0;
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					request,
					request.getRealPath("/files"),
					1024 * 1024 * 10,
					"UTF-8",
					new DefaultFileRenamePolicy()					
				);
		
			email = multi.getParameter("email");
			pw = multi.getParameter("pw");
			name = multi.getParameter("name");
			businessName = multi.getParameter("businessName");
			brokerNum = multi.getParameter("brokerNum");
			address = multi.getParameter("address");
			tel = multi.getParameter("tel");
			businessNum = multi.getParameter("businessNum");
			documentURL = multi.getFilesystemName("documentURL");
			
			
			BrokerDAO dao = new BrokerDAO();
			BrokerDTO dto = new BrokerDTO();
			
			dto.setEmail(email);
			dto.setPw(pw);
			dto.setName(name);
			dto.setBusinessName(businessName);
			dto.setBrokerNum(brokerNum);
			dto.setAddress(address);
			dto.setTel(tel);
			dto.setBusinessNum(businessNum);
			dto.setDocumentURL(documentURL);

			result = dao.add(dto);
	
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		if (result == 1) {
			
			response.sendRedirect("/sybang/index.do");
		
		} else {
			//회원 가입 실패
			PrintWriter writer = response.getWriter();
			
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
