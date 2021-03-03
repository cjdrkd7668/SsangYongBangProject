package com.test.sist.member;

/**
 * 
 * @author 이찬미
 *
 */
public class MyInfoDTO {

	private String seq; //글 번호(글 조회일 경우)
	private String subject; //제목
	private String detail; //내용
	private String regdate; //작성일
	private String readcount; //조회수
	private String authorseq; //작성자(본인) 번호
	private String zerobonem; //중개사와의 구분을 위한 식별 번호 0이면 중개사 1이면 회원
	private int gap; //시간 차
	private String which; //어느 게시판에서 가져왔는지 - 자유, 문의
	private String ccount; //댓글 수
	
	private String frseq; //글 번호(댓글일 경우)
	
	private String bname; //중개사 이름
	private String star; //평점
	
	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public String getAuthorseq() {
		return authorseq;
	}

	public void setAuthorseq(String authorseq) {
		this.authorseq = authorseq;
	}

	public String getZerobonem() {
		return zerobonem;
	}

	public void setZerobonem(String zerobonem) {
		this.zerobonem = zerobonem;
	}

	public int getGap() {
		return gap;
	}

	public void setGap(int gap) {
		this.gap = gap;
	}

	public String getWhich() {
		return which;
	}

	public void setWhich(String which) {
		this.which = which;
	}

	public String getCcount() {
		return ccount;
	}

	public void setCcount(String ccount) {
		this.ccount = ccount;
	}

	public String getFrseq() {
		return frseq;
	}

	public void setFrseq(String frseq) {
		this.frseq = frseq;
	}
	
	
	
}
