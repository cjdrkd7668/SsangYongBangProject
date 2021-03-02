package com.test.sist.approval;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class ApprovalDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public ApprovalDAO() {
		
		try {
			
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void close() {
		
		try {
			
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
		
	//미승인 중개사/서비스업체 목록 반환
	public ArrayList<ApprovalDTO> list(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select * from (select rownum as rnum, nap.* from vwNonApproval nap) where rnum between %s and %s"
						, map.get("begin")
						, map.get("end")
						);
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<ApprovalDTO> list = new ArrayList<ApprovalDTO>();
			
			while (rs.next()) {
				ApprovalDTO dto = new ApprovalDTO();
				
				dto.setCategory(rs.getString("category"));
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;

	}

	public int getTotalCount() {

		try {
			
			String sql = "select count(*) as cnt from vwNonApproval";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	//승인 요청 삭제 => 각각의 미승인 계정 탈퇴 시키기
	public int deleteBroker(String seq) {

		try {
			
			String sql = "update tblBroker set delFlag = 1 where seq = " + seq;
			
			pstat = conn.prepareStatement(sql);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	public int deleteFirm(String seq) {

		try {
			
			String sql = "update tblFirm set delFlag = 1 where seq = " + seq;
			
			pstat = conn.prepareStatement(sql);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public int approveBroker(String seq) {
		
		try {
			
			String sql = "{ call procApproveBroker(?) }";
			
			cstat = conn.prepareCall(sql);
			cstat.setString(1, seq);
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public int approveFirm(String seq) {
		
		try {
			
			String sql = "{ call procApproveFirm(?) }";
			
			cstat = conn.prepareCall(sql);
			cstat.setString(1, seq);
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
}




















