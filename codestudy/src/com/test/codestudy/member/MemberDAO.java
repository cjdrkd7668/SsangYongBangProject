package com.test.codestudy.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.codestudy.BarDTO;
import com.test.codestudy.DBUtil;
import com.test.codestudy.PiDTO;

//서블릿 X -> 일반 클래스 O
public class MemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
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

	//RegisterOk 서블릿이 MemberDTO를 주면서 회원 가입 시켜주세요.. 위임
	public int add(MemberDTO dto) {
		
		try {
			
			String sql = "insert into tblMember (seq, id, name, email, pw, pic, regdate) values (seqMember.nextVal, ?, ?, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getPw());
			pstat.setString(5, dto.getPic()); //첨부파일명(사용자 or nopic)
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	//Login 서블릿이 id,pw 주면서 회원이 맞는지 검사.. 위임
	public int login(MemberDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMember"
								+ " where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1 or 0
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	//Login 서블릿이 id를 건내주면서 회원 정보를 달라고 위임
	public MemberDTO getMember(String id) {
		
		try {
			
			String sql = "select * from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPic(rs.getString("pic"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	
	//Send 서블릿 -> 나 빼고 다른 사람들 모두 반환
	public ArrayList<MemberDTO> listMember(String seq) {
		
		try {
			
			String sql = "select seq, name, id from tblMember where seq <> ? order by name asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			
			ArrayList<MemberDTO> mlist = new ArrayList<MemberDTO>();
			
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				MemberDTO dto = new MemberDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				mlist.add(dto);
			}
			
			return mlist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//SendOk 서블릿 -> 쪽지 발송
	public int send(MessageDTO dto) {
		
		try {
			
			int result = 0;
			
			String sql = "insert into tblMessage (seq, smseq, rmseq, content, regdate, state) values (seqMessage.nextVal, ?, ?, ?, default, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSmseq());
			pstat.setString(3, dto.getContent());
			
			for (String rmseq : dto.getRmseq()) {				
				pstat.setString(2, rmseq);//받는 회원 번호들을 순차적으로 대입				
				result += pstat.executeUpdate();				
			}
			
			return result;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	//Message 서블릿 -> 본인에게 온 쪽지 목록
	public ArrayList<MessageDTO> listMessage(String rmseq) {
		
		try {
			
			String sql = "select m.*, (select name from tblMember where seq = m.smseq) as name, (select id from tblMember where seq = m.smseq) as id from tblMessage m where rmseq = ? order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rmseq);
			rs = pstat.executeQuery();
			
			ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
			
			while (rs.next()) {
				MessageDTO dto = new MessageDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSmseq(rs.getString("smseq"));
				dto.setRmseq(new String[] { rs.getString("rmseq") });
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setState(rs.getString("state"));
				dto.setSname(rs.getString("name"));
				dto.setSid(rs.getString("id"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//View 서블릿 -> 쪽지 1개 반환
	public MessageDTO getMessage(String seq) {
		
		try {
			
			String sql = "select m.*, (select name from tblMember where seq = m.smseq) as name, (select id from tblMember where seq = m.smseq) as id from tblMessage m where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			MessageDTO dto = new MessageDTO();
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setSmseq(rs.getString("smseq"));
				dto.setRmseq(new String[] { rs.getString("rmseq") });
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setState(rs.getString("state"));
				dto.setSname(rs.getString("name"));
				dto.setSid(rs.getString("id"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//Header 서블릿 -> 나에게 온 쪽지 개수??
	public int getCountMessage(String mseq) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMessage where rmseq = ? and state = 0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public void updateState(String rmseq) {
		
		try {
			
			String sql = "update tblMessage set state = 1 where rmseq = ? and state = 0";//확인 안함(0) -> 확인함(1)
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rmseq);
			
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	public void updateRead(String seq) {
		
		try {
			
			String sql = "update tblMessage set state = 2 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	public ArrayList<BarDTO> getBar() {
		
		try {
			
			String sql = "select count(*) as cnt, mseq, (select name from tblMember where seq = tblBoard.mseq) as name from tblBoard group by mseq having count(*) > 10";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BarDTO> blist = new ArrayList<BarDTO>();
			
			while (rs.next()) {
				BarDTO dto = new BarDTO();
				dto.setMseq(rs.getString("mseq"));
				dto.setName(rs.getString("name"));
				dto.setCnt(rs.getString("cnt"));
				blist.add(dto);
			}
			
			return blist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<PiDTO> getPi() {
		
		try {
			
			String sql = "select count(*) as cnt, mseq, (select name from tblMember where seq = tblComment.mseq) as name from tblComment group by mseq having count(*) > 10";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<PiDTO> blist = new ArrayList<PiDTO>();
			
			while (rs.next()) {
				PiDTO dto = new PiDTO();
				dto.setMseq(rs.getString("mseq"));
				dto.setName(rs.getString("name"));
				dto.setCnt(rs.getString("cnt"));
				blist.add(dto);
			}
			
			return blist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
		
	}
	
}



















