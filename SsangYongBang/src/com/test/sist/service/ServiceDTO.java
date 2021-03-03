package com.test.sist.service;

public class ServiceDTO {
	
	private String seq; //업체번호
	private String id; //업체아이디
	private String pw; //업체비번
	private String email; //업체 이메일주소
	private String address; // 업체 주소
	private String tel; //업체연락처
	private String introduction; //업체소개글
	private String portfolio; //업체포트폴리오
	private int availablePoint; //업체 소유 포인트
	private String approval; //업체 승인여부
	private String delFlag; //업체 탈퇴여부
	private String categorySeq; //업체 카테고리번호
	
	
	private String approvalFSeq; //업체승인번호
	
	//해당업체의 후기 정보
	private String completionSeq; //서비스완료번호
	private String regDate; //후기 작서일
	private String reviewContent; //후기내용
	private String contentURL; //후기 사진
	private String rivewDelFlag; //후기 삭제여부 (0: 등록, 1: 삭제)
	private String MemberName; //후기 작성자 명
	private String serviceArea; //고객 요청서 안의 서비스 행할 장소 정보
	
	
	public String getCompletionSeq() {
		return completionSeq;
	}
	public void setCompletionSeq(String completionSeq) {
		this.completionSeq = completionSeq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public String getRivewDelFlag() {
		return rivewDelFlag;
	}
	public void setRivewDelFlag(String rivewDelFlag) {
		this.rivewDelFlag = rivewDelFlag;
	}
	public String getMemberName() {
		return MemberName;
	}
	public void setMemberName(String memberName) {
		MemberName = memberName;
	}
	public String getServiceArea() {
		return serviceArea;
	}
	public void setServiceArea(String serviceArea) {
		this.serviceArea = serviceArea;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}
	public int getAvailablePoint() {
		return availablePoint;
	}
	public void setAvailablePoint(int availablePoint) {
		this.availablePoint = availablePoint;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(String categorySeq) {
		this.categorySeq = categorySeq;
	}
	

}
