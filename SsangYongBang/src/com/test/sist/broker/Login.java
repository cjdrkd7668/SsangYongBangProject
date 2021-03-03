
package com.test.sist.broker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 중개사가 로그인하기 위한 클래스입니다.
 * @author 황원준
 *
 */
@WebServlet("/broker/login.do")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		
		BrokerDAO dao = new BrokerDAO();
		BrokerDTO dto = new BrokerDTO();

		dto.setEmail(email);
		dto.setPw(pw);

		int result = dao.login(dto); // 1 or 0

		if (result == 1) {
			
			HttpSession session = request.getSession();

			session.setAttribute("email", dto.getEmail());
			
			BrokerDTO bdto = dao.getBroker(email);
			
			
			if (bdto.getApproBrokerSeq() == null || bdto.getApproBrokerSeq() == "") { 
				session.setAttribute("approBrokerSeq", 0);
			} else {				
				//승인 중개사 번호
				session.setAttribute("approBrokerSeq", bdto.getApproBrokerSeq()); //승인 중개사 번호
			};
			
			
			session.setAttribute("seq", bdto.getSeq());
			session.setAttribute("pw", bdto.getPw());
			session.setAttribute("name", bdto.getName());
			session.setAttribute("businessName", bdto.getBusinessName());
			session.setAttribute("brokerNum", bdto.getBrokerNum());
			session.setAttribute("address", bdto.getAddress());
			session.setAttribute("tel", bdto.getTel());
			session.setAttribute("businessNum", bdto.getBusinessNum());
			session.setAttribute("documentURL", bdto.getDocumentURL());

			
			
			session.setAttribute("access", 0);
	
			response.sendRedirect("/sybang/index.do"); //메인 페이지로 이동

		} else {
			// 로그인 실패
			PrintWriter writer = response.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('login failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");

			writer.close();

		}

	}

}