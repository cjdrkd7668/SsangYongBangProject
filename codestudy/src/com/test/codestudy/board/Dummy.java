package com.test.codestudy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.codestudy.DBUtil;

public class Dummy {

	public static void main(String[] args) {
		
		//게시판 더미
		//insert into tblBoard (seq, subject, content, regdate, readcount, mseq, filename, orgfilename) values (seqBoard.nextVal, ?, ?, default, default, ?, ?, ?)
		
		//subject, content, mseq
		
		String[] subject = { "게시판 테스트입니다.", "JSP 수업중~", "게시판 만들고 있습니다.", "날씨가 춥습니다.", "페이징 처리하는 중입니다.", "에러가 났어요;;", "오라클이 안돌아가요~", "배고파~~", "춥다, 졸리다;;", "스프링 수업 다다음주~~", "이력서 작성 후 검토받으세요~" };
		String content = "내용입니다.";
		String[] mseq = { "1", "2", "3" }; //각자 본인 회원 번호들
		
		Connection conn = null;
		PreparedStatement stat = null;
		Random rnd = new Random();
		
		try {
			
			conn = DBUtil.open();
			
			//BoardDAO.java -> write()
			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, mseq, filename, orgfilename, downloadcount, thread, depth) values (seqBoard.nextVal, ?, ?, default, default, ?, null, null, default, ?, 0)";
			
			//String sql = "update tblBoard set content = ? where seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			for (int i=1; i<100; i++) {
				stat.setString(1, subject[rnd.nextInt(subject.length)]);
				stat.setString(2, content);
				stat.setString(3, mseq[rnd.nextInt(mseq.length)]);
				stat.setInt(4, i*1000);
				
//				stat.setString(1, subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " ");
//				stat.setString(2, i + "");
				
				System.out.println(i + ":" + stat.executeUpdate());
			}
			
			stat.close();
			conn.close();
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}
	
}





















