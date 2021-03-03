package com.test.codestudy.chat;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

//WebSocket 서버
// - Endpoint(종단점) : 네트워크 통신에서 상대방의 주소
@ServerEndpoint("/server")
public class Ex02Server {

	
	@OnOpen
	public void handleOpen() {
		//new Socket(url)
		System.out.println("클라이언트가 서버에 접속했습니다.");
	}
	
	@OnClose
	public void handleClose() {
		//ws.close()
		System.out.println("클라이언트가 접속 종료되었습니다.");
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	@OnMessage
	public String handleMessage(String message) {
		
		//클라이언트 -> 서버
		System.out.println("클라이언트가 메시지를 전달했습니다. : " + message);
		
		
		//서버 -> 클라이언트
		return "(응답)" + message;
		
	}
	
}














