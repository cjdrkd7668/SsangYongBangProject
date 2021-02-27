package com.test.codestudy.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.codestudy.BarDTO;
import com.test.codestudy.DBUtil;
import com.test.codestudy.PiDTO;

public class MemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
		conn = DBUtil.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public String getName(String id) {
		
		try {
			
			String sql = "select name from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("name");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public int checkId(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	
	
	public ArrayList<MemberDTO> list() {
		
		try {
			
			String sql = "select * from tblMember";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
		
	}

	public ArrayList<String> listBuseo() {
		
		try {
			
			String sql = "select distinct buseo from tblInsa";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<String> list = new ArrayList<String>();
			
			while (rs.next()) {
				list.add(rs.getString("buseo"));
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<InsaDTO> listInsa(String buseo) {
		
		try {
			
			String sql = "select * from tblInsa where buseo = '" + buseo + "'";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<InsaDTO> list = new ArrayList<InsaDTO>();
			
			while (rs.next()) {
				InsaDTO dto = new InsaDTO();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBuseo(rs.getString("buseo"));
				dto.setJikwi(rs.getString("jikwi"));
				dto.setBasicpay(rs.getString("basicpay"));
				list.add(dto);				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
		
		
	}
	
	
	
}



















