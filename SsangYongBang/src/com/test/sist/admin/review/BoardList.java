package com.test.sist.admin.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/review/boardlist.jsp");
		dispatcher.forward(request, response);

	}

}
