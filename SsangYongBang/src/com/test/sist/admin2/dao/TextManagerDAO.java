package com.test.sist.admin2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;
import com.test.sist.admin2.dto.TextManagerDTO;

public class TextManagerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	/**
	 * @return DB에서 가져온 운영정책DTO
	 * @author icw
	 */
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

	/**
	 * @param 운영정책 번호
	 * @return 운영정책DTO
	 */
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























