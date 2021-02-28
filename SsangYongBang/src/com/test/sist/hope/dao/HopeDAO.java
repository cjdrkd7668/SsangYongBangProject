package com.test.sist.hope.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;
import com.test.sist.hope.dto.HopeDTO;

public class HopeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public HopeDAO() {
		//DB 연결
		conn = DBUtil.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println("Member_listDAO.close()");
			e.printStackTrace();
		}
	}
	
	public ArrayList<HopeDTO> getList() {
		try {
			
			ArrayList<HopeDTO> list = new ArrayList<HopeDTO>();
			
			stat = conn.createStatement();
			
			String sql = "select * from vwHopeWrite order by seq desc";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				HopeDTO dto = new HopeDTO();
				
				dto.setSeq(rs.getString("seq")); //글 번호
				dto.setMseq(rs.getString("mseq")); //회원 번호
				dto.setMname(rs.getString("mname")); //회원 이름
				dto.setPhone(rs.getString("phone")); //회원 전화번호
				dto.sethDType(rs.getString("hDType")); //희망거래유형
				dto.sethPrice(rs.getInt("hPrice") / 1000 + "억"); //희망가격
				dto.sethRent(rs.getString("hRent")); //희망월세
				dto.sethAddress(rs.getString("hAddress")); //지역
				dto.sethArea(rs.getString("hArea")); //희망면적(전용면적)
				dto.sethRoomNum(rs.getString("hRoomNum")); //희망방개수
				dto.setContent(rs.getString("content")); //내용
				dto.setImgURL(rs.getString("imgURL")); //가상인테리어 이미지주소(HTML태그)
				
				dto.sethRentPrice(rs.getString("hPrice") + "/" + rs.getString("hRent")); //가상인테리어 이미지주소(HTML태그)
				
				list.add(dto);
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			return list;
			
		} catch (Exception e) {
			System.out.println("HopeDAO.getList()");
			e.printStackTrace();
		}
		
		return null;
	}
}
