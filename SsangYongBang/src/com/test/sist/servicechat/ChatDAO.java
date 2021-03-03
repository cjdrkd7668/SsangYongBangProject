package com.test.sist.servicechat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.sist.DBUtil;

public class ChatDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	public ChatDAO() {
		
		conn = DBUtil.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch(Exception e) {
			System.out.println(e);
		}
		
	}

	
	//PartnerList 서블릿 -> 채팅상대 목록 반환을 목적으로 메서드 호출
	//로그인한 업체 기준에서, 견적서를 채택한 고객의 리스트 보여준다.
	//로그인한 업체의 승인번호를 매개로 하여 견적서번호, 회원명, 회사이름 중복 제거하고 가져오기
	public ArrayList<ChatDTO> list(String approvalFSeq) {
	
		try {
			
			String sql = "select distinct estimate1thSeq, membername, firmname from vwChatlog  where approvalFSeq = ? order by estimate1thSeq, membername, firmname";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, approvalFSeq);
			rs = pstat.executeQuery();

			
			ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
			

			
			while (rs.next()) {
				ChatDTO dto = new ChatDTO();
				
				dto.setEstimate1thSeq(rs.getString("estimate1thSeq"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setFirmName(rs.getString("firmname"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}

	
	
	//ServiceChat 서블릿의 호출 -> 업체승인번호&견적서번호를 매개변수로 하여 해당하는 채팅log목록을 불러오는 메서드를 호출
	public ArrayList<ChatDTO> listChatLog(String estimate1thSeq, String approvalFSeq) {
		
		try {
			
			String sql = "select * from vwChatLog where approvalFSeq = ? and estimate1thSeq = ? order by timesent asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, approvalFSeq);
			pstat.setString(2, estimate1thSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ChatDTO> chatLogList = new ArrayList<ChatDTO>();
			
			while (rs.next()) {
				
				ChatDTO dto = new ChatDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTimesent(rs.getString("timesent"));
				dto.setEstimate1thSeq(rs.getString("estimate1thSeq"));
				dto.setChatContent(rs.getString("chatContent"));
				dto.setWhoFlag(rs.getString("whoFlag"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setFirmName(rs.getString("firmName"));
				dto.setApprovalFSeq(rs.getString("approvalFSeq"));
				
				
				chatLogList.add(dto);
				
			}
			return chatLogList;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}

	
	//SendOk 서블릿 -> 채팅 입력하기
	public int send(ChatDTO dto) {
		
		
		try {
			
			String sql = "INSERT INTO tblChatAsk (seq, timeSent, estimate1thSeq, chatContent, whoFlag) VALUES (seqChatAsk.nextVal, default, ?, ?, ?)";
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getEstimate1thSeq());
			pstat.setString(2, dto.getChatContent());
			pstat.setString(3, dto.getWhoFlag());
			
			return pstat.executeUpdate();
			//쪽지와 다르게 한 사람이 한 사람한테 하나 보내는 거라서 결과값은 성공시 1
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	
	//MembersPartnerList 서블릿 -> 채팅상대 목록 반환을 목적으로 메서드 호출
	//로그인한 회원 기준에서, 견적서를 채택한 업체의 리스트 보여준다.
	//로그인한 회원의 회원번호를 매개로 하여 견적서번호, 회원명, 회사이름 중복 제거하고 가져오기
	public ArrayList<ChatDTO> firmlist(String memberSeq) {
		

		try {
			
			String sql = "select distinct estimate1thSeq, membername, firmname from vwChatlog where memberSeq = ? order by estimate1thSeq, membername, firmname";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
			
			while (rs.next()) {
				
				ChatDTO dto = new ChatDTO();
				
				dto.setEstimate1thSeq(rs.getString("estimate1thSeq"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setFirmName(rs.getString("firmname"));
				
				list.add(dto);
			}

			return list;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
		
		return null;
	}

	
	
	//MemberChat 서블릿에서 업체견적서번호, 로그인한 회원번호를 매개변수로 넘기며 해당하는 대화 기록 반환을 목적으로 메서드를 호출
	
	public ArrayList<ChatDTO> membersListChatLog(String estimate1thSeq, String memberSeq) {
	
		
		try {
			
			String sql = "select * from vwChatLog where memberSeq = ? and estimate1thSeq = ? order by timesent asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberSeq);
			pstat.setString(2, estimate1thSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ChatDTO> chatLogList = new ArrayList<ChatDTO>();
			
			while (rs.next()) {
				
				ChatDTO dto = new ChatDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTimesent(rs.getString("timesent"));
				dto.setEstimate1thSeq(rs.getString("estimate1thSeq"));
				dto.setChatContent(rs.getString("chatContent"));
				dto.setWhoFlag(rs.getString("whoFlag"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setFirmName(rs.getString("firmName"));
				dto.setApprovalFSeq(rs.getString("approvalFSeq"));
			
				chatLogList.add(dto);
			}	

			return chatLogList;
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}
	
	
	

	
	
	
	
	
	
	
}
