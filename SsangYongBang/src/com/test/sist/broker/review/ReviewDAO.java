package com.test.sist.broker.review;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import com.test.sist.DBUtil;

/**
 * 리뷰를 조회하기 위한 DAO 클래스입니다. 
 * @author 황원준
 *
 */
public class ReviewDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public ReviewDAO() {
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

	public ArrayList<ReviewDTO> list(HashMap<String, String> map) {
		
		try {

			String sql =  String.format("select * from(select a.*, rownum as rnum from (select * from vwBrokerReview order by seq desc) a) where rnum between %s and %s", map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAbseq(rs.getString("abseq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setMname(rs.getString("mname"));
				dto.setBname(rs.getString("bname"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setImgURL(rs.getString("imgURL"));
				dto.setRegDate(rs.getString("regDate"));
							
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
			
			String sql = "select count(*) as cnt from vwBrokerReview";
			
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

	public ReviewDTO get(String seq) {
		
		try {
			
			String sql = "select * from vwBrokerReview where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat .setString(1, seq);
			
			rs = pstat.executeQuery();
			
			
			
			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAbseq(rs.getString("abseq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setMname(rs.getString("mname"));
				dto.setBname(rs.getString("bname"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setImgURL(rs.getString("imgURL"));
				dto.setRegDate(rs.getString("regDate"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}


	public int deleteReview(String seq, String requestContent, String reviewSeq) {
		try {
			
			String sql = "insert into tblReviewDelete (seq, detail, regDate, reviewSeq, approBrokerSeq, delFlag) values (seqReviewDelete.nextVal, ?, default, ?, ?, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, requestContent);
			pstat.setString(2, reviewSeq);
			pstat.setString(3, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}




}
