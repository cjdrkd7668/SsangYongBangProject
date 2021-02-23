package com.test.codestudy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.codestudy.DBUtil;

public class BoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		conn = DBUtil.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//WriteOk 서블릿이 글쓰기 위임
	public int write(BoardDTO dto) {
		
		try {
			
			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, mseq, filename, orgfilename, thread, depth) values (seqBoard.nextVal, ?, ?, default, default, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getMseq());
			
			pstat.setString(4, dto.getFilename());
			pstat.setString(5, dto.getOrgfilename());
			
			pstat.setInt(6, dto.getThread());
			pstat.setInt(7, dto.getDepth());
			
			return pstat.executeUpdate(); //1 or 0
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	//List 서블릿 -> 글목록 달라고 위임
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//검색 중..
				where = String.format("where name like '%%%s%%' or subject like '%%%s%%' or content like '%%%s%%'", map.get("search"), map.get("search"), map.get("search"));
			}
			
			//String sql = String.format("select * from vwBoard %s order by seq desc", where);
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwBoard %s order by thread desc) a) where rnum between %s and %s"
									, where
									, map.get("begin")
									, map.get("end"));
			
			//select * from vwBoard where name like '%게시판%' or subject like '%게시판%' or content like '%게시판%' order by seq desc
			//System.out.println(sql);
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			//ResultSet -> ArrayList<DTO>
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setMseq(rs.getString("mseq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setName(rs.getString("name"));
				
				dto.setGap(rs.getInt("gap"));
				
				dto.setFilename(rs.getString("filename"));
				
				dto.setPic(rs.getString("pic"));
				
				dto.setContent(rs.getString("content"));
				
				dto.setCcount(rs.getString("ccount")); //댓글 수
				
				dto.setDepth(rs.getInt("depth")); //답변형
				
				list.add(dto); //****				
			}
			
			return list; //****
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//View 서블릿 -> 글 1개 반환해달라고 요청
	public BoardDTO get(String seq) {
		
		try {
			
			String sql = "select b.*, (select name from tblMember where seq = b.mseq) as name, (select id from tblMember where seq = b.mseq) as id from tblBoard b where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setMseq(rs.getString("mseq"));
				
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				dto.setFilename(rs.getString("filename"));
				dto.setOrgfilename(rs.getString("orgfilename"));
				dto.setDownloadcount(rs.getInt("downloadcount"));
				
				dto.setThread(rs.getInt("thread")); //답변용
				dto.setDepth(rs.getInt("depth"));
				
				
				return dto;				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//View 서블릿 -> 조회수 증가 +1
	public void updateReadcount(String seq) {
		
		try {
			
			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//EditOk 서블릿 -> 글 수정
	public int edit(BoardDTO dto) {
		
		try {
			
			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq()); //글번호
			
			return pstat.executeUpdate(); //1 or 0
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
		
	}

	public int del(String seq) {
		
		try {
			
			String sql = "delete from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate(); //1 or 0
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
		
	}

	public void updateDownloadcount(String seq) {
		
		try {
			
			String sql = "update tblBoard set downloadcount = downloadcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//List 서블릿 -> 총 게시물 수 반환
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("where name like '%%%s%%' or subject like '%%%s%%' or content like '%%%s%%'", map.get("search"), map.get("search"), map.get("search"));
			}
			
			String sql = String.format("select count(*) as cnt from tblBoard %s", where);
			
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

	
	//CommentOk 서블릿 -> 댓글 쓰기
	public int writeComment(CommentDTO dto) {
		
		try {
			
			String sql = "insert into tblComment (seq, ccontent, regdate, mseq, bseq) values (seqComment.nextVal, ?, default, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getCcontent());
			pstat.setString(2, dto.getMseq());
			pstat.setString(3, dto.getBseq());
			
			return pstat.executeUpdate(); //1 or 0
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
		
	}

	
	//View 서블릿 -> 댓글 목록
	public ArrayList<CommentDTO> listComment(String seq) {
		
		try {
			
			String sql = "select c.*, (select name from tblMember where seq = c.mseq) as name, (select id from tblMember where seq = c.mseq) as id from tblComment c where c.bseq = ? order by c.seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);//부모 글번호
			
			rs = pstat.executeQuery();
			
			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();
			
			while (rs.next()) {
				//레코드 1개 -> DTO 1개
				CommentDTO dto = new CommentDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCcontent(rs.getString("ccontent"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setMseq(rs.getString("mseq"));
				dto.setBseq(rs.getString("bseq"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				clist.add(dto);				
			}
			
			return clist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public int deleteComment(String seq) {
		
		try {
			
			String sql = "delete from tblComment where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate(); //1 or 0
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	//WriteOk 서블릿 -> 가장 큰 thread값 + 1000 반환
	public int getThread() {
		
		try {
			
			String sql = "select nvl(max(thread), 0) + 1000 as thread from tblBoard";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("thread");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	//WriteOk 서블릿
	public void updateThead(HashMap<String, Integer> map) {
		
		try {
			//a. 게시물의 모든 thread 값 중 답변글의 부모글 thread 값보다 작고, 이전 새글의 thread 값보다 큰 글들을 모두 찾아서 thread - 1 업데이트 한다.
			String sql = "update tblBoard set thread = thread - 1 where thread < ? and thread > ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, map.get("parentThread"));
			pstat.setInt(2, map.get("previousThread"));
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}


















