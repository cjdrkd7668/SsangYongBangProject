package com.test.sist.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/myreviewdata.do")
public class MyReviewData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		//회원 번호
		String mseq = req.getParameter("mseq");
		
		MyInfoDAO dao = new MyInfoDAO();
		
		ArrayList<MyInfoDTO> rlist = dao.reviewList(mseq);
		
		String temp = "";
		
		temp += "[";

		for (MyInfoDTO dto : rlist) {

			temp += "{";
			temp += String.format("\"seq\":\"%s\",", dto.getSeq()); // 후기 번호
			temp += String.format("\"regdate\":\"%s\",", dto.getRegdate()); // 날짜
			temp += String.format("\"detail\":\"%s\",", dto.getDetail()); // 내용
			temp += String.format("\"star\":\"%s\",", dto.getStar()); // 평점
			temp += String.format("\"bname\":\"%s\"", dto.getBname()); // 중개사
			temp += "}";
			temp += ",";
		}

		temp = temp.substring(0, temp.length() - 1);
		temp += "]";

		writer.print(temp);

		writer.close();
	}
}
