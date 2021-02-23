package com.test.sist.board;

/**
 * FreeDTO. 
 * seq 글 번호
 * subject 글 제목
 * detail 글 내용
 * regdate 작성일
 * delflag 삭제 여부
 * readcount 조회수
 * authorseq 작성자 번호
 * authorname 작성자 이름
 * ccount 댓글수
 * gap 최신글
 * @author 이찬미
 *
 */
public class FreeDTO {
	private String seq;
	private String subject;
	private String detail;
	private String regdate;
	private String delflag;
	private String readcount;

	private String authorseq;
	private String authorname;

	private String ccount;
	private int gap;
	
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

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
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



}
