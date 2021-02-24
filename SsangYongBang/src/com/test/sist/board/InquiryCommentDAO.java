package com.test.sist.board;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;

public class InquiryCommentDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	/**
	 * DB 연결을 위한 기본 생성자입니다.
	 */
	public InquiryCommentDAO() {
		conn = DBUtil.open();
	}
	
	public void close() {
		
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//InquiryCommentOk 서블릿 -> 댓글 작성
	public int post(InquiryCommentDTO dto) {
		try {

			String sql = "{ call procAddIComment(?, ?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, dto.getIqrseq());
			cstat.setString(2, dto.getAdmseq());
			cstat.setString(3, dto.getDetail());
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

}
