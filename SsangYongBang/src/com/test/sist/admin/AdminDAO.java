package com.test.sist.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;

public class AdminDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AdminDAO() {
		
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
	
	//관리자 로그인 > email과 pw 확인
	public int login(AdminDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblAdmin where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return 0;
	}
	
	//email을 매개로 세션에 담을 관리자 번호, 이름 반환
	public AdminDTO getAdmin(String email) {
		
		try {
			
			String sql = "select * from tblAdmin where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				AdminDTO dto = new AdminDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	//관리자 인덱스 화면에 뿌릴 데이터 반환
	public AdminDTO getAdminMain() {
		
		try {
			
			AdminDTO dto = new AdminDTO();
			
			dto.setNonApprovalBrokers(getCount("vwNonApprovalBroker", ""));
			dto.setNonApprovalFirms(getCount("vwNonApprovalFirm", ""));
			dto.setReviewDelRequests(getCount("vwBReviewDeleteList", ""));
			dto.setNewInquiries(getCount("vwInquiry", "where ccount = 0"));
			
			return dto;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}
	
	public int getCount(String table, String where) {
		
		try {
			
			String sql = "select count(*) as cnt from " + table + " " + where; 
			int result = 0;
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				result = rs.getInt("cnt");
				pstat.close();
				
				return result;
			}
			
			pstat.close();
			
			return result;
			
		} catch (Exception e) {
			
		}
		
		return 0;
	}
	

}








