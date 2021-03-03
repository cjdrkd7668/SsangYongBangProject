package com.test.sist.inquiry.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.inquiry.dto.InquiryCommentDTO;
import com.test.sist.inquiry.dto.InquiryDTO;

import oracle.jdbc.OracleTypes;

/**
 * InquiryDAO. 문의게시판 글에 필요한 데이터를 조회 및 반환하는 클래스입니다.
 * @author 이찬미
 *
 */
public class InquiryDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;

	/**
	 * DB 연결을 위한 기본 생성자입니다.
	 */
	public InquiryDAO() {
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
	 * List 서블릿에서 호출한 문의게시판 총 페이지 수를 반환하는 메소드입니다.
	 * @return 문의게시판 총 페이지 수
	 */
	public int totalPage() {
		
		try {

			String sql = "select ceil((select count(*) from vwInquiry) / 10) as total from dual";

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

	/**
	 * List 서블릿에서 호출한 문의게시판 글 목록을 반환하는 메소드입니다. 
	 * @param map 글 목록 조회에 필요한 접근 정보 및 페이지, 검색어 정보
	 * @return 문의게시판 글 목록
	 */
	public ArrayList<InquiryDTO> list(HashMap<String, String> map) {
		
		try {
			
			String sql = "{call procListInquiry(?, ?, ?, ?, ?)}";
			
			cstat = conn.prepareCall(sql);

			cstat.setString(1, map.get("access"));
			cstat.setString(2, map.get("authorseq"));
			cstat.setString(3, map.get("page"));
			cstat.setString(4, map.get("search"));
			cstat.registerOutParameter(5, OracleTypes.CURSOR);

			cstat.executeQuery();

			rs = (ResultSet) cstat.getObject(5);
			
			ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();
			
			while (rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setAuthorname(rs.getString("authorname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getInt("gap"));
				dto.setCcount(rs.getString("ccount"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setOpenflag(rs.getString("openflag"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Detail 서블릿에서 호출한 특정 글 조회 시 조회수를 증가시키는 메소드입니다.
	 * @param seq 문의게시판 글 번호
	 */
	public void updateReadcount(String seq) {
		
		try {

			String sql = "update tblInquiry set readcount = readcount + 1 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * Detail 서블릿에서 호출한 문의게시판 글 하나의 정보를 반환하는 메소드입니다.
	 * @param seq 문의게시판 글 번호
	 * @return 문의게시판 글 정보
	 */
	public InquiryDTO detail(String seq) {
		try {

			String sql = "select * from vwInquiry where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				InquiryDTO dto = new InquiryDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setAuthorname(rs.getString("authorName"));
				dto.setAuthorseq(rs.getString("authorSeq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regDate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setOpenflag(rs.getString("openflag"));

				return dto;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Detail 서블릿에서 호출한 특정 게시글의 모든 댓글을 반환하는 메소드입니다.
	 * @param seq 문의게시판 글 번호
	 * @return 특정 글의 댓글 목록
	 */
	public ArrayList<InquiryCommentDTO> commentList(String seq) {
		try {

			String sql = "select * from vwInquiryComment where iqrSeq = ? order by regdate asc";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<InquiryCommentDTO> clist = new ArrayList<InquiryCommentDTO>();

			while (rs.next()) {
				InquiryCommentDTO dto = new InquiryCommentDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setIqrseq(rs.getString("iqrSeq"));
				dto.setAdmseq(rs.getString("admSeq"));
				dto.setAdmname(rs.getString("admName"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setGap(rs.getInt("gap"));

				clist.add(dto);
			}

			return clist;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * EditOk 서블릿에서 호출한 문의게시판 글 수정하는 메소드입니다.
	 * @param dto 글 번호, 제목, 수정할 내용, 공개 여부 정보
	 * @return 글 수정 성공 개수
	 */
	public int edit(InquiryDTO dto) {
		
		try {

			String sql = "update tblInquiry set subject = ?, detail = ?, openFlag = ? where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getDetail());
			pstat.setString(3, dto.getOpenflag());
			pstat.setString(4, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	/**
	 * PostOk 서블릿에서 호출한 문의게시판 글 작성하는 메소드입니다.
	 * @param dto 글 작성을 위한 접근 정보와 번호, 제목, 내용, 공개 여부 정보
	 * @return 글 작성 성공 개수
	 */
	public int post(InquiryDTO dto) {
		try {

			String sql = "{ call procAddInquiry(?, ?, ?, ?, ?) }";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, dto.getZerobonem());
			cstat.setString(2, dto.getAuthorseq());
			cstat.setString(3, dto.getSubject());
			cstat.setString(4, dto.getDetail());
			cstat.setString(5, dto.getOpenflag());

			return cstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/**
	 * DeleteOk 서블릿에서 호출한 문의게시판 글을 삭제하는 메소드입니다.
	 * @param seq 문의게시판 글 번호
	 * @return 글 삭제 성공 개수
	 */
	public int del(String seq) {

		try {

			String sql = "update tblInquiry set delFlag = 1 where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
}
