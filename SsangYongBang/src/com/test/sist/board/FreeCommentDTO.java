package com.test.sist.board;

/**
 * 
 * @author 이찬미
 *
 */
public class FreeCommentDTO {

	private String seq;
	private String detail;
	private String regdate;
	private String frseq;
	private String delflag;
	
	private String authorname;
	private String authorseq;
	
	private String zerobonem; //중개사 0 회원 1
	private int gap;
	
	
	public int getGap() {
		return gap;
	}

	public void setGap(int gap) {
		this.gap = gap;
	}

	public String getZerobonem() {
		return zerobonem;
	}

	public void setZerobonem(String zerobonem) {
		this.zerobonem = zerobonem;
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

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
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

	public String getFrseq() {
		return frseq;
	}

	public void setFrseq(String frseq) {
		this.frseq = frseq;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

}
