package com.test.sist.house.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;


import com.test.sist.DBUtil;
import com.test.sist.house.dto.HouseDTO;

/**
 * 
 * @author 이찬미, 이청강
 *
 */
public class HouseDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;

	/**
	 * DB 연결을 위한 기본 생성자입니다.
	 */
	public HouseDAO() {
		conn = DBUtil.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//방 검색 메서드입니다. DB 검색 시 필요한 where 조건절으로 쓰일 문자열을 매개변수로 받습니다.
	public ArrayList<HouseDTO> searchHouse(String where) {
		
		try {

			String sql = "select seq, address, dType, price, rent, bType from vwHousePost" + " " + where;

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<HouseDTO> list = new ArrayList<HouseDTO>();
			
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
			
				dto.setSeq(rs.getString("seq"));
				dto.setAddress(rs.getString("address"));
				dto.setDtype(rs.getString("dtype"));
				dto.setPrice(rs.getString("price"));
				dto.setRent(rs.getString("rent"));
				dto.setBtype(rs.getString("bType"));
        				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
  		return null;
	}


	//RegisterOk 서블릿 -> 매물 게시글 작성
	public int post(HouseDTO dto) {

		try {

			String sql = "{ call procAddHousePost(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, dto.getBseq());
			cstat.setString(2, dto.getSubject());
			cstat.setString(3, dto.getContent());
			cstat.setString(4, dto.getBtype());
			cstat.setString(5, dto.getDtype());
			cstat.setString(6, dto.getAddress());
			cstat.setInt(7, dto.getExclusiveArea());
			cstat.setInt(8, dto.getSupplyArea());
			cstat.setString(9, dto.getSelectedFloor());
			cstat.setString(10, dto.getTotalFloor());
			cstat.setInt(11, dto.getRoomNum());
			cstat.setInt(12, dto.getBathroomNum());
			cstat.setString(13, dto.getDirection());
			cstat.setString(14, dto.getCompletionYear());
			cstat.setString(15, dto.getParkingFlag());
			cstat.setString(16, dto.getElevator());
			cstat.setString(17, dto.getPet());
			cstat.setString(18, dto.getPrice());
			cstat.setString(19, dto.getRent());
			cstat.setInt(20, dto.getMonthlyFee());
			cstat.setString(21, dto.getUrl1());
			cstat.setString(22, dto.getUrl2());
			
			return cstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//MyRegList 서블릿 -> 게시글 목록 반환
	public ArrayList<HouseDTO> list(HashMap<String, String> map) {
		try {
			String sql = "select seq, bseq, subject, address, to_char(regdate, 'yy/mm/dd') as regdate, state "
					+ " from (select rownum as rnum, h.* from vwHousePost h where h.bseq = ?) where rnum between ? and ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("bseq"));
			pstat.setString(2, map.get("begin"));
			pstat.setString(3, map.get("end"));
			
			rs = pstat.executeQuery();
			
			ArrayList<HouseDTO> list = new ArrayList<HouseDTO>();
			
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				
				dto.setSeq(rs.getString("seq")); //글 번호
				dto.setBseq(rs.getString("bseq")); //승인 중개사 번호
				dto.setSubject(rs.getString("subject"));
				dto.setAddress(rs.getString("address"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setState(rs.getString("state"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//MyRegList 서블릿 -> 총 게시글 수 반환
	public int totalCount(String bseq) {
		try {

			String sql = "select count(*) as cnt from vwHousePost where bseq = ?";

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, bseq);
			
			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return 0;
	}
	
	//View 서블릿 -> 선택한 게시글 정보 반환
	public HouseDTO view(String seq) {
		try {
			
			String sql = "select * from vwhousepost where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				HouseDTO dto = new HouseDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setBseq(rs.getString("bseq"));
				dto.setBname(rs.getString("bname"));
				dto.setTel(rs.getString("tel"));
				dto.setState(rs.getString("state"));
				dto.setBtype(rs.getString("btype"));
				dto.setDtype(rs.getString("dtype"));
				dto.setPrice(rs.getString("price"));
				dto.setRent(rs.getString("rent"));
				dto.setMonthlyFee(rs.getInt("monthlyFee"));
				dto.setAddress(rs.getString("address"));
				dto.setExclusiveArea(rs.getInt("exclusiveArea"));
				dto.setSupplyArea(rs.getInt("supplyArea"));
				dto.setSelectedFloor(rs.getString("selectedFloor"));
				dto.setTotalFloor(rs.getString("totalFloor"));
				dto.setRoomNum(rs.getInt("roomNum"));
				dto.setBathroomNum(rs.getInt("bathroomNum"));
				dto.setDirection(rs.getString("direction"));
				dto.setCompletionYear(rs.getString("completionYear"));
				dto.setParkingFlag(rs.getString("parkingFlag"));
				dto.setElevator(rs.getString("elevator"));
				dto.setPet(rs.getString("pet"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	//View 서블릿 -> 게시글 이미지 반환
	public ArrayList<String> getImg(String seq) {

		try {

			String sql = "select url from tblHouseImg where housePostSeq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();

			ArrayList<String> list = new ArrayList<String>();

			while (rs.next()) {
				list.add(rs.getString("url"));
			}

			return list;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	//BoardList 서블릿 -> 매물 게시글 전체 목록 반환
	public ArrayList<HouseDTO> allList(HashMap<String, String> map) {
		
		try {
			
			String sql = "select rnum, seq, bseq, bname, tel, state, address, subject, to_char(regdate, 'yy/mm/dd') as regdate"
						+ " from (select rownum as rnum, h.* from vwHousePost h) where rnum between ? and ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("begin"));
			pstat.setString(2, map.get("end"));
			
			rs = pstat.executeQuery();
			
			ArrayList<HouseDTO> list = new ArrayList<HouseDTO>();
			
			while (rs.next()) {
				
				HouseDTO dto = new HouseDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setBseq(rs.getString("bseq"));
				dto.setBname(rs.getString("bname"));
				dto.setState(rs.getString("state"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//BoardList 서블릿 -> 총 게시글 개수
	public int allTotalCount() {
		
		try {

			String sql = "select count(*) as cnt from vwHousePost";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//DeleteOk 서블릿 -> 해당 게시글 삭제
	public int del(String seq) {
		try {

			String sql = "update tblHousePost set delFlag = 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}

		return 0;
	}

}






























