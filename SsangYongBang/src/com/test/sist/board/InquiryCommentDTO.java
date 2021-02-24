package com.test.sist.board;

/**
 * 
 * @author 이찬미
 *
 */
public class InquiryCommentDTO {

	private String seq; // 댓글 번호
	private String iqrseq; // 문의글 번호
	private String admseq; // 관리자 번호
	private String admname; // 관리자 이름
	private String detail; // 댓글 내용
	private String regdate; // 작성일
	
	private int gap;
	
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

	public String getIqrseq() {
		return iqrseq;
	}

	public void setIqrseq(String iqrseq) {
		this.iqrseq = iqrseq;
	}

	public String getAdmseq() {
		return admseq;
	}

	public void setAdmseq(String admseq) {
		this.admseq = admseq;
	}

	public String getAdmname() {
		return admname;
	}

	public void setAdmname(String admname) {
		this.admname = admname;
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

}
