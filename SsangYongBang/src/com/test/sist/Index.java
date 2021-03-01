package com.test.sist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.free.dao.FreeDAO;
import com.test.sist.free.dto.FreeDTO;
import com.test.sist.house.dao.HouseDAO;
import com.test.sist.house.dto.HouseDTO;
import com.test.sist.news.NewsDAO;
import com.test.sist.news.NewsDTO;


@WebServlet("/index.do")
public class Index extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HashMap<String, String> map = new HashMap<String, String>();

		// 검색어
		String search = request.getParameter("search");

		// 검색어 map에 저장
		if (!(search == null || search.equals(""))) {
			map.put("search", search);
		}

		HttpSession session = request.getSession();

		FreeDAO dao = new FreeDAO();

		// 인기글 가져오기
		ArrayList<FreeDTO> plist = dao.popular();

		// 제목 길이 수정
		for (FreeDTO dto : plist) {

			if (dto.getSubject().length() > 25) {
				dto.setSubject(dto.getSubject().substring(0, 25) + "...");
			}
		}

		// 최신글 가져오기
		ArrayList<FreeDTO> llist = dao.latest();

		// 제목 길이 수정
		for (FreeDTO dto : llist) {

			if (dto.getSubject().length() > 25) {
				dto.setSubject(dto.getSubject().substring(0, 25) + "...");
			}
		}

		// 방금 올라온 매물 가져오기
		HouseDAO hdao = new HouseDAO();
		ArrayList<HouseDTO> hlist = hdao.latest();
		
		for (HouseDTO dto : hlist) {
			
			dto.setAddress(dto.getAddress().substring(dto.getAddress().lastIndexOf("구")+1));

			if (dto.getSubject().length() > 10) {
				dto.setSubject(dto.getSubject().substring(0, 10) + "...");
			}
			
			//이미지 가져오기
			ArrayList<String> ilist = hdao.getImg(dto.getSeq());

			for (String img : ilist) {
				dto.setUrl1(img);
				dto.setUrl2(img);
			}
		}	
		
		//뉴스 가져오기
		NewsDAO ndao = new NewsDAO();
		ArrayList<NewsDTO> nlist = ndao.list();
		

		request.setAttribute("plist", plist);
		request.setAttribute("llist", llist);
		request.setAttribute("hlist", hlist);
		request.setAttribute("nlist", nlist);

		request.setAttribute("search", search);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispatcher.forward(request, response);

	}

}
