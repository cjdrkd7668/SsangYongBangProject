package com.test.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.broker.BrokerDTO;

/**
 * 
 * @author 이찬미
 *
 */
public class MemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
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

	//Login 서블릿 -> login 검사
	public int login(MemberDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMember where email = ? and pw = ? and delflag <> 1";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //로그인 성공 시 1 반환
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//LoginOk 서블릿 -> email 주면서 회원 정보를 반환
	public MemberDTO getMember(String email) {
		
		try {
			
			String sql = "select "
					+ "    seq, "
					+ "    email, "
					+ "    pw, "
					+ "    name, "
					+ "    replace(ssn, substr(ssn, 9), '******') as ssn, "
					+ "    phone, "
					+ "    address "
					+ "from tblMember where email = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setEmail(rs.getString("email"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setSsn(rs.getString("ssn"));
				dto.setAddress(rs.getString("address"));
				
				return dto;
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//EditInfoOk 서블릿 -> 내 정보 수정
	public int edit(MemberDTO dto) {
		
		try {
			
			String sql = "update tblMember set pw = ?, phone = ?, address = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getPhone());
			pstat.setString(3, dto.getAddress());
			pstat.setString(4, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//WithdrawOk 서블릿 -> 회원 탈퇴
	public int withdraw(String seq) {
		
		try {
			
			String sql = "update tblMember set delFlag = 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
}
