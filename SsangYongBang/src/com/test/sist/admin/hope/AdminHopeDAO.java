package com.test.sist.admin.hope;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;

import oracle.jdbc.OracleTypes;

public class AdminHopeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public AdminHopeDAO() {
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	//현재 페이지를 매개로 해당 페이지의 글 목록을 가져오는 프로시저를 이용
	public ArrayList<AdminHopeDTO> getlist(int nowPage) {
		
		try {
			
			String sql = "{ call procListHopeWriteBRK(?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setInt(1, nowPage);
			cstat.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstat.executeQuery();
			
			rs = (ResultSet)cstat.getObject(2);
			
			ArrayList<AdminHopeDTO> list = new ArrayList<AdminHopeDTO>();
			
			while (rs.next()) {
				AdminHopeDTO dto = new AdminHopeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHdtype(rs.getString("hdtype"));
				dto.setHprice(rs.getString("hprice"));
				dto.setHrent(rs.getString("hrent"));
				dto.setHaddress(rs.getString("haddress"));
				dto.setHarea(rs.getString("harea"));
				dto.setHroomnum(rs.getString("hroomnum"));
				dto.setMname(rs.getString("mname"));
				dto.setPhone(rs.getString("phone"));
				dto.setContent(rs.getString("content"));
				dto.setImgURL(rs.getString("imgURL"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//특정 테이블의 총 게시글 수 반환
	public int getTotalCountHope() {

		try {
			
			String sql = "select count(*) as cnt from vwHopeWrite";
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	
	
	
	
}
