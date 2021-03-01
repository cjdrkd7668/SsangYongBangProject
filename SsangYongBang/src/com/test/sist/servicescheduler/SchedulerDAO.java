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

	
	
	//List 서블릿의 호출 -> 등록가능한 일정 목록을 불러오는 메서드를 호출
	public ArrayList<SchedulerDTO> possibleList(String approvalFSeq) {
		
		try {
			
			String sql = "select * from vwPossibleList where approvalFSeq = ? MINUS select * from vwRegistredList where approvalFSeq = ?";
			// 현재 채택된 데이터(이중에는 plan에 들어간 것, 안들어간 것 모두 포함) - 이미 plan 테이블에 들어간 데이터 
			// 여집합(아직 plan 리스트에 들어가지 않은 정보)를 가져오는 select문
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, approvalFSeq);
			pstat.setString(2, approvalFSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<SchedulerDTO> list = new ArrayList<SchedulerDTO>();
			
			while (rs.next()) {
				
				SchedulerDTO dto = new SchedulerDTO();
				
				dto.setEstimate1thSeq(rs.getString("seq"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setFirmname(rs.getString("firmname"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	
	//writescheduleof 서블릿의 호출 -> 일정등록 메서드 호출
	public int writeSchedule(SchedulerDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblPlan (seq, serviceDate, estimateURL, progressSeq, estimate1thSeq) VALUES (seqPlan.nextVal, to_date(?, 'yyyy-mm-dd'), ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getServiceDate());
			pstat.setString(2, dto.getEstimateURL());
			pstat.setString(3, dto.getProgress());
			pstat.setString(4, dto.getEstimate1thSeq());
			
			return pstat.executeUpdate();
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	
	
	
	
	

}
