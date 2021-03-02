package com.test.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

/**
 * 
 * @author 이찬미
 *
 */
public class MyInfoDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MyInfoDAO() {
		//DB 연결
		conn = DBUtil.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//MyInfo 서블릿 -> 내가 쓴 글 총 페이지수 반환
	public int ptotalPage(String authorseq) {
		
		try {
			//회원일 경우
			String sql = "select ceil(("
					+ "    select count(*) as total from ("
					+ "        select * from ("
					+ "        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree"
					+ "        union"
					+ "        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry)"
					+ "        order by regdate desc)"
					+ "    where authorseq = ? and zerobonem = 1"
					+ "    ) / 5) as total from dual";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, authorseq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("total");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	
	//MyInfo 서블릿 -> 내가 쓴 댓글 총 페이지 수
	public int ctotalPage(String authorseq) {
		try {
			String sql = "select ceil(count(*) / 5) as total from vwFreeComment where authorseq = ? and zerobonem = 1";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, authorseq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("total");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	

	//MyInfo 서블릿 -> 내가 쓴 글 목록 반환
	public ArrayList<MyInfoDTO> postList(HashMap<String, String> pmap) {
		
		try {
			
			String sql = "select rnum, seq, authorseq, subject, detail, ccount, to_char(regdate, 'yy/mm/dd hh24:mi') as regdate, readcount, gap, zerobonem, which from ("
					+ "    select u.*, rownum as rnum from ("
					+ "        select seq, authorseq, subject, detail, ccount, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree"
					+ "        union "
					+ "        select seq, authorseq, subject, detail, ccount, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry"
					+ "        where authorseq = ? and zerobonem = 1"
					+ "        order by regdate desc) u "
					+ "    where authorseq = ? and zerobonem = 1 "
					+ "    order by regdate desc)  "
					+ "where rnum between ? and ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, pmap.get("authorseq"));
			pstat.setString(2, pmap.get("authorseq"));
			pstat.setInt(3, ((Integer.parseInt(pmap.get("ppage")) - 1) * 5 + 1));
			pstat.setInt(4, Integer.parseInt(pmap.get("ppage")) * 5);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyInfoDTO> list = new ArrayList<MyInfoDTO>();
			
			while (rs.next()) {
				
				MyInfoDTO dto = new MyInfoDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getInt("gap"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setWhich(rs.getString("which"));
				dto.setCcount(rs.getString("ccount"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//MyInfo 서블릿 -> 총 게시물 수 반환
	public int totalPost(String authorseq) {
		
		try {
			
			String sql = "select count(*) as total from ( "
					+ "    select * from ("
					+ "    select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree"
					+ "    union "
					+ "    select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry)"
					+ "    order by regdate desc) "
					+ "where authorseq = ? and zerobonem = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, authorseq);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("total");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//MyInfo 서블릿 -> 총 댓글 수 반환
	public int totalComment(String authorseq) {
		
		try {
			
			String sql = "select count(*) as total from vwFreeComment where authorseq = ? and zerobonem = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, authorseq);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("total");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	//MyCommentData 서블릿 -> 내가 쓴 댓글 목록 반환
	public ArrayList<MyInfoDTO> commentList(String authorseq) {
		
		try {
			
			String sql = "select seq, frseq, authorseq, zerobonem, (select subject from tblFree where seq = vwFreeComment.frseq) as subject, "
							+ "detail, to_char(regDate, 'yy/mm/dd hh24:mi') as regdate, gap "
							+ " from vwFreeComment where authorseq = ? and zerobonem = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, authorseq);
			rs = pstat.executeQuery();
			
			ArrayList<MyInfoDTO> list = new ArrayList<MyInfoDTO>();
			
			while (rs.next()) {
				
				MyInfoDTO dto = new MyInfoDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setFrseq(rs.getString("frseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setGap(rs.getInt("gap"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	//MyReviewData 서블릿 -> 내 후기 목록
	public ArrayList<MyInfoDTO> reviewList(String mseq) {
		try {

			String sql = "select seq, bname, star, content, to_char(regdate, 'yy/mm/dd') as regdate from vwBrokerReview where mseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			rs = pstat.executeQuery();

			ArrayList<MyInfoDTO> list = new ArrayList<MyInfoDTO>();

			while (rs.next()) {

				MyInfoDTO dto = new MyInfoDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setBname(rs.getString("bname"));
				dto.setStar(rs.getString("star"));
				dto.setDetail(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}


}
