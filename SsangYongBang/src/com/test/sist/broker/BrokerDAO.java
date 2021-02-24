package com.test.sist.broker;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;

public class BrokerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
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
			
			String sql = "select b.seq, b.email, b.pw, b.name, b.businessName, b.brokerNum, b.address, b.tel, b.businessNum, b.documentURL, b.delFlag, a.seq as approBrokerSeq from tblApproBroker a inner join tblBroker b on a.brokerSeq = b.seq where b.email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BrokerDTO dto = new BrokerDTO();
				
				dto.setSeq(rs.getString("seq")); //중개사 번호
				dto.setEmail(rs.getString("email"));//이메일
				dto.setPw(rs.getString("pw"));//비밀번호
				dto.setName(rs.getString("name"));//사업자 대표명
				dto.setBusinessName(rs.getString("businessName"));//사업자 상호
				dto.setBrokerNum(rs.getString("brokerNum"));//중개 등록 번호
				dto.setAddress(rs.getString("address"));//주소지
				dto.setTel(rs.getString("tel"));//전화번호
				dto.setBusinessNum(rs.getString("businessNum"));//사업자 등록번호
				dto.setDocumentURL(rs.getString("documentURL"));//서류경로
				dto.setDelFlag(rs.getString("delFlag"));//탈퇴여부
			
				dto.setApproBrokerSeq(rs.getString("ApproBrokerSeq")); //***승인 중개사 번호
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	//프로시저 이용해서 수정하기
	public int updateBroker(String brkEmail, String brkpw, String brkBusinessName, String brkAddress, String brkTel) {
		
		try {
			
			String sql = "{ call procReplaceProfileB(?, ?, ?, ?, ?) }";
			cstat = conn.prepareCall(sql);
			cstat.setString(1, brkEmail);
			cstat.setString(2, brkpw);
			cstat.setString(3, brkBusinessName);
			cstat.setString(4, brkAddress);
			cstat.setString(5, brkTel);
			
			System.out.println("z");
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}


		

}
