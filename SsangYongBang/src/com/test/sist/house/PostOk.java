package com.test.sist.house;

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
import com.test.sist.room.RoomDAO;
import com.test.sist.room.RoomDTO;

@WebServlet("/house/postok.do")
public class PostOk extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		


		
		req.setCharacterEncoding("UTF-8");
		
		//1. 데이터 가져오기
		HttpSession session = req.getSession();
		
		String dType = "";
		String bType = "";
		int price = 0;
		int rent = 0;
		int monthlyFee = 0;
		String address = "";
		int exclusiveArea = 0;
		int supplyArea = 0;
		int roomNum = 0;
		int bathroomNum = 0;
		String direction = "";
		String completionYear = "";
		String parkingFlag = "";
		String elevator = "";
		String pet = "";
		String[] url = new String[2];
		String subject = "";
		String detail = "";
		String filename1 = "";
		String orgfilename1 = "";
		String filename2 = "";
		String orgfilename2 = "";
		String mseq = (String)session.getAttribute("seq"); //로그인한 회원 번호 & 글쓴이 번호

		try {
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("images"),
										1024 * 1024 * 100,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			System.out.println(req.getRealPath("images"));
			
			
			System.out.println(multi.getParameter("dType"));
			System.out.println(multi.getParameter("bType"));
			System.out.println(multi.getParameter("price"));
			System.out.println(multi.getParameter("rent"));
			System.out.println(multi.getParameter("monthlyFee"));
			System.out.println(multi.getParameter("address"));
			System.out.println(multi.getParameter("exclusiveArea"));
			System.out.println(multi.getParameter("supplyArea"));
			System.out.println(multi.getParameter("roomNum"));
			System.out.println(multi.getParameter("bathroomNum"));
			System.out.println(multi.getParameter("direction"));
			System.out.println(multi.getParameter("completionYear"));
			System.out.println(multi.getParameter("parkingFlag"));
			System.out.println(multi.getParameter("elevator"));
			System.out.println(multi.getParameter("pet"));
			System.out.println(multi.getParameter("subject"));
			System.out.println(multi.getParameter("detail"));
			System.out.println(multi.getFilesystemName("url1"));
			System.out.println(multi.getFilesystemName("url2"));
			
			dType = multi.getParameter("dType");
			bType = multi.getParameter("bType");
			price = Integer.parseInt(multi.getParameter("price"));
			rent = Integer.parseInt(multi.getParameter("rent"));
			monthlyFee = Integer.parseInt(multi.getParameter("monthlyFee"));
			address = multi.getParameter("address");
			exclusiveArea = Integer.parseInt(multi.getParameter("exclusiveArea"));
			supplyArea = Integer.parseInt(multi.getParameter("supplyArea"));
			roomNum = Integer.parseInt(multi.getParameter("roomNum"));
			bathroomNum = Integer.parseInt(multi.getParameter("bathroomNum"));
			direction = multi.getParameter("direction");
			completionYear = multi.getParameter("completionYear");
			parkingFlag = multi.getParameter("parkingFlag");
			elevator = multi.getParameter("elevator");
			pet = multi.getParameter("pet");
			url = multi.getParameterValues("url");
			subject = multi.getParameter("subject");
			detail = multi.getParameter("detail");
			url[0] = multi.getFilesystemName("url1");
			url[1] = multi.getFilesystemName("url2");
			
			System.out.println(url.toString()); // 왜이게 널이지
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		//2.
		RoomDAO dao = new RoomDAO();
		RoomDTO dto = new RoomDTO();
		
		dto.setdType(dType);
		dto.setbType(bType);
		dto.setPrice(price);
		dto.setRent(rent);
		dto.setMonthlyFee(monthlyFee);
		dto.setAddress(address);
		dto.setExclusiveArea(exclusiveArea);
		dto.setSupplyArea(supplyArea);
		dto.setRoomNum(roomNum);
		dto.setBathroomNum(bathroomNum);
		dto.setDirection(direction);
		dto.setCompletionYear(completionYear);
		dto.setParkingFlag(parkingFlag);
		dto.setElevator(elevator);
		dto.setPet(pet);
		dto.setUrl(url);
		
		int result = 1;
		//int result = dao.write(dto); //글쓰기
		
		if (result == 1) {
			//글쓰기 성공 -> 게시판 목록으로 이동
			resp.sendRedirect("/sybang/house/list.do");
			
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
