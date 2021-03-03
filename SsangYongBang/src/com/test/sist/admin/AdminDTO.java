package com.test.sist.admin;

public class AdminDTO {
	
	private String seq;
	private String id; //관리자의 이메일은 id라는 컬럼으로 저장되어 있습니다.
	private String pw;
	private String name;
	
	private int nonApprovalBrokers;
	private int nonApprovalFirms;
	private int reviewDelRequests;
	private int newInquiries;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNonApprovalBrokers() {
		return nonApprovalBrokers;
	}
	public void setNonApprovalBrokers(int nonApprovalBrokers) {
		this.nonApprovalBrokers = nonApprovalBrokers;
	}
	public int getNonApprovalFirms() {
		return nonApprovalFirms;
	}
	public void setNonApprovalFirms(int nonApprovalFirms) {
		this.nonApprovalFirms = nonApprovalFirms;
	}
	public int getReviewDelRequests() {
		return reviewDelRequests;
	}
	public void setReviewDelRequests(int reviewDelRequests) {
		this.reviewDelRequests = reviewDelRequests;
	}
	public int getNewInquiries() {
		return newInquiries;
	}
	public void setNewInquiries(int newInquiries) {
		this.newInquiries = newInquiries;
	}
	
}
