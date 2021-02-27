package com.test.sist.house.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
			
			String sql = "select seq, address, dType, price, rent from vwHousePost" + " " + where;
			
			System.out.println(sql);
			
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
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}
}






























