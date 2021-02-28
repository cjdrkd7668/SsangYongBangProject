package com.test.sist.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class ServiceBoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ServiceBoardDAO() {
		conn = DBUtil.open();
	}

	public void close() {
		try {
			conn.close();	
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<ServiceDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			//map.get("search") != null || 
			if (map.get("categoryNum") != null) {
				where = String.format("where categorynum = '%%%s%%' and address like '%%%s%%'", map.get("categoryNum"), map.get("search"));
				
			} 			
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select aseq as approvalFseq, vwApprovalF.* from vwApprovalF %s) a) where rnum between %s and %s"
										, where
										, map.get("begin")
										, map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<ServiceDTO> list = new ArrayList<ServiceDTO>();
			
			while (rs.next()) {
				
				ServiceDTO dto = new ServiceDTO();
				
				dto.setApprovalFSeq(rs.getString("approvalFSeq"));
				dto.setId(rs.getString("id"));
				dto.setAddress(rs.getString("address"));
				dto.setPortfolio(rs.getString("portfolio"));
				dto.setIntroduction(rs.getString("introduction"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e + "list 오류");
		}
		
		
		return null;
	}

	
	
	//ServiceStorem 서블릿 -> 총 게시물 개수 구하는 메서드 호출
	public int getToatalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			//map.get("search") != null && 
			if (map.get("categoryNum") != null) {
				where = String.format("where categorynum = '%%%s%%' and address like '%%%s%%'", map.get("categoryNum"), map.get("search"));
				
			} 	
			
			String sql = String.format("select count(*) as cnt from vwApprovalF %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println(e + "totalCount 오류");
		}
		
		return 0;
	}
	
	
	
	
}
