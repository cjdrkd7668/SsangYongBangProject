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
	public int totalPage() {

		try {

			String sql = "select ceil((select count(*) from vwInquiry) / 10) as total from dual";

			stat = conn.createStatement();
			rs = pstat.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("total");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	// InquiryList 서블릿 -> 글 목록
	public ArrayList<InquiryDTO> list(HashMap<String, String> map, String access, String authorseq) {

		try {

			String sql = "{call procListInquiry(?, ?, ?, ?, ?)}";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, access);
			cstat.setString(2, authorseq);
			cstat.setString(3, map.get("page"));
			cstat.setString(4, map.get("search"));
			cstat.registerOutParameter(5, OracleTypes.CURSOR);

			cstat.executeQuery();

			rs = (ResultSet) cstat.getObject(5);

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

	//InquiryPostOk 서블릿 -> 글쓰기
	public int post(InquiryDTO dto) {
		try {

			String sql = "{ call procAddInquiryMember(?, ?, ?, ?) }";

			cstat = conn.prepareCall(sql);

			cstat.setString(1, dto.getAuthorseq());
			cstat.setString(2, dto.getSubject());
			cstat.setString(3, dto.getDetail());
			cstat.setString(4, dto.getOpenflag());

			return cstat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

}