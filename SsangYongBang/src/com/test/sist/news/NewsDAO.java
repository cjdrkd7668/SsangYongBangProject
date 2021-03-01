package com.test.sist.news;

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
public class NewsDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public NewsDAO() {
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

	//Index 서블릿 -> 뉴스 목록
	public ArrayList<NewsDTO> list() {
		
		try {
			
			String sql = "select * from vwnewslist";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<NewsDTO> list = new ArrayList<NewsDTO>();
			
			while (rs.next()) {
				
				NewsDTO dto = new NewsDTO();
				
				dto.setSeq(rs.getString("nwsseq"));
				dto.setSubject(rs.getString("nwssubject"));
				dto.setImageurl(rs.getString("nwsimageurl"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
