package com.test.sist.hope.dto;

public class HopeDTO {
	private String seq; //글 번호
	private String mseq; //회원 번호
	private String mname; //회원 이름
	private String phone; //회원 전화번호
	private String hDType; //희망거래유형
	private String hPrice; //희망가격
	private String hRent; //희망월세
	private String hAddress; //지역
	private String hArea; //희망면적(전용면적)
	private String hRoomNum; //희망방개수
	private String content; //내용
	private String imgURL; //가상인테리어 이미지주소(HTML태그)
	
	private String hRentPrice; //보증금+월세

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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String gethDType() {
		return hDType;
	}

	public void sethDType(String hDType) {
		this.hDType = hDType;
	}

	public String gethPrice() {
		return hPrice;
	}

	public void sethPrice(String hPrice) {
		this.hPrice = hPrice;
	}

	public String gethRent() {
		return hRent;
	}

	public void sethRent(String hRent) {
		this.hRent = hRent;
	}

	public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}

	public String gethArea() {
		return hArea;
	}

	public void sethArea(String hArea) {
		this.hArea = hArea;
	}

	public String gethRoomNum() {
		return hRoomNum;
	}

	public void sethRoomNum(String hRoomNum) {
		this.hRoomNum = hRoomNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}

	public String gethRentPrice() {
		return hRentPrice;
	}

	public void sethRentPrice(String hRentPrice) {
		this.hRentPrice = hRentPrice;
	}
	
	
	
}
