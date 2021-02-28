package com.test.sist.broker.room;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.room.RoomDAO;
import com.test.sist.room.RoomDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/broker/room/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 글 번호, 돌아갈 페이지 가져오기
		String seq = req.getParameter("seq");
		String nowPage = req.getParameter("page");

		// 특정 글 정보 가져오기
		RoomDAO dao = new RoomDAO();
		RoomDTO rdto = dao.getRoom(seq);
		ArrayList<String> iList = dao.getImg(seq);

		// 글 정보 전달
		req.setAttribute("rdto", rdto);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("iList", iList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/broker/room/view.jsp");
		dispatcher.forward(req, resp);
	}
}