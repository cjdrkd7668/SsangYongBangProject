package com.test.sist.member.chat;

/**
 * 
 * @author 이찬미
 *
 */
public class ChatDTO {

	private String seq; // 1:1 문의 번호(tblChat)
	private String mseq; // 회원 번호
	private String abseq; // 승인중개사 번호
	private String bname; // 사업자 상호
	private String subject;
	private String content;
	private String regdate; // 문의일
	private String regtime; // 문의 시각

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

	public String getAbseq() {
		return abseq;
	}

	public void setAbseq(String abseq) {
		this.abseq = abseq;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

}
