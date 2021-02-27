package com.test.sist.admin2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.sist.admin2.dao.AllMemberDAO;
import com.test.sist.admin2.dto.BrokerDTO;
import com.test.sist.admin2.dto.FirmDTO;
import com.test.sist.admin2.dto.MemberDTO;

@WebServlet("/admin2/member_reg_ok.do")
public class Member_reg_ok extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
				req,
				req.getRealPath("/files"),
				1024 * 1024 * 100,
				"UTF-8",
				new DefaultFileRenamePolicy()
			);
		
		AllMemberDAO dao = new AllMemberDAO();
		MemberDTO ndto = new MemberDTO();
		BrokerDTO bdto = new BrokerDTO();
		FirmDTO fdto = new FirmDTO();
		
		String mode = multi.getParameter("mode");	//EDIT:수정, DEL:삭제
		String type = multi.getParameter("type");	//N:일반회원, B:중개사, F:업체
		String seq = multi.getParameter("seq");	//N:일반회원, B:중개사, F:업체
		int result = 0;
		String typeWord = "";
		if (type.equals("N")) {
			typeWord = "normal";
		}else if (type.equals("B")) {
			typeWord = "broker";
		}else if (type.equals("F")) {
			typeWord = "firm";
		}
		
		/* 회원 */
		ndto.setSeq(seq);
		ndto.setEmail(multi.getParameter("email"));
		ndto.setPw(multi.getParameter("pw") == "" || multi.getParameter("pw").equals("") ? multi.getParameter("pwd") : multi.getParameter("pw"));
		ndto.setName(multi.getParameter("name"));
		ndto.setSsn(multi.getParameter("ssn1") + "-" + multi.getParameter("ssn2"));
		ndto.setPhone(multi.getParameter("tel1") + multi.getParameter("tel2") + multi.getParameter("tel3"));
		ndto.setAddress(multi.getParameter("address"));
		ndto.setDelFlag(multi.getParameter("delFlag"));
		
		/* 중개사 */
		bdto.setSeq(seq);
		bdto.setEmail(multi.getParameter("id"));
		bdto.setPw(multi.getParameter("pw") == "" || multi.getParameter("pw").equals("") ? multi.getParameter("pwd") : multi.getParameter("pw"));
		bdto.setName(multi.getParameter("name"));
		bdto.setBusinessName(multi.getParameter("businessName"));
		bdto.setBrokerNum(multi.getParameter("brokerNum1") + multi.getParameter("brokerNum2"));
		bdto.setAddress(multi.getParameter("address"));
		bdto.setTel(multi.getParameter("tel1") + multi.getParameter("tel2") + multi.getParameter("tel3"));
		bdto.setBusinessNum(multi.getParameter("bizNo1") + multi.getParameter("bizNo2") + multi.getParameter("bizNo3") );
		bdto.setDocumentURL(multi.getFilesystemName("documentURL") == "" || multi.getFilesystemName("documentURL") == null || multi.getFilesystemName("documentURL").equals("") ? multi.getParameter("documentURLOri") : multi.getFilesystemName("documentURL"));
		bdto.setDelFlag(multi.getParameter("delFlag"));
		bdto.setRegdate(multi.getParameter("regdate"));
				
		/* 업체 */
		fdto.setSeq(seq);
		fdto.setId(multi.getParameter("id"));
		fdto.setPw(multi.getParameter("pw") == "" || multi.getParameter("pw").equals("") ? multi.getParameter("pwd") : multi.getParameter("pw"));
		fdto.setEmail(multi.getParameter("email"));
		fdto.setAddress(multi.getParameter("address"));
		fdto.setTel(multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3"));
		fdto.setIntroduction(multi.getParameter("introduction"));
		fdto.setPortfolio(multi.getParameter("portfolio") == "" || multi.getFilesystemName("portfolio") == null || multi.getFilesystemName("portfolio").equals("") ? multi.getParameter("portfolioOri") : multi.getFilesystemName("portfolio"));
		fdto.setAvailablePoint(multi.getParameter("availablePoint"));
		fdto.setDelFlag(multi.getParameter("delFlag"));
		
		if (mode.equals("EDIT")) {	//회원 수정
			if (type.equals("N")) {	//일반회원
				result = dao.editMember(ndto);
			}else if (type.equals("B")) {	//중개사
				result = dao.editBroker(bdto);
			}else if (type.equals("F")) {	//업체
				result = dao.editFirm(fdto);
			}
		}
		
//		if (mode.equals("DEL")) {	//회원 삭제
//			if (type.equals("N")) {	//일반회원
//				result = dao.delMember(ndto);
//			}
//			
//			if (type.equals("B")) {	//중개사
//				result = dao.delBroker(bdto);
//			}
//
//			if (type.equals("F")) {	//업체
//				result = dao.delFirm(fdto);
//			}
//		}
		
			if (result == 1) {
				//성공
				if (mode.equals("EDIT")) {
					resp.sendRedirect(String.format("/sybang/admin2/member_detail_%s.do?seq=%s", type, seq));
				}
//				else if(mode.equals("DEL")){
//					resp.sendRedirect("/sybang/admin2/member_list.do?type=" + typeWord);
//				}
			} else {
				//실패 -> 경고 + 뒤로 가기
				PrintWriter writer = resp.getWriter();
				resp.setContentType("text/html; charset=UTF-8");
				
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('실패');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}