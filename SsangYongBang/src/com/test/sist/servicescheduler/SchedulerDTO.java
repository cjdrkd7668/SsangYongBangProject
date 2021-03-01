package com.test.sist.servicescheduler;

public class SchedulerDTO {
	//https://fullcalendar.io/docs/event-parsing
	//풀캘린더에서 화면상 일정을 출력하는 events 객체가 가지는 속성들
	//이중, title( 서비스 예정 /서비스 진행 /서비스 완료), url(견적서 사본)을 공식 속성으로 사용
	
	//https://fullcalendar.io/docs/event-object
	// 캘린더의 이벤트 모델에서 지원되는 속성 외, 
	//추가속성(비공식)도 사용가능(extendedProps: {} 이 괄호 안에 적으면 된다.)
	// 추가속성에는 고객명, 견적서 번호를 사용 예정
	
	//컬럼은 고객요청서-업체견적서 join
	//상관서브쿼리로 고객정보/승인업체정보/일정등록 정보를 가져온 view에서 select문으로 정보 추출 예정

	private String firmname; //업체명
	private String approvalFseq; //업체승인번호
	private String memberName;  //고객병
	private String memberSeq; //고객번호
	private String progress; //진행상태 (예정/진행/완료)
	private String serviceDate; //일자 
	private String estimateURL; //견적서 URL
	private String estimate1thSeq; //견적서번호
	
	
	//서비스완료 컬럼 추가
	private String charge; //비용 
	private String receiptURL; //영수증 
	
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getReceiptURL() {
		return receiptURL;
	}
	public void setReceiptURL(String receiptURL) {
		this.receiptURL = receiptURL;
	}
	public String getFirmname() {
		return firmname;
	}
	public void setFirmname(String firmname) {
		this.firmname = firmname;
	}
	public String getApprovalFseq() {
		return approvalFseq;
	}
	public void setApprovalFseq(String approvalFseq) {
		this.approvalFseq = approvalFseq;
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
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getServiceDate() {
		return serviceDate;
	}
	public void setServiceDate(String serviceDate) {
		this.serviceDate = serviceDate;
	}
	public String getEstimateURL() {
		return estimateURL;
	}
	public void setEstimateURL(String estimateURL) {
		this.estimateURL = estimateURL;
	}
	public String getEstimate1thSeq() {
		return estimate1thSeq;
	}
	public void setEstimate1thSeq(String estimate1thSeq) {
		this.estimate1thSeq = estimate1thSeq;
	}
	
	
	
}
