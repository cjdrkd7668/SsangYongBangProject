package com.test.sist.notice;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

import oracle.jdbc.OracleTypes;

/**
 * 
 * @author 이찬미
 *
 */
public class NoticeDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public NoticeDAO() {
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
	
	//List 서블릿 -> 총 페이지 수
	public int totalPage() {
		
		try {
			
			String sql = "select ceil((select count(*) from vwNotice) / 10) as total from dual";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("total");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//List 서블릿 -> 글 목록 
	public ArrayList<NoticeDTO> list(HashMap<String, String> map) {
		
		try {
			
			String sql = "{call procListNotice(?, ?)}";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, map.get("page"));
			cstat.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstat.executeQuery();
			
			ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
			
			while (rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAdminseq(rs.getString("adminseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setImageurl(rs.getString("imageurl"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAdminname(rs.getString("adminname"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getString("gap"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	


}
