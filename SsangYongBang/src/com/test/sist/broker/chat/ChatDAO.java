package com.test.sist.broker.chat;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
/**
 * 채팅을 조회하기 위한 DAO 클래스입니다.
 * @author 황원준
 *
 */

public class ChatDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public ChatDAO() {
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

	public ArrayList<ChatDTO> list(HashMap<String, String> map) {
		

		try {

			//String sql = "select seq, subject, mName, regDate from vwChatBroker order by seq desc";

			//select * from(select a.*, rownum as rnum from (select * from vwChatBroker order by seq desc) a) where rnum between 1 and 20;
			String sql =  String.format("select * from(select a.*, rownum as rnum from (select * from vwChatBroker order by seq desc) a) where rnum between %s and %s", map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
			
			while (rs.next()) {
				
				ChatDTO dto = new ChatDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setMname(rs.getString("mname"));
				dto.setRegDate(rs.getString("regDate"));

				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	
	//View 서블릿 -> 글 1개 반환
	public ChatDTO get(String seq) {
		
		try {
			
			String sql = "select * from vwChatBroker where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat .setString(1, seq);
			
			rs = pstat.executeQuery();
			
			
			
			while (rs.next()) {
				
				ChatDTO dto = new ChatDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAbseq(rs.getString("abseq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setBname(rs.getString("bname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setRegTime(rs.getString("regTime"));
				dto.setMname(rs.getString("mname"));
				dto.setMphone(rs.getString("mphone"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}


	//방 게시글 총 개수 반환
	public int getTotalCount() {
		
		try {
			
			String sql = "select count(*) as cnt from vwChatBroker";
			
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
}
