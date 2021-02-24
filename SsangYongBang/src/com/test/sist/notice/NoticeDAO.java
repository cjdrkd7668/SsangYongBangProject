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
			
			//TODO 결과셋 받는 거!
			rs = (ResultSet)cstat.getObject(2);
			
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
				dto.setGap(rs.getInt("gap"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//Detail 서블릿 -> 조회수 증가
	public void updateReadcount(String seq) {
		
		try {
			
			String sql = "update tblNotice set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//Detail 서블릿 -> 글 가져오기
	public NoticeDTO detail(String seq) {
		
		try {
			
			String sql = "select * from vwnotice where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				NoticeDTO dto = new NoticeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAdminseq(rs.getString("adminseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAdminname(rs.getString("adminname"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getInt("gap"));
				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//DeleteOk 서블릿 -> 글 삭제
	public int del(String seq) {
		
		try {
			
			String sql = "update tblNotice set delflag = 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	


}
