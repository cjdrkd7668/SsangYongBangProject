package com.test.sist.member;

/**
 * MyPostDTO. 내가 쓴 글에 대한 정보를 담은 클래스입니다.
 * @author 이찬미
 *
 */
public class MyPostDTO {

	private String seq; //글 번호
	private String subject; //제목
	private String detail; //내용
	private String regdate; //작성일
	private String readcount; //조회수
	private String authorseq; //작성자(본인) 번호
	private String zerobonem; //중개사와의 구분을 위한 식별 번호 0이면 중개사 1이면 회원
	private String gap; //시간 차
	private String which; //어느 게시판에서 가져왔는지 - 자유, 문의
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getAuthorseq() {
		return authorseq;
	}
	public void setAuthorseq(String authorseq) {
		this.authorseq = authorseq;
	}
	public String getZerobonem() {
		return zerobonem;
	}
	public void setZerobonem(String zerobonem) {
		this.zerobonem = zerobonem;
	}
	public String getGap() {
		return gap;
	}
	public void setGap(String gap) {
		this.gap = gap;
	}
	public String getWhich() {
		return which;
	}
	public void setWhich(String which) {
		this.which = which;
	}

	
}
