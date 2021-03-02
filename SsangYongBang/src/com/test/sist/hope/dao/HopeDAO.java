package com.test.sist.hope.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.hope.dto.HopeDTO;

public class HopeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public HopeDAO() {
		//DB 연결
		conn = DBUtil.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println("Member_listDAO.close()");
			e.printStackTrace();
		}
	}
	
	public ArrayList<HopeDTO> getList(HashMap<String, String> map) {
		try {
			
			ArrayList<HopeDTO> list = new ArrayList<HopeDTO>();
			
			String sql = "select * from (select h2.*, rownum as rnum from (select h.* from vwHopeWrite h order by seq desc) h2)  where rnum between ? and ? order by seq desc";

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,map.get("begin"));
			pstat.setString(2,map.get("end"));
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				HopeDTO dto = new HopeDTO();
				dto.setSeq(rs.getString("seq")); //글 번호
				dto.setMseq(rs.getString("mseq")); //회원 번호
				dto.setMname(rs.getString("mname")); //회원 이름
				dto.setPhone(rs.getString("phone")); //회원 전화번호
				dto.sethDType(rs.getString("hDType")); //희망거래유형
				dto.sethPrice(String.format("%,d",rs.getInt("hPrice"))); //희망가격
				dto.sethRent(String.format("%,d",rs.getInt("hRent"))); //희망월세
				dto.sethAddress(rs.getString("hAddress")); //지역
				dto.sethArea(rs.getString("hArea")); //희망면적(전용면적)
				dto.sethRoomNum(rs.getString("hRoomNum")); //희망방개수
				dto.setContent(rs.getString("content")); //내용
//				dto.setImgURL(rs.getString("imgURL")); //가상인테리어 이미지주소(HTML태그)
				
				dto.sethRentPrice(dto.gethPrice() + "/" + dto.gethRent()); //보증금+월세
				
				list.add(dto);
			}
			
			rs.close();
			
			return list;
			
		} catch (Exception e) {
			System.out.println("HopeDAO.getList()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getCount() {
		
		try {
			
			stat = conn.createStatement();
			
			String sql = "select count(*) as cnt from vwHopeWrite";
			
			rs = stat.executeQuery(sql);
			
			int cnt = 0;
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			rs.close();
			stat.close();
			conn.close();
			
			return cnt;
			
		} catch (Exception e) {
			System.out.println("HopeDAO.getCount()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int write(HopeDTO dto) {
		System.out.println("dto.getMseq() : " + dto.getMseq());
		
		try {
			
			String sql = "insert into tblHopePrice(seq, price, rent, hopeTypeSeq) values(seqHopePrice.nextVal, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,dto.gethPrice());
			pstat.setString(2,dto.gethRent());
			pstat.setString(3,dto.gethDType());
			
			int result = pstat.executeUpdate();
			
			
			sql = "insert into tblHopeWrite(seq, zone, area, roomAmount, content, memberSeq, hopePriceSeq, delFlag) values(seqHopeWrite.nextVal, ?, ?, ?, ?, ?, seqHopePrice.currVal, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,dto.gethAddress());
			pstat.setString(2,dto.gethArea());
			pstat.setString(3,dto.gethRoomNum());
			pstat.setString(4,dto.getContent());
			pstat.setString(5,dto.getMseq());
			
			result *= pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("HopeDAO.write()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int remove(String seqs) {
		
		try {
			
			String sql = "update tblHopeWrite set delFlag = 1 where seq in (" + seqs + ")";
			
			stat = conn.createStatement();
			
			return stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println("HopeDAO.remove()");
			e.printStackTrace();
		}
		
		return 0;
		
	}

	public HopeDTO getItem(String seq) {
		try {
			
			String sql = "select * from vwHopeWrite where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				HopeDTO dto = new HopeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setMname(rs.getString("mname"));
				dto.setPhone(rs.getString("phone"));
				dto.sethDType(rs.getString("hDType"));
				dto.sethPrice(rs.getString("hPrice"));
				dto.sethRent(rs.getString("hRent"));
				dto.sethAddress(rs.getString("hAddress"));
				dto.sethArea(rs.getString("hArea"));
				dto.sethRoomNum(rs.getString("hRoomNum"));
				dto.setContent(rs.getString("content"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("HopeDAO.getItem()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int edit(HopeDTO dto) {
		
		try {
			
			String sql = "update tblHopePrice set price = ?, rent = ?, hopeTypeSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,dto.gethPrice());
			pstat.setString(2,dto.gethRent());
			pstat.setString(3,dto.gethDType());
			
			int result = pstat.executeUpdate();
			
			
			sql = "update tblHopeWrite set zone = ?, area = ?, roomAmount = ?, content = ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,dto.gethAddress());
			pstat.setString(2,dto.gethArea());
			pstat.setString(3,dto.gethRoomNum());
			pstat.setString(4,dto.getContent());
			
			result *= pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("HopeDAO.edit()");
			e.printStackTrace();
		}
		
		return 0;
		
	}
}






