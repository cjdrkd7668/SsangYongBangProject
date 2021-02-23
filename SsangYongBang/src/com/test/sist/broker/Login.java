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

		// 3.
		if (result == 1) {
			// 로그인 성공

			// 서블릿에서 세션을 접근하는 방법
			HttpSession session = request.getSession();

			session.setAttribute("email", dto.getEmail()); // 인증 티켓

			// 사이트 전역을 계속 들고 다녀야 하는 정보가 있으면 -> 세션에 추가
			// 나머지 회원 정보 얻기 위해서 -> select 즉, DB를 한 번 더 갔다와야 함
			BrokerDTO bdto = dao.getMember(email);

			session.setAttribute("approBrokerSeq", bdto.getApproBrokerSeq()); //승인 중개사 번호

			response.sendRedirect("/sybang/index.do"); //메인 페이지로 이동

		} else {
			// 로그인 실패
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
