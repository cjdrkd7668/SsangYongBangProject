package com.test.sist.broker;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.room.RoomDAO;
/**
 * 중개사의 탈퇴하기 위한 클래스입니다.
 * @author 황원준
 *
 */
@WebServlet("/broker/deleteOk.do")
public class DeleteOk extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//수정할 내용 가져오기
		HttpSession session = request.getSession();
		String brkEmail = (String)session.getAttribute("email");
		
		//삭제하기
		BrokerDAO dao = new BrokerDAO();
		
		int result = dao.deleteBroker(brkEmail);
		
		if (result == 1) {
			//성공
			response.sendRedirect("/sybang/index.do");
		} else {
			//실패
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			
			writer.print("<html><head><meta charset='utf-8'></head><body>");
			writer.print("<script>");
			writer.print("alert('회원 탈퇴에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		
	}

}
