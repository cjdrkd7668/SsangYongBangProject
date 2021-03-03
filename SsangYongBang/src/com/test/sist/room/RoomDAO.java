package com.test.sist.room;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.house.RoomImgDTO;

public class RoomDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public RoomDAO() {
		try {
			conn = DBUtil.open();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//해시 맵을 매개로 방 게시글 목록을 반환
	public ArrayList<RoomDTO> getList(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select * from (select rownum as rnum, r.* from vwRoomPost r) where rnum between %s and %s", map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
			
			while (rs.next()) {
				RoomDTO dto = new RoomDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setmSeq(rs.getString("mSeq"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setbType(rs.getString("bType"));
				dto.setdType(rs.getString("dType"));
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
				dto.setDetail(rs.getString("detail"));
				dto.setRegDate(rs.getString("regDate").substring(0, 10));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	//방 게시글 총 개수 반환
	public int getTotalCount() {
		
		try {
			
			String sql = "select count(*) as cnt from vwRoomPost";
			
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
	
	//방 게시글 번호를 매개로 특정 방 게시글 반환
	public RoomDTO getRoom(String seq) {
		
		try {
			
			String sql = String.format("select * from vwRoomPost where seq = %s", seq);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			RoomDTO dto = new RoomDTO();
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setmSeq(rs.getString("mSeq"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setbType(rs.getString("bType"));
				dto.setdType(rs.getString("dType"));
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
				dto.setDetail(rs.getString("detail"));
				dto.setRegDate(rs.getString("regDate"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public int write(RoomDTO dto) {
		
		try {
			
			String sql = "{ call procAddRoomPost(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, to_date(?, 'yyyy'), ?, ?, ?, ?, ?, ?, ?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setInt(1, Integer.parseInt(dto.getmSeq()));
			cstat.setString(2, dto.getSubject());
			cstat.setString(3, dto.getDetail());
			cstat.setString(4, dto.getbType());
			cstat.setString(5, dto.getdType());
			cstat.setString(6, dto.getAddress());
			cstat.setInt(7, dto.getExclusiveArea());
			cstat.setInt(8, dto.getSupplyArea());
			cstat.setInt(9, Integer.parseInt(dto.getSelectedFloor()));
			cstat.setInt(10, Integer.parseInt(dto.getTotalFloor()));
			cstat.setInt(11, dto.getRoomNum());
			cstat.setInt(12, dto.getBathroomNum());
			cstat.setString(13, dto.getDirection());
			cstat.setString(14, dto.getCompletionYear());
			cstat.setInt(15, Integer.parseInt(dto.getParkingFlag()));
			cstat.setInt(16, Integer.parseInt(dto.getElevator()));
			cstat.setInt(17, Integer.parseInt(dto.getPet()));
			cstat.setString(18, dto.getPrice());
			cstat.setString(19, dto.getRent());
			cstat.setInt(20, dto.getMonthlyFee());
			cstat.setString(21, dto.getUrl()[0]);
			cstat.setString(22, dto.getUrl()[1]);
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return 0;
	}

	public ArrayList<RoomDTO> getMyList(HashMap<String, String> map, String seq) {
		
		try {
			
			String sql = String.format("select * from (select rownum as rnum, r.* from vwRoomPost r where mseq = %s) where rnum between %s and %s", seq, map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
			
			while (rs.next()) {
				RoomDTO dto = new RoomDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setmSeq(rs.getString("mSeq"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setbType(rs.getString("bType"));
				dto.setdType(rs.getString("dType"));
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
				dto.setDetail(rs.getString("detail"));
				dto.setRegDate(rs.getString("regDate").substring(0, 10));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public int getMyTotalCount(String seq) {
		
		try {
			
			String sql = String.format("select count(*) as cnt from vwRoomPost where mseq = %s", seq);
			
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

	public int deleteRoom(String seq) {

		try {
			
			String sql = "update tblRoomPost set delFlag = 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public ArrayList<String> getImg(String seq) {
		
		try {
			
			String sql = "select url from tblRoomImg where roompostseq = ?";
			
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

}
















