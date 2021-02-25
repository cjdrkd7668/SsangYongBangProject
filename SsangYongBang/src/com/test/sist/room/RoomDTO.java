package com.test.sist.room;

public class RoomDTO {
	
	private String seq; 			//방 게시글 번호
	private String mSeq; 			//게시한 회원 번호
	private String name; 			//게시한 회원 이름
	private String phone;			//게시한 회원 연락처
	private String bType;			//방 타입
	private String dType;			//거래 형태
	private int price;				//가격
	private int rent;				//월세
	private int monthlyFee;		//관리비
	private String address;			//지역
	private int exclusiveArea;		//전용면적
	private int supplyArea;		//공급면적
	private String selectedFloor;	//해당 층
	private String totalFloor;		//총 층
	private int roomNum;			//방 개수
	private	int bathroomNum;		//화장실 개수
	private String direction;		//방향
	private String completionYear;	//준공년도
	private String parkingFlag;		//주차가능여부
	private String elevator;		//엘레베이터의 존재
	private String pet;				//반려동물 주거 가능 여부
	private String subject;			//방 게시글 제목
	private String detail;			//방 게시글 상세내용
	private String regDate;			//방 게시글 작성일자
	
	private String[] url;			//방 게시글 이미지
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getmSeq() {
		return mSeq;
	}
	public void setmSeq(String mSeq) {
		this.mSeq = mSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getbType() {
		return bType;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public String getdType() {
		return dType;
	}
	public void setdType(String dType) {
		this.dType = dType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public int getMonthlyFee() {
		return monthlyFee;
	}
	public void setMonthlyFee(int monthlyFee) {
		this.monthlyFee = monthlyFee;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getExclusiveArea() {
		return exclusiveArea;
	}
	public void setExclusiveArea(int exclusiveArea) {
		this.exclusiveArea = exclusiveArea;
	}
	public int getSupplyArea() {
		return supplyArea;
	}
	public void setSupplyArea(int supplyArea) {
		this.supplyArea = supplyArea;
	}
	public String getSelectedFloor() {
		return selectedFloor;
	}
	public void setSelectedFloor(String selectedFloor) {
		this.selectedFloor = selectedFloor;
	}
	public String getTotalFloor() {
		return totalFloor;
	}
	public void setTotalFloor(String totalFloor) {
		this.totalFloor = totalFloor;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getBathroomNum() {
		return bathroomNum;
	}
	public void setBathroomNum(int bathroomNum) {
		this.bathroomNum = bathroomNum;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getCompletionYear() {
		return completionYear;
	}
	public void setCompletionYear(String completionYear) {
		this.completionYear = completionYear;
	}
	public String getParkingFlag() {
		return parkingFlag;
	}
	public void setParkingFlag(String parkingFlag) {
		this.parkingFlag = parkingFlag;
	}
	public String getElevator() {
		return elevator;
	}
	public void setElevator(String elevator) {
		this.elevator = elevator;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String[] getUrl() {
		return url;
	}
	public void setUrl(String[] url) {
		this.url = url;
	}

	
}
