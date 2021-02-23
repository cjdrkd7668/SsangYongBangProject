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
		conn = DBUtil.open();
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
				
				dto.setHdtype(rs.getString("hdtype"));
				dto.setHprice(rs.getString("hprice"));
				
				
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	
	
}
