package com.test.sist.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/notice/postok.do")
public class PostOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String adminseq = (String)session.getAttribute("adminSeq");
		String subject = "";
		String detail = "";
		String imageurl = "";
		String imageurlname = "";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
															req,
															req.getRealPath("/images"),
															1024 * 1024 * 100,
															"UTF-8",
															new DefaultFileRenamePolicy()
															);
			
			//D:\project\SsangYongBangProject\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\SsangYongBang\images
			
			subject = multi.getParameter("subject");
			detail = multi.getParameter("detail");
			imageurl = multi.getOriginalFileName("imageurl");
			imageurlname= multi.getFilesystemName("imageurl");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		NoticeDTO dto = new NoticeDTO();
		NoticeDAO dao = new NoticeDAO();
		
		dto.setAdminseq(adminseq);
		dto.setSubject(subject);
		dto.setDetail(detail);
		dto.setImageurl(imageurl);
		
		//글쓰기
		int result = dao.post(dto);
		
		if (result == 1) {
			//성공 시
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('새 공지사항이 등록되었습니다.'); location.href='/sybang/notice/list.do';");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
			
		} else {
			
			//실패 시
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('등록에 실패하였습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
	}
}