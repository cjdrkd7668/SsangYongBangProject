package com.test.sist.admin2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.admin2.dao.Config_siteDAO;
import com.test.sist.admin2.dto.AdminDTO;
import com.test.sist.admin2.dto.SiteInfoDTO;

@WebServlet("/admin2/config_site_data.do")
public class Config_site_data extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		
		Config_siteDAO dao = new Config_siteDAO();
		
		int result = dao.checkDuplicateId(id);
		

		PrintWriter writer = resp.getWriter();

		writer.print(result);

		writer.close();
	}
}

















