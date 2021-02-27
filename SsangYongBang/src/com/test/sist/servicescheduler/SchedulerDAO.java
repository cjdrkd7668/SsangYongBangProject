package com.test.sist.servicescheduler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;

public class SchedulerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public SchedulerDAO() {
		conn = DBUtil.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	
	
	//schedulerJasonData 에서 호출한 plan 정보 list 가져오는 메서드(매개변수: 로그인한 업체의 승인번호)
	public ArrayList<SchedulerDTO> listPlan(String approvalFSeq) {
		
		try {
			
			String sql = String.format("select * from vwplan where ApprovalFseq = %s", approvalFSeq);
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			
			ArrayList<SchedulerDTO> list = new ArrayList<SchedulerDTO>();
			
			
			while(rs.next()) {
				
				SchedulerDTO dto = new SchedulerDTO();
				
				dto.setFirmname(rs.getString("firmName"));
				dto.setApprovalFseq(rs.getString("approvalFseq"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setProgress(rs.getString("progress"));
				dto.setServiceDate(rs.getString("serviceDate"));
				dto.setEstimateURL(rs.getString("estimateURL"));
				dto.setEstimate1thSeq(rs.getString("estimate1thSeq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch(Exception e) {
			System.out.println(e + "plan리스트가져오는 DAO메서드에서 에러");
		}
		
		
		return null;
	}
	
	
	
	
	
	

}
