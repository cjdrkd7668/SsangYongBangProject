package com.test.sist.admin2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.admin2.dao.Config_siteDAO;
import com.test.sist.admin2.dto.AdminDTO;
import com.test.sist.admin2.dto.SiteInfoDTO;

@WebServlet("/admin2/config_site.do")
public class Config_site extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//TODO 임시로 시퀀스 상수처리
		String seq = "1";
		HttpSession session = req.getSession();
		
		session.setAttribute("seq",seq);
		
		Config_siteDAO dao = new Config_siteDAO();
		SiteInfoDTO sdto = dao.getSiteInfo(); //사이트정보 요청
		AdminDTO adto = dao.getAdminInfo(seq); //접속한 id와 일치하는 admin정보 요청
		
		req.setAttribute("adto",adto);
		req.setAttribute("sdto",sdto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin2/config_site.jsp");
		dispatcher.forward(req, resp);
		
	}
}

















