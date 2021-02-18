package com.test.sist.admin2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;

public class TextManagerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ArrayList<TextManagerDTO> list() {
		ArrayList<TextManagerDTO> list = new ArrayList<TextManagerDTO>();
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			String sql = "select * from tblTextManager";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				TextManagerDTO dto = new TextManagerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				
				list.add(dto);
			}
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("textManager.doGet()");
			e.printStackTrace();
		}
		
		return list;
	}

	public TextManagerDTO get(String seq) {

		TextManagerDTO dto = new TextManagerDTO();
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			String sql = "select * from tblTextManager where seq=" + seq;
			
			rs = stat.executeQuery(sql);
			
			rs.next();
			
			dto.setSeq(rs.getString("seq"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("textManager.doGet()");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
}























