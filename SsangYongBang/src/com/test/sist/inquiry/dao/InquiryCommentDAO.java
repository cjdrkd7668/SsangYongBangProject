package com.test.sist.inquiry.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sist.DBUtil;
import com.test.sist.inquiry.dto.InquiryCommentDTO;

/**
 * InquiryCommentDAO. 문의게시판 댓글에 필요한 데이터를 조회 및 반환하는 클래스입니다.
 * @author 이찬미
 *
 */
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
	 * CommentOk 서블릿에서 호출한 관리자가 댓글 작성하는 메소드입니다.
	 * @param dto 댓글 작성을 위한 정보
	 * @return 댓글 쓰기 성공 개수
	 */
	public int post(InquiryCommentDTO dto) {
		
		try {

			String sql = "{ call procAddIComment(?, ?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, dto.getAdmseq());
			cstat.setString(2, dto.getIqrseq());
			cstat.setString(3, dto.getDetail());
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/**
	 * DeleteCommentOk 서블릿에서 호출한 관리자가 본인의 댓글을 삭제하는 메소드입니다. 
	 * @param seq 댓글 번호
	 * @return 댓글 삭제 성공 개수
	 */
	public int del(String seq) {
		try {

			String sql = "update tblInquiryComment set delFlag = 1 where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/**
	 * EditCommentOk 서블릿에서 호출한 관리자가 댓글 수정하는 메소드입니다.
	 * @param dto 댓글 수정을 위한 정보
	 * @return 댓글 수정 성공 개수
	 */
	public int edit(InquiryCommentDTO dto) {

		try {
			
			String sql = "update tblInquiryComment set detail = ? where seq = ?";
			
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
