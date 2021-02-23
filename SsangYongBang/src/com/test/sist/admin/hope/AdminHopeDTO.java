package com.test.sist.admin.hope;

public class AdminHopeDTO {

	private String seq; //희망입주조건 번호
	private String mseq; //작성한 회원 번호
	private String mname; //작성한 회원 이름
	private String phone; //작성한 회원 연락처
	private String hdtype; //희망거래형태
	private String hprice; //희망가격(매매/전세가, 보증금)
	private String hrent; //희망 관리비
	private String haddress; //희망 지역
	private String harea; //희망 면적
	private String hroomnum; //희망 방 개수
	private String content; //상세 내용
	private String imgURL; //이미지 URL
	
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
	public String getHdtype() {
		return hdtype;
	}
	public void setHdtype(String hdtype) {
		this.hdtype = hdtype;
	}
	public String getHprice() {
		return hprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	public String getHrent() {
		return hrent;
	}
	public void setHrent(String hrent) {
		this.hrent = hrent;
	}
	public String getHaddress() {
		return haddress;
	}
	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}
	public String getHarea() {
		return harea;
	}
	public void setHarea(String harea) {
		this.harea = harea;
	}
	public String getHroomnum() {
		return hroomnum;
	}
	public void setHroomnum(String hroomnum) {
		this.hroomnum = hroomnum;
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
}
