package com.test.sist.estimate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

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

	
	//estimate.  WriteOk서블릿의 호출 -> 견적서 쓰기
	public int write(BoardDTO dto) {
		
		try {
			
			String sql = "insert into tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) values (seqEstimate1th.nextVal, default, ?, ?, ?, ?, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getApprovalFSeq());
			pstat.setString(2, dto.getRequestSeq());
			pstat.setInt(3, dto.getEstimatedCost());
			pstat.setString(4, dto.geteContent());
			
			return pstat.executeUpdate();
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	
	//ReceiveEstimateList 서블릿이 호출함. -> 고객에게 온 견적서 목록을 반환하기
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = String.format("where mseq = %s", (map.get("memberSeq")));
			
			if (map.get("search") != null) {
				where = String.format("where mseq = %s", (map.get("memberSeq")));
			}
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwEstimate1th %s) a) where rnum between %s and %s"
									, where
									, map.get("begin")
									, map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setApprovalFSeq(rs.getString("approvalFSeq"));
				dto.setRequestSeq(rs.getString("requestSeq"));
				dto.setEstimatedCost(rs.getInt("estimatedCost"));
				dto.seteContent(rs.getString("eContent"));
				dto.setAdoptFlag(rs.getString("adoptFlag"));
				dto.setFirmName(rs.getString("firmName"));
				dto.setPortfolio(rs.getString("portfolio"));
				
				
				list.add(dto);
			}
			return list;
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}

	
	//ReceivedEstimate 서블릿 -> 총 페이지 수 구하는 메서드를 호출
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("");
			}
			
			String sql = String.format("select count(*) as from vwEstimate1th %s", where);
			
			stat = conn.createStatement();
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
