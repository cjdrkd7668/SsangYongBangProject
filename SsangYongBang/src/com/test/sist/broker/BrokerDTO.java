package com.test.sist.broker;
/**
 * 중개사의 정보를 담은 DTO 클래스입니다.
 * @author 황원준
 *
 */
public class BrokerDTO {
	
	private String seq; 			//중개사 번호
	private String email;			//이메일
	private String pw;				//비밀번호
	private String name;			//사업자 대표명
	private String businessName;	//사업자 상호
	private String brokerNum;		//중개 등록 번호
	private String address;			//주소지
	private String tel;				//전화번호
	private String businessNum;		//사업자 등록번호
	private String documentURL;		//서류경로
	private String delFlag;			//탈퇴여부
	
	
	private String approBrokerSeq; //승인 중개사 번호
	
	public String getApproBrokerSeq() {
		return approBrokerSeq;
	}
	public void setApproBrokerSeq(String approBrokerSeq) {
		this.approBrokerSeq = approBrokerSeq;
	}
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBrokerNum() {
		return brokerNum;
	}
	public void setBrokerNum(String brokerNum) {
		this.brokerNum = brokerNum;
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
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getDocumentURL() {
		return documentURL;
	}
	public void setDocumentURL(String documentURL) {
		this.documentURL = documentURL;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	


}
