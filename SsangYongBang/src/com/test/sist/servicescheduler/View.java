package com.test.sist.servicescheduler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 이 클래스는 /WEB-INF/views/servicescheduler/writeschedule.jsp 로부터 입력받은 정보에 대한 DB 업무를 하는 클래스이다.
 *
 *
 * jsondata :  클래스로부터 전달받은 json data를 통해 풀캘린더 events 객체에 담긴 견적서이미지 출력주소 페이지 + 견적서 파일명
 * @author 김소리
 * */

@WebServlet("/servicescheduler/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
				
		String EstimateURL = req.getParameter("EstimateURL"); //견적서 이미지

		req.setAttribute("EstimateURL", EstimateURL);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/servicescheduler/view.jsp");
		dispatcher.forward(req, resp);
	}

}

