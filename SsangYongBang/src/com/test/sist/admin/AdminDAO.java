package com.test.sist.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;
/** 
* 관리자 계정과 관련한 메서드를 담은 DAO 클래스입니다. 
* @author 이청강
*/
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
	
	/**
	* 관리자의 아이디와 패스워드를 속성으로 갖는 dto 객체를 매개 변수로 받아, 데이터베이스와 계정 정보가 일치하는 지 여부(1, 0)를 반환하는 메서드입니다.
	* @param dto 로그인한 관리자의 아이디와 패스워드를 담은 DTO 객체
	* @return 데이터베이스와 계정 정보가 일치하는 지 여부
	*/
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
	/** 
	* email을 매개로 세션에 담을 관리자 번호, 이름 반환하는 메서드 입니다.
	* @param email 로그인한 관리자의 이메일
	* @return 관리자 번호와 이름을 담은 DTO 객체
	*/
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
	
	/** 
	* 관리자 메뉴의 첫 화면에 표시할 정보를 담은 DTO 객체를 반환하는 메서드입니다.
	* @return 관리자 메뉴의 첫 화면에 표시할 정보를 담은 DTO 객체
	*/
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
	/** 
	* 매개 변수로 받은 테이블 이름과 WHERE 조건 문자열을 이용해서 DB에서 해당 테이블의 행 개수를 검색하여 반환하는 메서드입니다.
	* @param table 테이블 이름
	* @param where 조건 문자열
	* @return 해당 테이블의 행 개수
	*/
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








