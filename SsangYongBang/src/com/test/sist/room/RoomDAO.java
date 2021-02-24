package com.test.sist.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class RoomDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
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
				dto.setPrice(rs.getInt("price"));
				dto.setRent(rs.getInt("rent"));
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
	
	//방 게시글 
	public RoomDTO get(String seq) {
		// TODO Auto-generated method stub
		return null;
	}

}
