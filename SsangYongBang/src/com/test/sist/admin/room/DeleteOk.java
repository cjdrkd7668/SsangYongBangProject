package com.test.sist.admin.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.room.RoomDAO;

@WebServlet("/admin/room/deleteOk.do")
public class DeleteOk extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//글 번호, 돌아갈 페이지 가져오기
		String seq = request.getParameter("seq");
		String nowPage = request.getParameter("page");
		
		//삭제하기
		RoomDAO dao = new RoomDAO();
		int result = dao.deleteRoom(seq);
		
		if (result == 1) {
			//성공
			response.sendRedirect("/sybang/admin/room/boardlist.do?page=" + nowPage);
		} else {
			//실패
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			
			writer.print("<html><head><meta charset='utf-8'></head><body>");
			writer.print("<script>");
			writer.print("alert('방 게시글을 삭제하는 것에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		
	}

}
