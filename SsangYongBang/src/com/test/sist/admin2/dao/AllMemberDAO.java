package com.test.sist.admin2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import com.test.sist.DBUtil;
import com.test.sist.admin2.dto.BrokerDTO;
import com.test.sist.admin2.dto.FirmDTO;
import com.test.sist.admin2.dto.MemberDTO;

public class AllMemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AllMemberDAO() {
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

	public ArrayList<MemberDTO> getMemberList(HashMap<String,String> map) {
		
		try {
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			
			String sql = "select * from (select m.*, rownum as rnum from tblMember m where delFlag != 1 order by seq desc) where rnum between ? and ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,map.get("begin"));
			pstat.setString(2,map.get("end"));
			
			rs = pstat.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				Calendar now = Calendar.getInstance();
				String yearTwo;
				if (Integer.parseInt((now.get(Calendar.YEAR)+"").substring(0,2)) + 10 < Integer.parseInt(rs.getString("ssn").substring(0,2))) {
					yearTwo = "19";
				}else {
					yearTwo = "20";
				}
				
				dto.setSeq(rs.getString("seq"));
				dto.setEmail(rs.getString("email"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setSsn(rs.getString("ssn"));
				dto.setPhone(rs.getString("phone").substring(0,3) + "-" + rs.getString("phone").substring(3,7) + "-" + rs.getString("phone").substring(7,11));
				dto.setAddress(rs.getString("address"));
				dto.setDelFlag(rs.getString("delFlag"));
				
				dto.setId(rs.getString("email"));
				dto.setGender(rs.getString("ssn").substring(7,8).equals("1")?"남자":"여자");
				dto.setAge(now.get(Calendar.YEAR) - Integer.parseInt(yearTwo + rs.getString("ssn").substring(0,2)) + "");
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getMemberInfo()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int getMemberCnt() {
		
		try {
			
			String sql = "select count(*) cnt from tblMember where delFlag != 1";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
	
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getMemberCnt()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public ArrayList<BrokerDTO> getBrokerList(HashMap<String,String> map) {
		
		try {
			ArrayList<BrokerDTO> list = new ArrayList<BrokerDTO>();
			
			String sql = "select * from (select m.*, rownum as rnum from tblBroker m where delFlag != 1 order by seq desc) where rnum between ? and ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,map.get("begin"));
			pstat.setString(2,map.get("end"));
			
			rs = pstat.executeQuery();

			while (rs.next()) {
				BrokerDTO dto = new BrokerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setEmail(rs.getString("email"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setBusinessName(rs.getString("businessName"));
				dto.setBrokerNum(rs.getString("brokerNum"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel").substring(0,2) + "-" + rs.getString("tel").substring(2,5) + "-" + rs.getString("tel").substring(5,9));
				dto.setBusinessNum(rs.getString("businessNum"));
				dto.setDocumentURL(rs.getString("documentURL"));
				dto.setDelFlag(rs.getString("delFlag"));
				
				dto.setId(rs.getString("email"));
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getBrokerInfo()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int getBrokerCnt() {
		
			try {
			
			String sql = "select count(*) cnt from tblBroker where delFlag != 1";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
	
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getBrokerCnt()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public ArrayList<FirmDTO> getFirmList(HashMap<String,String> map) {
		
		try {
			ArrayList<FirmDTO> list = new ArrayList<FirmDTO>();
			
			String sql = "select * from (select m.*, rownum as rnum from tblFirm m where delFlag != 1 order by seq desc) where rnum between ? and ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,map.get("begin"));
			pstat.setString(2,map.get("end"));
			
			rs = pstat.executeQuery();
	
			while (rs.next()) {
				FirmDTO dto = new FirmDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setPortfolio(rs.getString("portfolio"));
				dto.setAvailablePoint(rs.getString("availablePoint"));
				dto.setApproval(rs.getString("approval"));
				dto.setDelFlag(rs.getString("delFlag"));
				dto.setCategorySeq(rs.getString("categorySeq"));
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getFirmInfo()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getFirmCnt() {
		
		try {
			
			String sql = "select count(*) cnt from tblFirm where delFlag != 1";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
	
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getFirmCnt()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public MemberDTO getMemberInfo(String seq) {
		
		try {
			
			String sql = "select * from tblMember where delFlag != 1 and seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,seq);
			
			rs = pstat.executeQuery();

			if (rs.next()) {
				MemberDTO dto = new MemberDTO();
				Calendar now = Calendar.getInstance();
				String yearTwo;
				if (Integer.parseInt((now.get(Calendar.YEAR)+"").substring(0,2)) + 10 < Integer.parseInt(rs.getString("ssn").substring(0,2))) {
					yearTwo = "19";
				}else {
					yearTwo = "20";
				}
				
				dto.setSeq(rs.getString("seq"));
				dto.setEmail(rs.getString("email"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setSsn(rs.getString("ssn"));
				dto.setPhone(rs.getString("phone").substring(0,3) + "-" + rs.getString("phone").substring(3,7) + "-" + rs.getString("phone").substring(7,11));
				dto.setAddress(rs.getString("address"));
				dto.setDelFlag(rs.getString("delFlag"));
				
				dto.setId(rs.getString("email"));
				dto.setGender(rs.getString("ssn").substring(7,8).equals("1")?"남자":"여자");
				dto.setBirthY(yearTwo + rs.getString("ssn").substring(0,2));
				dto.setBirthM(rs.getString("ssn").substring(2,4));
				dto.setBirthD(rs.getString("ssn").substring(4,6));
				dto.setAge(now.get(Calendar.YEAR) - Integer.parseInt(yearTwo + rs.getString("ssn").substring(0,2)) + "");
				dto.setSsnF(rs.getString("ssn").substring(0,6));
				dto.setSsnL(rs.getString("ssn").substring(7,14));
				dto.setPhoneF(rs.getString("phone").substring(0,3));
				dto.setPhoneM(rs.getString("phone").substring(3,7));
				dto.setPhoneL(rs.getString("phone").substring(7,11));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getMemberInfo()");
			e.printStackTrace();
		}
		
		return null;
	}

	

}
















