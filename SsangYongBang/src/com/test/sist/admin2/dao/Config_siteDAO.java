package com.test.sist.admin2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;
import com.test.sist.admin2.dto.AdminDTO;
import com.test.sist.admin2.dto.SiteInfoDTO;

public class Config_siteDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public Config_siteDAO() {
		//DB 연결
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
	 * @param 현재 접속중인 관리자id
	 * @return 일치하는 관리자DTO
	 * @author icw
	 */
	public AdminDTO getAdminInfo(String seq) {
		
		try {
			String sql = "select * from tblAdmin where seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				AdminDTO dto = new AdminDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
			
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	/**
	 * @return 현재 사이트 정보
	 * @author icw
	 */
	public SiteInfoDTO getSiteInfo() {
		
		try {
			String sql = "select * from tblSiteInfo";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();

			if (rs.next()) {
				SiteInfoDTO dto = new SiteInfoDTO();
				
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setRepresentative(rs.getString("representative"));
				dto.setPolicyManager(rs.getString("policyManager"));
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	/**
	 * @param 현재 접속중인 관리자seq
	 * @param 수정될 관리자정보DTO
	 * @param 수정될 사이트정보DTO
	 * @author icw
	 */
	public int edit(String seq, AdminDTO nadto, SiteInfoDTO nsdto) {
		
//		AdminDTO oadto = getAdminInfo(seq); //접속한 id와 일치하는 관리자정보 요청
//		SiteInfoDTO osdto = getSiteInfo(); //기존사이트정보 요청
		
		try {
			
			String sql = "update tblAdmin set id = ?, pw = ?, name = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,nadto.getId());
			pstat.setString(2,nadto.getPw());
			pstat.setString(3,nadto.getName());
			pstat.setString(4,seq);
			
			int result1 = pstat.executeUpdate();
			
			pstat.close();
			
			PreparedStatement pstat;
			
			sql = "update tblSiteInfo set tel = ?, email = ?, address = ?, representative = ?, policyManager = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,nsdto.getTel());
			pstat.setString(2,nsdto.getEmail());
			pstat.setString(3,nsdto.getAddress());
			pstat.setString(4,nsdto.getRepresentative());
			pstat.setString(5,nsdto.getPolicyManager());
			
			int result2 = pstat.executeUpdate();
			
			return result1 * result2;
			
		} catch (Exception e) {
			System.out.println("Config_siteDAO.edit()");
			e.printStackTrace();
		}
		
		return 0;
		
	}

	public int checkDuplicateId(String id) {
		
		try {

			String sql = "select count(seq) as cnt from tblAdmin where id=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("MemberDAO.checkId()");
			e.printStackTrace();
		}

		return 0;
	}


}
















