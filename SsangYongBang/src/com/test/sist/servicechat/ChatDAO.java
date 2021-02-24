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
	
	
	
	
	
	
	
	
}
