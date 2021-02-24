package com.test.sist.servicechat;

public class ChatDTO {
	
	//vwChatLog 의 열 모두 가져온 정보.(조인+서브쿼리 테이블의 뷰)
	
	private String seq; //채팅 테이블 채팅 번호
	private String timesent;  //보낸시간
	private String estimate1thSeq; //견적서번호
	private String chatContent; //채팅내용
	private String whoFlag; //업체 or 고객 확인
	private String memberName; //고객이름
	private String memberSeq; //고객번호
	private String firmName; //회사이름
	private String firmSeq; //회사번호
	private String approvalFSeq; //업체승인번호
	
	public String getApprovalFSeq() {
		return approvalFSeq;
	}
	public void setApprovalFSeq(String approvalFSeq) {
		this.approvalFSeq = approvalFSeq;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTimesent() {
		return timesent;
	}
	public void setTimesent(String timesent) {
		this.timesent = timesent;
	}
	public String getEstimate1thSeq() {
		return estimate1thSeq;
	}
	public void setEstimate1thSeq(String estimate1thSeq) {
		this.estimate1thSeq = estimate1thSeq;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getWhoFlag() {
		return whoFlag;
	}
	public void setWhoFlag(String whoFlag) {
		this.whoFlag = whoFlag;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(String memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getFirmName() {
		return firmName;
	}
	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}
	public String getFirmSeq() {
		return firmSeq;
	}
	public void setFirmSeq(String firmSeq) {
		this.firmSeq = firmSeq;
	}

}
