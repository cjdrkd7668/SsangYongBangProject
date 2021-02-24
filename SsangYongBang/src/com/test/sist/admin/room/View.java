package com.test.sist.admin.room;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.room.RoomDAO;
import com.test.sist.room.RoomDTO;

@WebServlet("/admin/room/view.do")
public class View extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//글 번호, 돌아갈 페이지 가져오기
		String seq = request.getParameter("seq");
		String nowPage = request.getParameter("nowPage");
		
		//특정 글 정보 가져오기
		RoomDAO dao = new RoomDAO();
		RoomDTO dto = dao.get(seq);
		
		
		
		//글 정보 전달
		request.setAttribute("seq", dto);
		request.setAttribute(seq, dto);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/room/view.jsp");
		dispatcher.forward(request, response);

	}

}
