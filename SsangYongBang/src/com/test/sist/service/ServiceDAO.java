package com.test.sist.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;

public class ServiceDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ServiceDAO() {
		
		//DB연결
		conn = DBUtil.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
	
	//업주 로그인 입력정보 확인하기
	public int login(ServiceDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblFirm where email = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); // 1 or 0
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	//Login 서브릿 -> email 매개변수로 하여 회원정보를 읽어오라고 호출.
	public ServiceDTO getService(String email) {
		
		try {
			
			String sql = "select * from tblFirm where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ServiceDTO dto = new ServiceDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCategorySeq(rs.getString("categorySeq"));
				dto.setApproval(rs.getString("approval"));
				
				return dto;	
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	

	
	
	

}
