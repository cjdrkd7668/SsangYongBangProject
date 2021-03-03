package com.test.sist.admin2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.admin2.dto.TextManagerDTO;

public class TextManagerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	public TextManagerDAO() {
		conn = DBUtil.open();
	}
	
	
	/**
	 * DB에 저장된 운영정책 정보를 요청해 배열리스트로반환
	 * @return 운영정책DTO 배열리스트
	 * @author 임채원
	 */
	public ArrayList<TextManagerDTO> list() {
		
		try {
			
			ArrayList<TextManagerDTO> list = new ArrayList<TextManagerDTO>();
			
			stat = conn.createStatement();
			
			String sql = "select * from tblTextManager order by seq desc";
			
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
			
			return list;
			
		} catch (Exception e) {
			System.out.println("TextManagerDAO.list()");
			e.printStackTrace();
		}
		
		return null;
		
	}

	/**
	 * DB에 저장된 운영정책 정보를 요청해 반환
	 * @param 운영정책 번호
	 * @return 운영정책DTO
	 * @author 임채원
	 */
	public TextManagerDTO get(String seq) {

		TextManagerDTO dto = new TextManagerDTO();
		
		try {
			stat = conn.createStatement();
			
			String sql = "select * from tblTextManager where seq=" + seq;
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content").replace("\r\n", "<br>"));
				dto.setImgURL(rs.getString("imgURL"));
			}			
			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("TextManagerDAO.get()");
			e.printStackTrace();
		}
		
		return dto;
	}

	/**
	 * DB에 저장된 운영정책 정보를 요청해 반환
	 * @param 운영정책 번호
	 * @return 운영정책DTO
	 * @author 임채원
	 */
	public int edit(HashMap<String, String> map) {
		try {

			String sql = "update tblTextManager set subject = ?, content = ?, imgURL = ? where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, map.get("subject"));
			pstat.setString(2, map.get("content"));
			pstat.setString(3 ,map.get("filename"));
			pstat.setString(4, map.get("seq"));

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("TextManagerDAO.edit()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 수정될 운영정책 정보를 DB에 저장한 후 결과를 반환
	 * @param 수정될 새로운 내용
	 * @return 결과
	 * @author 임채원
	 */
	public int add(HashMap<String, String> map) {
		try {
			System.out.println("filename : " + map.get("filename"));
			
			String sql = "insert into tblTextManager values(seqTextManager.nextVal,?,?,?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1,map.get("subject"));
			pstat.setString(2,map.get("content"));
			pstat.setString(3,map.get("filename"));

			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("TextManagerDAO.add()");
			e.printStackTrace();
		}

		return 0;
	}
	
	
}























