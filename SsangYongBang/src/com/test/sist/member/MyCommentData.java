package com.test.sist.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/mycommentdata.do")
public class MyCommentData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
	
		//작성자 번호를 받는다
		String authorseq = req.getParameter("authorseq");
		
		MyInfoDAO dao = new MyInfoDAO();
		//댓글 목록을 가져온다
		ArrayList<MyInfoDTO> clist = dao.commentList(authorseq);
		
		String temp = "";
		
		temp += "[";
		
		for (MyInfoDTO dto : clist) {
			
			temp += "{";
			temp += String.format("\"seq\":\"%s\",", dto.getSeq()); //댓글 번호
			temp += String.format("\"regdate\":\"%s\",", dto.getRegdate()); //날짜
			temp += String.format("\"detail\":\"%s\",", dto.getDetail()); //내용
			temp += String.format("\"subject\":\"%s\",", dto.getSubject()); //원문 제목
			temp += String.format("\"gap\":\"%d\"", dto.getGap()); //시간 차
			temp += "}";
			temp += ",";
		}
		
		temp = temp.substring(0, temp.length() - 1);
		temp += "]";
		
		writer.print(temp);
		
		writer.close();
	}
}