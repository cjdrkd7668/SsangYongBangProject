package com.test.sist.notice;

public class NoticeDTO {
	private String seq;
	private String subject;
	private String detail;
	private String imageurl;
	private String regdate;
	private String adminseq;
	
	private String readcount;
	private String adminname;
	private String gap;
	
	public String getGap() {
		return gap;
	}

	public void setGap(String gap) {
		this.gap = gap;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
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
}
