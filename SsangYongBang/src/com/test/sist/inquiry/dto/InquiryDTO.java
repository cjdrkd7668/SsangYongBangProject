package com.test.sist.inquiry.dto;

/**
 * InquiryDTO. 문의게시판 글 정보를 담은 클래스입니다.
 * seq 글 번호
 * subject 제목
 * detail 내용
 * regdate 작성일
 * openflag 삭제여부
 * readcount 조회수
 * authorseq 작성자 번호
 * authorname 작성자 이름
 * zerobonem 중개사와 회원 구분 플래그(0:중개사 1:회원)
 * ccount 댓글 수
 * gap 시간 차
 * @author 이찬미
 *
 */
public class InquiryDTO {
	
	private String seq;
	private String subject;
	private String detail;
	private String regdate;
	private String openflag;
	private String readcount;
	private String authorseq;
	private String authorname;
	private String zerobonem;
	private String ccount;
	private int gap;
	
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
	public String getOpenflag() {
		return openflag;
	}
	public void setOpenflag(String openflag) {
		this.openflag = openflag;
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
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public String getZerobonem() {
		return zerobonem;
	}
	public void setZerobonem(String zerobonem) {
		this.zerobonem = zerobonem;
	}
	public String getCcount() {
		return ccount;
	}
	public void setCcount(String ccount) {
		this.ccount = ccount;
	}
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}

	
}
