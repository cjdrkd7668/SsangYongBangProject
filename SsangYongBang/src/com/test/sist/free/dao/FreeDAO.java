package com.test.sist.free.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.free.dto.FreeCommentDTO;
import com.test.sist.free.dto.FreeDTO;

import oracle.jdbc.OracleTypes;

/**
 * FreeDAO. 자유게시판 글에 필요한 데이터를 조회 및 반환하는 클래스입니다.
 * @author 이찬미
 *
 */
public class FreeDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;

	/**
	 * DB 연결을 위한 기본 생성자입니다.
	 */
	public FreeDAO() {
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
	 * List 서블릿에서 호출한 자유게시판 총 페이지 수를 반환하는 메소드입니다.
	 * @return 자유게시판 총 페이지 수
	 */
	public int totalPage() {
		try {

			String sql = "select ceil((select count(*) from vwFree) / 10) as total from dual";
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
	 * List 서블릿에서 호출한 자유게시판 글 목록을 반환하는 메소드입니다.
	 * @param map 글 목록 조회에 필요한 페이지 수, 검색어 정보
	 * @return 자유게시판 글 목록
	 */
	public ArrayList<FreeDTO> list(HashMap<String, String> map) {
		
		try {

			String sql = "{call procListFree(?, ?, ?)}";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, map.get("page"));
			cstat.setString(2, map.get("search"));
			cstat.registerOutParameter(3, OracleTypes.CURSOR);

			cstat.executeQuery();

			rs = (ResultSet) cstat.getObject(3);

			ArrayList<FreeDTO> list = new ArrayList<FreeDTO>();

			while (rs.next()) {
				FreeDTO dto = new FreeDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setAuthorname(rs.getString("authorname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getInt("gap"));
				dto.setCcount(rs.getString("ccount"));
				dto.setZerobonem(rs.getString("zerobonem"));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * PostOk 서블릿에서 호출한 자유게시판 글을 작성하는 메소드입니다.
	 * @param dto 글 작성을 위한 접근 정보와 제목, 내용 정보
	 * @return 글 작성 성공 개수
	 */
	public int post(FreeDTO dto) {
		
		try {
			
			String sql = "{ call procAddFree(?, ?, ?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, dto.getZerobonem());
			cstat.setString(2, dto.getAuthorseq());
			cstat.setString(3, dto.getSubject());
			cstat.setString(4, dto.getDetail());
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/**
	 * Detail 서블릿에서 호출한 특정 글 조회 시 조회수를 증가시키는 메소드입니다.
	 * @param seq 자유게시판 글 번호
	 */
	public void updateReadcount(String seq) {
		
		try {
			
			String sql = "update tblFree set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * Detail 서블릿에서 호출한 자유게시판 글 하나의 정보를 반환하는 메소드입니다.
	 * @param seq 자유게시판 글 번호
	 * @return 자유게시판 글 정보
	 */
	public FreeDTO detail(String seq) {
		
		try {
			String sql = "select * from vwFree where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				FreeDTO dto = new FreeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setAuthorname(rs.getString("authorname"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Detail 서블릿에서 호출한 특정 자유게시판 글 하나의 댓글 정보를 반환하는 메소드입니다.
	 * @param seq 자유게시판 글 번호
	 * @return 댓글 목록
	 */
	public ArrayList<FreeCommentDTO> commentList(String seq) {
		
		try {
			
			String sql = "select * from vwFreeComment where frseq = ? order by regdate asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<FreeCommentDTO> clist = new ArrayList<FreeCommentDTO>();
			
			while (rs.next()) {
				
				FreeCommentDTO dto = new FreeCommentDTO();
				
				dto.setSeq(rs.getString("seq")); //번호
				dto.setFrseq(rs.getString("frseq")); //글 번호
				dto.setAuthorname(rs.getString("authorname")); //댓글쓴이
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setZerobonem(rs.getString("zerobonem"));
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
	 * EditOk 서블릿에서 호출한 자유게시판 글 수정하는 메소드입니다.
	 * @param dto 수정할 제목, 내용, 글 번호 정보
	 * @return 글 수정 성공 개수
	 */
	public int edit(FreeDTO dto) {
		
		try {

			String sql = "update tblFree set subject = ?, detail = ? where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getDetail());
			pstat.setString(3, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/**
	 * DeleteOk 서블릿에서 호출한 자유게시판 글 삭제하는 메소드입니다.
	 * @param seq 자유게시판 글 번호
	 * @return 글 삭제 성공 개수
	 */
	public int del(String seq) {
		
		try {

			String sql = "update tblFree set delFlag = 1 where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/**
	 * Index 서블릿에서 호출한 자유게시판 조회수가 많은 5개의 제목 목록을 반환하는 메소드입니다.
	 * @return 인기글 제목 목록
	 */
	public ArrayList<FreeDTO> popular() {
		
		try {
			
			String sql = "select rownum, f.* from (select * from vwFree order by readcount desc) f "
					+ " where rownum between 1 and 5";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<FreeDTO> list = new ArrayList<FreeDTO>();
			
			while (rs.next()) {
				
				FreeDTO dto = new FreeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setCcount(rs.getString("ccount"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Index 서블릿에서 호출한 자유게시판 최신글 5개의 제목 목록을 반환하는 메소드입니다.
	 * @return 최신글 제목 목록
	 */
	public ArrayList<FreeDTO> latest() {
		try {

			String sql = "select rownum, f.* from vwFree f where rownum between 1 and 5";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			ArrayList<FreeDTO> list = new ArrayList<FreeDTO>();

			while (rs.next()) {

				FreeDTO dto = new FreeDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setCcount(rs.getString("ccount"));
				dto.setGap(rs.getInt("gap"));

				list.add(dto);
			}

			return list;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
