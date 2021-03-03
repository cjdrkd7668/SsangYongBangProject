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
		String price = "";
		String rent = "";
		String selectedFloor = "";
		String totalFloor = "";
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
		String subject = "";
		String detail = "";
		
		String mSeq = (String)session.getAttribute("seq"); //로그인한 회원 번호 & 글쓴이 번호
		String url[] = new String[2];

		try {
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("images"),
										1024 * 1024 * 100,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);

			dType = multi.getParameter("dType");
			bType = multi.getParameter("bType");
			price = multi.getParameter("price");
			rent = multi.getParameter("rent");
			selectedFloor = multi.getParameter("selectedFloor");
			totalFloor = multi.getParameter("totalFloor");
			monthlyFee = Integer.parseInt(multi.getParameter("monthlyFee"));
			address = multi.getParameter("address") + ", " + multi.getParameter("addressDetail");
			exclusiveArea = Integer.parseInt(multi.getParameter("exclusiveArea"));
			supplyArea = Integer.parseInt(multi.getParameter("supplyArea"));
			roomNum = Integer.parseInt(multi.getParameter("roomNum"));
			bathroomNum = Integer.parseInt(multi.getParameter("bathroomNum"));
			direction = multi.getParameter("direction");
			completionYear = multi.getParameter("completionYear");
			parkingFlag = (multi.getParameter("parkingFlag") == null) ? "0" : "1";
			elevator = (multi.getParameter("elevator") == null) ? "0" : "1";
			pet = (multi.getParameter("pet") == null) ? "0" : "1";
			subject = multi.getParameter("subject");
			detail = multi.getParameter("detail");
			url[0] = multi.getFilesystemName("url1");
			url[1] = multi.getFilesystemName("url2");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		//2.
		RoomDAO dao = new RoomDAO();
		RoomDTO dto = new RoomDTO();
		
		dto.setmSeq(mSeq);
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
		dto.setSelectedFloor(selectedFloor);
		dto.setTotalFloor(totalFloor);
		dto.setDirection(direction);
		dto.setCompletionYear(completionYear);
		dto.setParkingFlag(parkingFlag);
		dto.setElevator(elevator);
		dto.setPet(pet);
		dto.setSubject(subject);
		dto.setDetail(detail);
		dto.setUrl(url);
		
		int result = dao.write(dto); //글쓰기
		
		if (result == 1) {
			//글쓰기 성공 -> 게시판 목록으로 이동
			resp.sendRedirect("/sybang/house/list.do");
			
		} else {
			//글쓰기 실패 -> 경고 + 뒤로 가기
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><head><meta charset='utf-8'></head><body>");
			writer.print("<script>");
			writer.print("alert('방 게시글을 작성하는 것에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}

	}

}
