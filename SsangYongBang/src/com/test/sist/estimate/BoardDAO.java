package com.test.sist.estimate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
	
	
	
	
	
	
	

}
