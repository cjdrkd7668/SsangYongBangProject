package com.test.sist.news;

/**
 * 
 * @author 이찬미
 *
 */
public class NewsDTO {
	
	String seq;
	String subject;
	String detail;
	String imageurl;
	String regdate;
	String adminseq;
	String delflag;
	
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
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAdminseq() {
		return adminseq;
	}
	public void setAdminseq(String adminseq) {
		this.adminseq = adminseq;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	
}
