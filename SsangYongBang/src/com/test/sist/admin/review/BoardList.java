package com.test.sist.admin.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.inc.Pagination;

@WebServlet("/admin/review/boardlist.do")
public class BoardList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*select rdv.*, 
(select content from tblBrokerReview where seq = rdv.rvdSeq) as brvContent,
(select imgurl from tblBrokerReview where seq = rdv.rvdSeq) as brvImgURL,
(select (select email from tblmember where seq = brv.memberseq) from tblBrokerReview brv where seq = rdv.rvdSeq) as brvId,
(select (select name from tblmember where seq = brv.memberseq) from tblBrokerReview brv where seq = rdv.rvdseq) as brvName
from vwBReviewDeleteList rdv;  */
		
		//현재 페이지 수 구하기
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한페이지 당 출력 개수
		int blockSize = 10;		//페이지바 사이즈
		
		String page = request.getParameter("page");
		
		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//페이지 당 첫 글과 마지막 글에 대한 인덱스 구하기
		int begin = 0;			//rnum 시작
		int end = 0;			//rnum 끝
		HashMap<String, String> map = new HashMap<String, String>();
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		//글 목록
		AdminReviewDAO dao = new AdminReviewDAO();
		
		ArrayList<AdminReviewDTO> list = dao.getList(map);
		
		//페이지 바
		totalCount = dao.getTotalCountReviewDel(); //총 게시물 수
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/sybang/admin/review/boardlist.do");
		
		//목록 전달
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/review/boardlist.jsp");
		dispatcher.forward(request, response);

	}

}
