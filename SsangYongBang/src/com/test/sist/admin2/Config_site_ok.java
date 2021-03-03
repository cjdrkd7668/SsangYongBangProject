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

@WebServlet("/admin2/config_site_ok.do")
public class Config_site_ok extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = req.getSession();
		AdminDTO nadto = new AdminDTO();
		SiteInfoDTO nsdto = new SiteInfoDTO();
		Config_siteDAO dao = new Config_siteDAO();
		
		String seq = (String) session.getAttribute("seq");
		
		//수정될 정보들
		nadto.setId(req.getParameter("adminID"));
		nadto.setPw(req.getParameter("adminPass"));
		nadto.setName(req.getParameter("adminName"));
		
		nsdto.setTel(req.getParameter("siteTel"));
		nsdto.setEmail(req.getParameter("siteEmail"));
		nsdto.setAddress(req.getParameter("siteAddress"));
		nsdto.setRepresentative(req.getParameter("siteCeo"));
		nsdto.setPolicyManager(req.getParameter("sitePolicyManager"));
		
		
		int result = dao.edit(seq,nadto,nsdto); //현재 접속한 id,수정될 정보 넘기기
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<html><body>");
		writer.print("<script>");
		if (result != 1) {
			writer.print("alert('수정 실패');");
		}
		writer.print("history.back();");
		writer.print("</script>");
		writer.print("</body></html>");
				
		writer.close();
	}
}

















