package com.test.sist.inquiry;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.inquiry.dao.InquiryDAO;
import com.test.sist.inquiry.dto.InquiryCommentDTO;
import com.test.sist.inquiry.dto.InquiryDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/inquiry/detail.do")
public class Detail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//글 번호
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String page = req.getParameter("page");
		
		InquiryDAO dao = new InquiryDAO();
		
		// 조회수 증가
		if (session.getAttribute("inquiryRead") == null || (boolean)session.getAttribute("inquiryRead") == false) {
			// null : 북마크로 온 사람, freelist로 온 사람 증가
			dao.updateReadcount(seq);
			session.setAttribute("inquiryRead", true);
		}
		
		//글 하나 가져오기
		InquiryDTO dto = dao.detail(seq);
		
		//댓글 가져오기
		ArrayList<InquiryCommentDTO> clist = dao.commentList(seq);
		
		dao.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("clist", clist);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/inquiry/detail.jsp");
		dispatcher.forward(req, resp);
	}
}
