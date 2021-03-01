package com.test.sist.servicescheduler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sun.java2d.opengl.WGLSurfaceData.WGLVSyncOffScreenSurfaceData;

@WebServlet("/servicescheduler/writescheduleok.do")
public class WriteScheduleOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. 데이터 가져오기(subjecct, content)
		//2. DB작업 > insert
		//3. 결과처리
		
		HttpSession session = req.getSession();
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		
		String serviceDate ="";
		String progressSeq = "";
		String filename = "";
		String orgfilename = "";
		String estimate1thSeq = req.getParameter("estimate1thSeq");
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/files"),
										1024 * 1024 * 5,
										"UTF-8",
										new DefaultFileRenamePolicy()
										);
			System.out.println("/fils 의 경로 확인");
			System.out.println(req.getRealPath("/files")); //경로 확인해보기

			serviceDate = multi.getParameter("serviceDate");
			progressSeq = multi.getParameter("progressSeq");
			filename = multi.getFilesystemName("estimateURL");
			orgfilename = multi.getOriginalFileName("estimateURL");
			estimate1thSeq = multi.getParameter("estimate1thSeq");
			
			
		} catch(Exception e) {	
			
			System.out.println(e);
		}
		
		
		//글쓰기 메서드 호출
		
		SchedulerDAO dao = new SchedulerDAO();
		SchedulerDTO dto = new SchedulerDTO();
		
		dto.setServiceDate(serviceDate);
		dto.setProgress(progressSeq);
		dto.setEstimateURL(filename);
		dto.setEstimate1thSeq(estimate1thSeq);
		
		//URL값이 넘어가지 않는다.
		System.out.println("넘어가는 dto값 확인: " + dto.getEstimateURL());
		System.out.println("넘어가는 dto값 확인: " + dto.getServiceDate());
		System.out.println("넘어가는 dto값 확인: " + dto.getProgress());
		
		
		int result = dao.writeSchedule(dto);
		
		if (result == 1) {
			//글쓰기 성공 -> 게시판 목록으로 이동
			resp.sendRedirect("/sybang/servicescheduler/servicescheduler.do");
			
		} else {
			//글쓰기 실패 -> 경고 + 뒤로 가기
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		
	}

}

