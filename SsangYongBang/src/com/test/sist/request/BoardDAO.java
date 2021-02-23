package com.test.sist.request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class BoardDAO {
	//고객요청서 전체리스트 DAO
	
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
	
	
	//RequestList 서블릿 -> 글 목록 달라고 호출함
	public ArrayList<BoardDTO> list(HashMap<String,String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("where stype like '%%%s%%'", map.get("search"));
			}
			
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwRequest %s) a) where rnum between %s and %s"
										,where
										,map.get("begin")
										,map.get("end")) ;
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setMseq(rs.getString("mseq"));
				dto.setEmail(rs.getString("email"));
				dto.setRseq(rs.getString("rseq"));
				dto.setStype(rs.getString("stype"));
				dto.setAddress(rs.getString("address"));
				dto.setShape(rs.getString("shape"));
				dto.setDesiredDay(rs.getString("desiredDay"));
				dto.setDetail(rs.getString("detail"));
				dto.setArea(rs.getString("area"));
				dto.setRegDate(rs.getString("regDate"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}


	
	//list 서블릿 -> 총게시물 수 가져오기
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

	
	
	//request.writeok 서블릿의 호출 -> 요청서 쓰기
	public int write(BoardDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblRequest (seq, regDate, address, shape, desiredDay, detail, area, serviceSeq, memberSeq) VALUES (seqRequest.nextVal, default, ?, ?, to_date(?,'yyyy-mm-dd'), ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getAddress());
			pstat.setString(2, dto.getShape());
			pstat.setString(3, dto.getDesiredDay());
			pstat.setString(4, dto.getDetail());
			pstat.setString(5, dto.getArea());
			pstat.setString(6, dto.getServiceSeq());
			pstat.setString(7, dto.getMseq());
			
			return pstat.executeUpdate();
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
		return 0;
	}
	
	
	
	

}
