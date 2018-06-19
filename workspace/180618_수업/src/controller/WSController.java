package controller;

import java.util.List;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class WSController {
	
	//동시접속자들의 세션
	private List<WebSocketSession> sessions;
	
	public void setSessions(List<WebSocketSession> sessions) {
		System.out.println(sessions.size());
		this.sessions = sessions;
	}
	
	//새로운 유저가 들어오는 메서드
	public void add(WebSocketSession session) {
		System.out.println("유저 들어옴");
		
		//새로운 유저가 들어왔으니까 
		// sessions에 추가
		sessions.add(session);
		
		System.out.println("사람수:"+sessions.size());
		
	}
	
	public void remove(WebSocketSession session) {
		System.out.println("유저 나감");
		
		//나갔으니까 삭제
		sessions.remove(session);
		
		System.out.println("사람수:"+sessions.size());
		
	}

	public void handleMsg(WebSocketSession session, String msg) {
		
		//동시접속자 전부
		broadcast(msg);
	}
	
	//sessions에 있는 모든 session에
	//메세지 보냄
	private void broadcast(String msg){
		
		for( WebSocketSession session :
			sessions) {
			
			try {
				session.sendMessage(new TextMessage(msg.getBytes()));
			} catch (Exception e) {
				e.printStackTrace();
			}//try ~ catch end
			
		}//for end
		
	}//broadcast() end
	
	
	
}
