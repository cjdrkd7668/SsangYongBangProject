package com.test.codestudy.board;

public class CommentDTO {

	private String seq;
	private String ccontent; //ccomment
	private String mseq;
	private String bseq;
	private String regdate;
	
	private String name;
	private String id;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getBseq() {
		return bseq;
	}
	public void setBseq(String bseq) {
		this.bseq = bseq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	
	
	
}
