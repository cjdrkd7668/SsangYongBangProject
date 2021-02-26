package com.test.sist.admin2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.sist.admin2.dao.TextManagerDAO;

@WebServlet("/admin2/textManager_reg_ok.do")
public class TextManager_reg_ok extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String filename = "";
		String orgfilename = "";
		HashMap<String,String> map = new HashMap<String,String>();
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
				req,
				req.getRealPath("/files/admin2"),
				1024 * 1024 * 100,
				"UTF-8",
				new DefaultFileRenamePolicy()
			);
			System.out.println("path : " + req.getRealPath("/files/admin2"));
			
			map.put("filename",multi.getFilesystemName("imgURL"));
			map.put("orgfilename",multi.getOriginalFileName("attach"));
			map.put("type",multi.getParameter("type"));
			map.put("seq",multi.getParameter("seq"));
			map.put("subject",multi.getParameter("subject"));
			map.put("content",multi.getParameter("content"));
			
		} catch (Exception e) {
			System.out.println("TextManager_reg_ok.doPost()");
			e.printStackTrace();
		}
		
		System.out.println("filename : " + map.get("filename"));
		System.out.println("orgfilename : " + map.get("orgfilename"));
		
		
		TextManagerDAO dao = new TextManagerDAO();
		
		int result = 0;
		
		if (map.get("type").equals("add")) {
			result = dao.add(map);
		}else if(map.get("type").equals("edit")){
			result = dao.edit(map);
		}
		
		if (result == 1) {
			if (map.get("type").equals("add")) {
				//추가 성공
				resp.sendRedirect("/sybang/admin2/textManager.do");
			}else {
				//수정 성공
				resp.sendRedirect("/sybang/admin2/textManager_reg.do?type=" + map.get("type") + "&seq=" + map.get("seq"));
			}
			
		} else {
			//수정/등록 실패 -> 경고 + 뒤로 가기
			PrintWriter writer = resp.getWriter();
			resp.setContentType("text/html; charset=UTF-8");
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('실패');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		
	}
}























