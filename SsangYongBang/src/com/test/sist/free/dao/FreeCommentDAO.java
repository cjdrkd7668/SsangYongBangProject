package com.test.sist.free.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;
import com.test.sist.free.dto.FreeCommentDTO;

/**
 * FreeCommentDAO. 자유게시판 댓글에 필요한 데이터를 조회 및 반환하는 클래스입니다.
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
	
	/**
	 * Connection 객체를 닫는 메소드입니다.
	 */
	public void close() {
		
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * CommentOk 서블릿에서 호출한 자유게시판 댓글 작성하는 메소드입니다.
	 * @param dto 접근 정보, 글 번호, 댓글 내용 정보
	 * @return 댓글 작성 성공 개수
	 */
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

	/**
	 * DeleteCommentOk 서블릿에서 호출한 자유게시판 댓글 삭제하는 메소드입니다.
	 * @param seq 자유게시판 댓글 번호
	 * @return 댓글 삭제 성공 개수
	 */
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

	/**
	 * EditCommentOk 서블릿에서 호출한 자유게시판 댓글 수정하는 메소드입니다.
	 * @param dto 수정할 내용과 댓글 번호 정보
	 * @return 댓글 수정 성공 개수
	 */
	public int edit(FreeCommentDTO dto) {
		
		try {
			
			String sql = "update tblFreeComment set detail = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getDetail());
			pstat.setString(2, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

}
