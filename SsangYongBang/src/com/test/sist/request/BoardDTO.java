package com.test.sist.request;

public class BoardDTO {
	//고객요청서 전체 리스트 정보
	private String mseq; //회원번호
	private String email; //회원이메일
	private String rseq; //고객요청서번호
	private String stype; //서비스품목
	private String address; //주소지
	private String shape; //가옥구조
	private String desiredDay; //서비스희망시작일
	private String detail; //상세사항
	private String area; //면적
	private String regDate; //작성일
	
	private String serviceSeq; // 고객요청서 테이블 열(서비스품목번호)과 이름 동일하게 맞춘것.
	
	private String approvalFSeq; //고객이 업체를 지정할 시 필요 데이터
	
	
	public String getApprovalFSeq() {
		return approvalFSeq;
	}
	public void setApprovalFSeq(String approvalFSeq) {
		this.approvalFSeq = approvalFSeq;
	}
	public String getServiceSeq() {
		return serviceSeq;
	}
	public void setServiceSeq(String serviceSeq) {
		this.serviceSeq = serviceSeq;
	}
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRseq() {
		return rseq;
	}
	public void setRseq(String rseq) {
		this.rseq = rseq;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getDesiredDay() {
		return desiredDay;
	}
	public void setDesiredDay(String desiredDay) {
		this.desiredDay = desiredDay;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
