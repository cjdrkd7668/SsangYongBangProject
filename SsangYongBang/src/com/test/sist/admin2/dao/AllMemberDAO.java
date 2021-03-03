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

	/**
	 * DB에 저장되어있는 회원 리스트를 배열리스트로 끊어서 반환(페이징)
	 * @param map 시작값,끝값
	 * @return 회원DTO 배열리스트
	 * @author 임채원
	 */
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
	
	/**
	 * DB에 저장되어있는 회원 수를 반환
	 * @return 총 회원 수
	 * @author 임채원
	 */
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
	
	/**
	 * DB에 저장되어있는 중개사 리스트를 배열리스트로 끊어서 반환(페이징)
	 * @param map 시작값,끝값
	 * @return 중개사DTO 배열리스트
	 * @author 임채원
	 */
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
	
	/**
	 * DB에 저장되어있는 중개사 수를 반환
	 * @return 총 중개사 수
	 * @author 임채원
	*/
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
	
	/**
	 * DB에 저장되어있는 업체 리스트를 배열리스트로 끊어서 반환(페이징)
	 * @param map 시작값,끝값
	 * @return 업체DTO 배열리스트
	 * @author 임채원
	 */
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
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getFirmInfo()");
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * DB에 저장되어있는 업체 수를 반환
	 * @return 총 업체 수
	 * @author 임채원
	 */
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

	/**
	 * DB에 저장되어있는 회원 정보를 반환
	 * @param seq 회원번호
	 * @return 회원DTO
	 * @author 임채원
	 */
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
				
				dto.setSeq(seq);
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
				dto.setAge(now.get(Calendar.YEAR) - Integer.parseInt(yearTwo + rs.getString("ssn").substring(0,2)) + "");
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getMemberInfo()");
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * DB에 저장되어있는 중개사 정보를 반환
	 * @param seq 중개사번호
	 * @return 중개사DTO
	 * @author 임채원
	 */
	public BrokerDTO getBrokerInfo(String seq) {
		
		try {
			
			String sql = "select * from tblBroker b left outer join tblApproBroker a on b.seq = a.brokerSeq where delFlag != 1 and b.seq=?";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,seq);
			
			rs = pstat.executeQuery();

			if (rs.next()) {
				
				BrokerDTO dto = new BrokerDTO();
				
				dto.setSeq(seq);
				dto.setEmail(rs.getString("email"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setBusinessName(rs.getString("businessName"));
				dto.setBrokerNum(rs.getString("brokerNum"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setBusinessNum(rs.getString("businessNum"));
				dto.setDocumentURL(rs.getString("documentURL"));
				dto.setDelFlag(rs.getString("delFlag"));
				dto.setRegdate(rs.getString("regdate") == null ? "미승인" : rs.getString("regdate"));
				
				dto.setId(rs.getString("email"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getMemberInfo()");
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * DB에 저장되어있는 업체 정보를 반환
	 * @param seq 업체번호
	 * @return 업체DTO
	 * @author 임채원
	 */
	public FirmDTO getFirmInfo(String seq) {
		
		try {
			
			String sql = "select * from tblFirm where delFlag != 1 and seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,seq);
			
			rs = pstat.executeQuery();

			if (rs.next()) {
				
				FirmDTO dto = new FirmDTO();
				
				dto.setSeq(seq);
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
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("Member_listDAO.getMemberInfo()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 수정될 회원 정보를 DB에 저장한 후 결과를 반환
	 * @param dto 수정될 새로운 내용
	 * @return 결과
	 * @author 임채원
	 */
	public int editMember(MemberDTO dto) {
		try {

			String sql = "update tblMember set email = ?, pw = ?, name = ?, ssn = ?, phone = ?, address = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getSsn());
			pstat.setString(5, dto.getPhone());
			pstat.setString(6, dto.getAddress());
			pstat.setString(7, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("AllMemberDAO.editMember()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 수정될 중개사 정보를 DB에 저장한 후 결과를 반환
	 * @param dto 수정될 새로운 내용
	 * @return 결과
	 * @author 임채원
	 */
	public int editBroker(BrokerDTO dto) {
		
		try {

			String sql = "update tblBroker set email = ?, pw = ?, name = ?, businessname = ?, brokernum = ?, address = ?, tel = ?, businessnum = ?, documenturl = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getBusinessName());
			pstat.setString(5, dto.getBrokerNum());
			pstat.setString(6, dto.getAddress());
			pstat.setString(7, dto.getTel());
			pstat.setString(8, dto.getBusinessNum());
			pstat.setString(9, dto.getDocumentURL());
			pstat.setString(10, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("AllMemberDAO.editMember()");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 수정될 업체 정보를 DB에 저장한 후 결과를 반환
	 * @param dto 수정될 새로운 내용
	 * @return 결과
	 * @author 임채원
	 */
	public int editFirm(FirmDTO dto) {
		
		try {

			String sql = "update tblFirm set pw = ?, email = ?, address = ?, tel = ?, introduction = ?, portfolio = ?, availablepoint = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getAddress());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getIntroduction());
			pstat.setString(6, dto.getPortfolio());
			pstat.setString(7, dto.getAvailablePoint());
			pstat.setString(8, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("AllMemberDAO.editMember()");
			e.printStackTrace();
		}
		
		return 0;
	}

	

	

	

}
















