package com.test.sist.house.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;
import com.test.sist.house.dto.HouseDTO;

/**
 * 
 * @author 이찬미
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
}
