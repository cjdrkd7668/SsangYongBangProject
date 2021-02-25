package com.test.sist.free.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;
import com.test.sist.free.dto.FreeCommentDTO;

/**
 * 
 * @author 이찬미
 *
 */
public class FreeCommentDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	/**
	 * DB 연결을 위한 기본 생성자입니다.
	 */
	public FreeCommentDAO() {
		conn = DBUtil.open();
	}
	
	public void close() {
		
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//CommentOk 서블릿 -> 댓글 쓰기
	public int post(FreeCommentDTO dto) {
		try {

			String sql = "{ call procAddComment(?, ?, ?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, dto.getZerobonem());
			cstat.setString(2, dto.getAuthorseq());
			cstat.setString(3, dto.getFrseq());
			cstat.setString(4, dto.getDetail());
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//DeleteCommentOk 서블릿 -> 댓글 삭제
	public int del(String seq) {

		try {

			String sql = "update tblFreeComment set delFlag = 1 where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

}
