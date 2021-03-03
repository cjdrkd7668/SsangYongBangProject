package com.test.sist.inquiry.dto;

/**
 * InquiryCommentDTO 문의게시판 댓글 정보를 담은 클래스입니다.
 * seq 댓글 번호
 * iqrseq 문의글 번호
 * admseq 관리자 번호
 * admname 관리자 이름
 * detail 댓글 내용
 * regdate 작성일
 * gap 시간 차
 * @author 이찬미
 *
 */
public class InquiryCommentDTO {

	private String seq;
	private String iqrseq; 
	private String admseq;
	private String admname; 
	private String detail; 
	private String regdate; 
	
	private int gap;

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

	public int getGap() {
		return gap;
	}

	public void setGap(int gap) {
		this.gap = gap;
	}
	
	
}
