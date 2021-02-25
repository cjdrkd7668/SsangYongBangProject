package com.test.sist.house;

public class RoomImgDTO {
	
	private String seq; 		//방 이미지 번호	
	private String url;			//방 이미지 이름
	private String roomPostSeq;	//방 게시글 번호
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRoomPostSeq() {
		return roomPostSeq;
	}
	public void setRoomPostSeq(String roomPostSeq) {
		this.roomPostSeq = roomPostSeq;
	}
	
}
