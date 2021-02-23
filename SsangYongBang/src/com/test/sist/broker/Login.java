
package com.test.sist.broker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/broker/login.do")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 데이터 가져오기(email, pw)
		// 2. DB 작업 > select(등록된 회원이 맞는지 확인)
		// 3. 결과 처리

		// 1.
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		// 2.
		BrokerDAO dao = new BrokerDAO();
		BrokerDTO dto = new BrokerDTO();

		dto.setEmail(email);
		dto.setPw(pw);

		int result = dao.login(dto); // 1 or 0

		HttpSession session = request.getSession();

		if (result == 1) {
			
			BrokerDTO bdto = dao.getBroker(email);
			
			if (bdto.getApproBrokerSeq() == null || bdto.getApproBrokerSeq() == "") { 
				session.setAttribute("approBrokerSeq", 0);
			};
			
			session.setAttribute("email", email);
			
			
			//승인 중개사 번호
			session.setAttribute("approBrokerSeq", bdto.getApproBrokerSeq()); //승인 중개사 번호

			
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