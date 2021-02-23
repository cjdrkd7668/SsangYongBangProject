package com.test.sist.broker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;

public class BrokerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BrokerDAO() {
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
	
	public int login(BrokerDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblBroker where email = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1 or 0
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	
	
	public BrokerDTO getBroker(String email) {
		
		try {
			
			String sql = "select b.seq as ApproBrokerSeq Afrom tblBroker a inner join tblApproBroker b on a.seq = b.brokerSeq where a.email = '?'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BrokerDTO dto = new BrokerDTO();
				
				dto.setApproBrokerSeq(rs.getString("ApproBrokerSeq")); //승인 중개사 번호
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

		

}
