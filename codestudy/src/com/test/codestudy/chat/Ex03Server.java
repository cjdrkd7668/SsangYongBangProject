package com.test.codestudy.chat;

import java.util.ArrayList;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatserver")
public class Ex03Server {
	
	//현재 서버에 접속한 클라이언트의 WebSocket Session 목록
	private static ArrayList<Session> list = new ArrayList<Session>();

	@OnOpen
	public void handleOpen(Session userSession) {
		
		//클라이언트 연결 요청 + 접속
		System.out.println("클라이언트 접속 성공");
		
		//if (list.size() < 2) {
			list.add(userSession); //접속자 관리
		//} else {
			//userSession.getBasicRemote().sendText("유저가 꽉찼습니다.");
		//}
		
		//System.out.println(list); //덤프
		
		for (Session session : list) {
			//목록내에서 현재 접속한 사람이 아닌 사람 -> 나 빼고 나머지
			if (session != userSession) {
				
				try {
					
					//해당 세션에 연결된 클라이언트에게 메시지를 전달한다.
					session.getBasicRemote().sendText("다른 유저가 접속했습니다.");
					
				} catch (Exception e) {
					System.out.println(e);
				}
				
			}
		}
		
	}
	
	@OnClose
	public void handleClose(Session userSession) {
		
		System.out.println("클라이언트 접속 해제");
		
		//접속을 끊은 유저는 세션 리스트에서 제거
		list.remove(userSession);		
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	@OnMessage
	public String handleMessage(String message, Session userSession) {
		
		//클라이언트 -> 서버 -> 다른 클라이언트
		
		//강아지#안녕하세요.
		int index = message.indexOf("#");
		
		String user = message.substring(0, index);
		String txt = message.substring(index + 1);
		
		for (Session session : list) {
			if (session != userSession) {
				try {
					session.getBasicRemote().sendText(message);
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}
		
		
		return null;
	}
	
}










