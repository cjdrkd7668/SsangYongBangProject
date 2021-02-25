package com.test.sist.broker.house;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.room.RoomDTO;

public class HouseDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public HouseDAO() {
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

	public ArrayList<HouseDTO> list(HashMap<String, String> map) {

		try {

			String sql = String.format(
					"select * from (select rownum as rnum, r.* from vwHousePost r) where rnum between %s and %s",
					map.get("begin"), map.get("end"));

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();

			ArrayList<HouseDTO> list = new ArrayList<HouseDTO>();

			while (rs.next()) {

				HouseDTO dto = new HouseDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setbSeq(rs.getString("bSeq"));
				dto.setBusinessNmae(rs.getString("businessNmae"));
				dto.setPhone(rs.getString("phone"));
				dto.setStat(rs.getString("stat"));
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

				list.add(dto); // ****
			}

			return list; // ****

		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public HouseDTO getHouse(String seq) {
		try {

			String sql = String.format("select * from vwHousePost where seq = %s", seq);

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			HouseDTO dto = new HouseDTO();

			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setbSeq(rs.getString("bSeq"));
				dto.setBusinessNmae(rs.getString("businessNmae"));
				dto.setPhone(rs.getString("phone"));
				dto.setStat(rs.getString("stat"));
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


				return dto;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

}
