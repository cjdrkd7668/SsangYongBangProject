package com.test.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;

/**
 * 
 * @author 이찬미
 *
 */
public class MyPostDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MyPostDAO() {
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

	//MyPostOk 서블릿 -> 내가 쓴 글 총 페이지 수 반환
	public int postTotalPage(String authorseq) {
		
		try {
			
			String sql = "select ceil(("
					+ "    select count(*) as total from ("
					+ "        select * from ("
					+ "        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree"
					+ "        union"
					+ "        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry)"
					+ "        order by regdate desc)"
					+ "    where authorseq = ? and zerobonem = 1) / 10) as total from dual";
			
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

	//MyPostOk 서블릿 -> 내가 쓴 글 목록
	public ArrayList<MyPostDTO> postList(String authorseq) {
		
		try {
			
			String sql = "select p.*, rnum from ("
					+ "    select u.*, rownum as rnum from ("
					+ "        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '자유게시판' as which from vwFree"
					+ "        union"
					+ "        select seq, authorseq, subject, detail, regdate, readcount, gap, zerobonem, '문의게시판' as which from vwInquiry"
					+ "        where authorseq = ? and zerobonem = 1"
					+ "        order by regdate desc) u"
					+ "    where authorseq = ? and zerobonem = 1"
					+ "    order by regdate desc) p";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, authorseq);
			pstat.setString(2, authorseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyPostDTO> list = new ArrayList<MyPostDTO>();
			
			if (rs.next()) {
				
				MyPostDTO dto = new MyPostDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setAuthorseq(rs.getString("authorseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetail(rs.getString("detail"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setGap(rs.getString("gap"));
				dto.setZerobonem(rs.getString("zerobonem"));
				dto.setWhich(rs.getString("whichi"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	
}
