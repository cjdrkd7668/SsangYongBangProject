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
 * 
 * @author 이찬미
 *
 */
public class InquiryDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;

	/**
	 * DB 연결을 위한 기본 생성자입니다.
	 */
	public InquiryDAO() {
		conn = DBUtil.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// InquiryList 서블릿 -> 총 페이지 수 반환
	public int totalPage(String seq) {

		try {

			String sql = "select ceil((select count(seq) from vwInquiry where openFlag = 1 or authorSeq = ?) / 10) as total from dual";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("total");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	// InquiryList 서블릿 -> 글 목록
	public ArrayList<InquiryDTO> list(HashMap<String, String> map, String authorseq) {

		try {

			String sql = "{call procListInquiry(?, ?, ?, ?)}";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, authorseq);
			cstat.setString(2, map.get("page"));
			cstat.setString(3, map.get("search"));
			cstat.registerOutParameter(4, OracleTypes.CURSOR);

			cstat.executeQuery();

			rs = (ResultSet) cstat.getObject(4);

			ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();

			while (rs.next()) {
				InquiryDTO dto = new InquiryDTO();

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
			System.err.println(e);
		}
		return null;
	}

}