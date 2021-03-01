package com.test.sist.servicereview;

public class BoardDTO {
	
	private String seq; //후기번호
	private String completionSeq; //서비스 완료 등록번호
	private String regdate; //후기등록일자
	private String reviewContent; //후기내용
	private String contentURL; //후기사진 
	private String delFlag; //삭제여부 (0: 게시, 1: 삭제)
	private String memberSeq; // 작성 회원번호
	
	//업체승인번호 필드 추가
	private String approvalFSeq; //업체승인번호
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCompletionSeq() {
		return completionSeq;
	}
	public void setCompletionSeq(String completionSeq) {
		this.completionSeq = completionSeq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getContentURL() {
		return contentURL;
	}
	public void setContentURL(String contentURL) {
		this.contentURL = contentURL;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(String memberSeq) {
		this.memberSeq = memberSeq;
	}
	

}

