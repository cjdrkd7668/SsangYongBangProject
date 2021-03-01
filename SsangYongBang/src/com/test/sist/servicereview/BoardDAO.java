package com.test.sist.servicereview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.servicereview.BoardDTO;

public class BoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		conn = DBUtil.open();
	}
	
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}


	
	//servicereview 서블릿 호출 -> 후기 목록 불러오는 메서드 호출
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {

		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("where stype like '%%%s%%'", map.get("search"));
			}
			
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwServiceReview %s) a) where rnum between %s and %s"
										,where
										,map.get("begin")
										,map.get("end")) ;
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setApprovalFSeq(rs.getString("approvalFSeq"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setFirmName(rs.getString("firmName"));
				dto.setReviewContent(rs.getString("reviewContent"));
				dto.setContentURL(rs.getString("contentURL"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;

	
	}


	
	//servicereview 서블릿 호출 -> 총 페이지 수 반환 메서드
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("where stype like '%%%s%%'", map.get("search"));
			}
			
			
			String sql = String.format("select * from vwRequest %s", where);

			stat= conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch(Exception e) {
			System.out.println(e);
		}

		
		return 0;
	}

	
	
	
	
	
	
}
