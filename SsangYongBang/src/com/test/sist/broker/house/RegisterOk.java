package com.test.sist.broker.house;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.sist.house.dao.HouseDAO;
import com.test.sist.house.dto.HouseDTO;
import com.test.sist.room.RoomDAO;
import com.test.sist.room.RoomDTO;

/**
 * 
 * @author 이찬미
 *
 */
@WebServlet("/broker/house/registerok.do")
public class RegisterOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//방 게시글 번호
		String rseq = req.getParameter("rseq");
		String subject = req.getParameter("subject");
		String price = req.getParameter("price");
		String rent = req.getParameter("rent");
		String detail = req.getParameter("detail");
		//승인 중개사 번호
		String bseq = req.getParameter("bseq");
		
		//방 게시글에 대한 정보 가져오기
		RoomDAO rdao = new RoomDAO();
		RoomDTO rdto = rdao.getRoom(rseq);
		
		
		HouseDTO dto = new HouseDTO();
		dto.setRseq(rseq);
		dto.setBseq(bseq);
		dto.setSubject(subject);
		dto.setPrice(price);
		dto.setRent(rent);
		dto.setContent(detail);
		dto.setBtype(rdto.getbType());
		dto.setDtype(rdto.getdType());
		dto.setAddress(rdto.getAddress());
		dto.setExclusiveArea(rdto.getExclusiveArea());
		dto.setSupplyArea(rdto.getSupplyArea());
		dto.setSelectedFloor(rdto.getSelectedFloor());
		dto.setTotalFloor(rdto.getTotalFloor());
		dto.setRoomNum(rdto.getRoomNum());
		dto.setBathroomNum(rdto.getBathroomNum());
		dto.setDirection(rdto.getDirection());
		dto.setCompletionYear(rdto.getCompletionYear());
		
		if (rdto.getParkingFlag().equals("가능")) {
			dto.setParkingFlag("1");
		} else {
			dto.setParkingFlag("0");
		}
		
		if (rdto.getElevator().equals("있음")) {
			dto.setElevator("1");
		} else {
			dto.setElevator("0");
		}
		
		if (rdto.getPet().equals("가능")) {
			dto.setPet("1");
		} else {
			dto.setPet("0");
		}
		
		ArrayList<String> iList= rdao.getImg(rseq);
		dto.setUrl1(iList.get(0));
		dto.setUrl2(iList.get(1));
		
		HouseDAO dao = new HouseDAO();
		
		//매물 게시글 작성하기
		int result = dao.post(dto);
		
		
		if (result == 1) {
			
			//성공 시
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('매물 등록을 완료하였습니다.'); location.href='/sybang/broker/house/myreglist.do';");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		} else {
		
			//실패 시
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('매물 등록에 실패하였습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
	}
}