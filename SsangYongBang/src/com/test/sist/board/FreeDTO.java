package com.test.sist.board;

/**
 * FreeDTO. 
 * seq 글 번호
 * subject 글 제목
 * detail 글 내용
 * regdate 작성일
 * delflag 삭제 여부
 * readcount 조회수
 * name 이름
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

	private String name;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
