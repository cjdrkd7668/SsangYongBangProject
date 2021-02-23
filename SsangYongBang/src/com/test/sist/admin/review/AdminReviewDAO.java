package com.test.sist.admin.review;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class AdminReviewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	public AdminReviewDAO() {
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//해시맵을 매개로 글 목록 반환
	public ArrayList<AdminReviewDTO> getList(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select * from (select rownum as rnum, rdv.*, \r\n" + 
					"(select content from tblBrokerReview where seq = rdv.rvdSeq) as brvContent,\r\n" + 
					"(select imgurl from tblBrokerReview where seq = rdv.rvdSeq) as brvImgURL,\r\n" + 
					"(select (select email from tblmember where seq = brv.memberseq) from tblBrokerReview brv where seq = rdv.rvdSeq) as brvId,\r\n" + 
					"(select (select name from tblmember where seq = brv.memberseq) from tblBrokerReview brv where seq = rdv.rvdseq) as brvName\r\n" + 
					"from vwBReviewDeleteList rdv) where rnum between %s and %s"
					, map.get("begin")
					, map.get("end")
					);
			
			rs = stat.executeQuery(sql);
			
			ArrayList<AdminReviewDTO> list = new ArrayList<AdminReviewDTO>();
			
			while (rs.next()) {
				AdminReviewDTO dto = new AdminReviewDTO();
				
				dto.setSeq(rs.getString("rvdseq"));
				dto.setBrkSeq(rs.getString("brkSeq"));
				dto.setBrvSeq(rs.getString("brvSeq"));
				dto.setBusinessName(rs.getString("brkbusinessName"));
				dto.setDetail(rs.getString("rvddetail"));
				dto.setDoneFlag(rs.getString("doneFlag"));
				dto.setReviewContent(rs.getString("brvContent"));
				dto.setImgURL(rs.getString("brvimgURL"));
				dto.setBrvId(rs.getString("brvId"));
				dto.setBrvName(rs.getString("brvName"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public int getTotalCountReviewDel() {
		
		try {
			
			String sql = "select count(*) as cnt from vwBReviewDeleteList";
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
	
	
}

















































