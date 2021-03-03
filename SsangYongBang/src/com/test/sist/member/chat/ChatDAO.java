package com.test.sist.member.chat;

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
public class ChatDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ChatDAO() {
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

	//Index 서블릿 -> 중개사 목록 얻으러
	public ArrayList<ChatDTO> blist() {
		
		try {
			
			String sql = "select "
					+ "    ab.seq as abseq, "
					+ "    b.businessName as bname "
					+ " from tblApproBroker ab inner join tblBroker b on ab.brokerSeq = b.seq"
					+ " where b.delFlag = 0";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
			
			while (rs.next()) {
				ChatDTO dto = new ChatDTO();
				
				dto.setAbseq(rs.getString("abseq"));
				dto.setBname(rs.getString("bname"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
