package com.test.sist.estimate;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;

public class BoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private CallableStatement cstat;
	
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
	
	
	//estimate. AdoptOk서블릿의 호출 -> 채택하기(글쓰기랑 비슷.. 프로시저 활용할 것임)
	public int adopt(BoardDTO dto) {
		
		try {
			
			String sql = "{ call procAdopt(?) }";
			//프로시저 호출하기 -> 이때 프로시저 매개변수가 dto로 받아서 넘어와야 함. 
			
			cstat = conn.prepareCall(sql);
			
			
			cstat.setString(1, dto.getSeq());
			
			return cstat.executeUpdate();
			
			
		} catch(Exception e) {
			
			System.out.println("adopt: " + e);
		}
		
		return 0;
	}

	
	
	//estimate.  WriteOk서블릿의 호출 -> 견적서 쓰기
	public int write(BoardDTO dto) {
		
		try {
			
			String sql = "insert into tblEstimate1th (seq, regDate, approvalFSeq, requestSeq, estimatedCost, eContent, adoptFlag) values (seqEstimate1th.nextVal, default, ?, ?, ?, ?, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getApprovalFSeq());
			pstat.setString(2, dto.getRequestSeq());
			pstat.setInt(3, dto.getEstimatedCost());
			pstat.setString(4, dto.geteContent());
			
			return pstat.executeUpdate();
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	
	
	//ReceiveEstimateList 서블릿이 호출함. -> 고객에게 온 견적서 목록을 반환하기
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = String.format("where mseq = %s", (map.get("memberSeq")));
			
			if (map.get("search") != null) {
				where = String.format("where mseq = %s", (map.get("memberSeq")));
			}
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwEstimate1th %s) a) where rnum between %s and %s"
									, where
									, map.get("begin")
									, map.get("end")); //이렇게 하면 가장 위에 있는게 올라온다... 한게 더 만들어야 한다.
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq")); //고객에게 전송된 견적서의 번호
				dto.setRegDate(rs.getString("regDate"));
				dto.setApprovalFSeq(rs.getString("approvalFSeq")); //업체승인번호
				dto.setRequestSeq(rs.getString("requestSeq"));
				dto.setEstimatedCost(rs.getInt("estimatedCost"));
				dto.seteContent(rs.getString("eContent"));
				dto.setAdoptFlag(rs.getString("adoptFlag"));
				dto.setFirmName(rs.getString("firmName"));
				dto.setPortfolio(rs.getString("portfolio"));
				
				
				list.add(dto);
			}
			return list;
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	}

	
	//ReceivedEstimate 서블릿 -> 총 페이지 수 구하는 메서드를 호출
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("");
			}
			
			String sql = String.format("select count(*) as cnt from vwEstimate1th %s", where);
			
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


	
	
	
	
	
	
	

}
