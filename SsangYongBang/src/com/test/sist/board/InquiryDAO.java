package com.test.sist.board;

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

	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// InquiryList 서블릿 -> 총 페이지 수 반환
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

	// InquiryList 서블릿 -> 글 목록
	public ArrayList<InquiryDTO> list(HashMap<String, String> map, String access, String authorseq) {

		try {

			String sql = "{call procListInquiry(?, ?, ?, ?, ?)}";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, access);
			cstat.setString(2, authorseq);
			cstat.setString(3, map.get("page"));
			cstat.setString(4, map.get("search"));
			cstat.registerOutParameter(5, OracleTypes.CURSOR);

			cstat.executeQuery();

			rs = (ResultSet) cstat.getObject(5);

			ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();

			while (rs.next()) {
				InquiryDTO dto = new InquiryDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setAuthorname(rs.getString("authorname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getInt("gap"));
				dto.setCcount(rs.getString("ccount"));
				
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setOpenflag(rs.getString("openflag"));
				
				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			System.err.println(e);
		}
		return null;
	}

	// InquiryPostOk 서블릿 -> 글쓰기
	public int post(InquiryDTO dto) {
		try {

			String sql = "{ call procAddInquiryMember(?, ?, ?, ?) }";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, dto.getAuthorseq());
			cstat.setString(2, dto.getSubject());
			cstat.setString(3, dto.getDetail());
			cstat.setString(4, dto.getOpenflag());

			return cstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	// InquiryDetail 서블릿 -> 조회수 증가
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

	// InquiryDetail 서블릿 -> 글 하나 반환
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

				return dto;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// InquiryDetail 서블릿 -> 댓글 목록
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

	//InquiryDeleteOk 서블릿 -> 글 삭제
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

	//InquiryEditOk 서블릿 -> 글 수정
	//TODO openflag 없다
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

}