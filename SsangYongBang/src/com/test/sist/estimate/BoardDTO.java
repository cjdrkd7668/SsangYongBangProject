package com.test.sist.estimate;

public class BoardDTO {
	
	//업체 견적서 기본정보
	private String seq; //견적서 번호
	private String regDate; //작성일
	private String approvalFSeq; //업체승인번호
	private String requestSeq; //요청서 번호(견적서를 몇 번 요청서에 보내는지에 대한 번호)
	private int estimatedCost; // 예상비용
	private String eContent; //견적서내용
	private String adoptFlag; //견적서 채택 여부
	
	
	//견적서 (테이블 조인) 정보 추가
	private String portfolio;
	private String firmName;
	

	public String getFirmName() {
		return firmName;
	}
	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}
	public String getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getApprovalFSeq() {
		return approvalFSeq;
	}
	public void setApprovalFSeq(String approvalFSeq) {
		this.approvalFSeq = approvalFSeq;
	}
	public String getRequestSeq() {
		return requestSeq;
	}
	public void setRequestSeq(String requestSeq) {
		this.requestSeq = requestSeq;
	}
	public int getEstimatedCost() {
		return estimatedCost;
	}
	public void setEstimatedCost(int estimatedCost) {
		this.estimatedCost = estimatedCost;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	public String getAdoptFlag() {
		return adoptFlag;
	}
	public void setAdoptFlag(String adoptFlag) {
		this.adoptFlag = adoptFlag;
	}
	
	
}
