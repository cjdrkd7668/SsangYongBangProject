package com.test.sist.admin.review;

public class AdminReviewDTO {
	
	private String seq; 			//후기 삭제 요청 번호
	private String brkSeq; 			//요청한 중개사 번호
	private String brvSeq;			//후기 번호
	private String businessName;	//요청한 중개사 이름
	private String detail;			//삭제 사유
	private String doneFlag;		//처리 여부("처리" or "미처리")
	private String reviewContent;	//후기 내용
	private String imgURL;			//후기 이미지 이름
	private String brvId;			//후기 작성한 회원 아이디
	private String brvName;			//후기 작성한 회원 이름
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getBrkSeq() {
		return brkSeq;
	}
	public void setBrkSeq(String brkSeq) {
		this.brkSeq = brkSeq;
	}
	public String getBrvSeq() {
		return brvSeq;
	}
	public void setBrvSeq(String brvSeq) {
		this.brvSeq = brvSeq;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDoneFlag() {
		return doneFlag;
	}
	public void setDoneFlag(String doneFlag) {
		this.doneFlag = doneFlag;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getBrvId() {
		return brvId;
	}
	public void setBrvId(String brvId) {
		this.brvId = brvId;
	}
	public String getBrvName() {
		return brvName;
	}
	public void setBrvName(String brvName) {
		this.brvName = brvName;
	}
	
}
