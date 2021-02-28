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
	
	
	
	//servicestoreview 서블릿에서
	//업체승인번호를 매개변수로 하여 해당 업체 정보(1줄) 을 가져오는 메서드 호출
	public ServiceDTO get(String approvalFSeq) {

		try {
		
			String sql = "select * from vwFirmInfo where approvalFSeq = ?";
			//뷰에는 후기 + 한줄 같이 화면에 출력되므로, 후기 목록과 한줄에 대한 select문이 겹치지 않아야 null값으로 화면 안 뜨는 것을 방지 가능.
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, approvalFSeq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ServiceDTO dto = new ServiceDTO();
				
				dto.setApprovalFSeq(rs.getString("approvalFSeq"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setPortfolio(rs.getString("portfolio"));//여기까지 회사 정보

				
				return dto;
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	
	//servicestoreview 서블릿 -> 해당 승인업체 번호의 후기글 목록 가져오는 메서드 호출
	public ArrayList<ServiceDTO> listReview(String approvalFSeq) {
		
		try {
			String sql = "select * from vwSumInfoReview where approvalFSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, approvalFSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ServiceDTO> rlist = new ArrayList<ServiceDTO>();
			
			while (rs.next()) {
				
				ServiceDTO dto = new ServiceDTO();
				
				
				//회사의 후기정보
				dto.setRegDate(rs.getString("regDate"));
				dto.setReviewContent(rs.getString("reviewContent"));
				dto.setContentURL(rs.getString("contentURL"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setServiceArea(rs.getString("serviceArea"));
				
				rlist.add(dto);
			}
			
			return rlist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	
	
	
}
