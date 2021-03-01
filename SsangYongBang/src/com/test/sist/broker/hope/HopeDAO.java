package com.test.sist.broker.hope;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.broker.chat.ChatDTO;

public class HopeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public HopeDAO() {
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
	
	

	public ArrayList<HopeDTO> list(HashMap<String, String> map) {
	
		try {

			String sql =  String.format("select * from(select a.*, rownum as rnum from (select * from vwHopeWrite order by seq desc) a) where rnum between %s and %s", map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<HopeDTO> list = new ArrayList<HopeDTO>();
			
			while (rs.next()) {
				
				HopeDTO dto = new HopeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setMname(rs.getString("mname"));
				dto.setPhone(rs.getString("phone"));
				dto.setHdtype(rs.getString("hdtype"));
				dto.setHprice(rs.getString("hprice"));
				dto.setHrent(rs.getString("hrent"));
				dto.setHaddress(rs.getString("haddress"));
				dto.setHarea(rs.getString("harea"));
				dto.setHroomnum(rs.getString("hroomnum"));
				dto.setContent(rs.getString("content"));
				dto.setImgurl(rs.getString("imgurl"));
						
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
			
			String sql = "select count(*) as cnt from vwHopeWrite";
			
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

	public HopeDTO get(String seq) {
		
		try {
			
			String sql = "select * from vwHopeWrite where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat .setString(1, seq);
			
			rs = pstat.executeQuery();
			
			
			
			while (rs.next()) {
				
				HopeDTO dto = new HopeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setMname(rs.getString("mname"));
				dto.setPhone(rs.getString("phone"));
				dto.setHdtype(rs.getString("hdtype"));
				dto.setHprice(rs.getString("hprice"));
				dto.setHrent(rs.getString("hrent"));
				dto.setHaddress(rs.getString("haddress"));
				dto.setHarea(rs.getString("harea"));
				dto.setHroomnum(rs.getString("hroomnum"));
				dto.setContent(rs.getString("content"));
				dto.setImgurl(rs.getString("imgurl"));
					
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
}
