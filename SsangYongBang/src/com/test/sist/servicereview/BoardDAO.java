package com.test.sist.servicereview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class BoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		conn = DBUtil.open();
	}
	
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}


	
	//servicereview 서블릿 호출 -> 후기 목록 불러오는 메서드 호출
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {

		try {
			
			String sql = "";
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("where stype like '%%%s%%'", map.get("search"));
			}

			
			
			
			
		} catch(Exception e) {
			System.out.println(e);
		}

		return null;
	}

	
	
	
	
	
	
}
