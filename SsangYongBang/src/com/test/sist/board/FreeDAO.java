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
 * FreeDAO. 자유게시판에 필요한 데이터를 조회 및 반환하는 클래스입니다.
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
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//FreePostOk 서블릿 -> 글쓰기
	public int post(FreeDTO dto) {
		
		try {
			
			String sql = "{ call procAddFreeMember(?, ?, ?) }";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, dto.getAuthorseq());
			cstat.setString(2, dto.getSubject());
			cstat.setString(3, dto.getDetail());
			
			return cstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//FreeList 서블릿 -> 글 목록
	public ArrayList<FreeDTO> list(HashMap<String, String> map) {
		
		try {
		
			String sql = "{call procListFree(?, ?, ?)}";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, map.get("page"));
			cstat.setString(2, map.get("search"));
			cstat.registerOutParameter(3, OracleTypes.CURSOR);
			
			cstat.executeQuery();
			
			rs = (ResultSet)cstat.getObject(3);
			
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
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//FreeList 서블릿 -> 총 페이지 수 
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

	//FreeDetail 서블릿 -> 조회수 증가
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
	
	//FreeDetail 서블릿 -> 글 하나 반환
	public FreeDTO detail(String seq) {
		
		try {
			
			String sql = "select * from vwFree where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				FreeDTO dto = new FreeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAuthorname(rs.getString("authorname"));
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				
				return dto;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//FreeDetail 서블릿 -> 댓글 목록
	public ArrayList<FreeCommentDTO> commentList(String seq) {
		
		try {
			
			String sql = "select * from vwFreeComment where frseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<FreeCommentDTO> clist = new ArrayList<FreeCommentDTO>();
			
			while (rs.next()) {
				FreeCommentDTO dto = new FreeCommentDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setFrseq(rs.getString("frseq"));
				dto.setAuthorname(rs.getString("authorname"));
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setDetail(rs.getString("detail"));
				
				clist.add(dto);
			}
			
			return clist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//FreeDeleteOk 서블릿 -> 글 삭제
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
	
	//FreeEditOk 서블릿 -> 글 수정
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
}
