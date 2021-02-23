package com.test.sist.member;

public class MemberDTO {

	private String seq;
	private String email;
	private String pw;
	private String name;
	private String ssn;
	private String phone;
	private String address;
	private String delflag;
	
	private String zerobonem = "1"; //중개사 0 회원 1
	
	public String getZerobonem() {
		return zerobonem;
	}

	public void setZerobonem(String zerobonem) {
		this.zerobonem = zerobonem;
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

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

}
