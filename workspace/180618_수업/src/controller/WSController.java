package controller;

import java.util.List;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vo.Protocol;

public class WSController {
	
	//json 파싱용
	private ObjectMapper mapper;
	
	public void setMapper(ObjectMapper mapper) {
		this.mapper = mapper;
	}
	
	//동시접속자들의 세션
	private List<WebSocketSession> sessions;
	
	public void setSessions(List<WebSocketSession> sessions) {
		System.out.println(sessions.size());
		this.sessions = sessions;
	}
	
	//새로운 유저가 들어오는 메서드
	public void add(WebSocketSession session) 
			throws Exception {
		System.out.println("유저 들어옴");
		
		//새로운 유저가 들어왔으니까 
		//sessions에 추가
		sessions.add(session);
		
		System.out.println("new 사람수:"+sessions.size());
		
		//프로토콜 객체 생성
		Protocol protocol = new Protocol();
		
		//새로운 유저 정보 요청
		protocol.setCode(1);
		protocol.setIp(session.getRemoteAddress().getHostString());
		protocol.setId(session.getId());
		
		//Protocol객체를 json으로
		String json = mapper.writeValueAsString(protocol);
		
		session.sendMessage(new TextMessage(json.getBytes()));
		
	}//add end
	
	public void remove(WebSocketSession session) {
		System.out.println("유저 나감");
		
		//나갔으니까 삭제
		sessions.remove(session);
		
		System.out.println("사람수:"+sessions.size());
		
	}

	public void handleMsg(WebSocketSession session, String msg) {
		
		try {
			Protocol protocol = 
			mapper.readValue(msg, Protocol.class);
			
			System.out.println("code:"+protocol.getCode());
			
			switch(protocol.getCode()) {
			case 2 :
				
				broadcast(msg);
				break;
			case 4 :
				//System.out.println("4:"+msg);
				broadcast(msg);
				break;
			}//switch() end
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try~catch end
		
		//System.out.println("handleMsg:"+msg);
		
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
