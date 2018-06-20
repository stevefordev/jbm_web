package com.jbm.ws.controller;

import java.util.Collection;
import java.util.Map;
import java.util.Vector;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jbm.ws.vo.Protocol;
import com.jbm.ws.vo.User;

public class WSController {
	
private ObjectMapper mapper;
	
	public void setMapper(ObjectMapper mapper) {
		this.mapper = mapper;
	}
	
	private Map<String,User> userMap;
	

	public void setUserMap(Map<String, User> userMap) {
		this.userMap = userMap;
	}

	private Vector<WebSocketSession> sessions;
	
	public void setSessions(Vector<WebSocketSession> sessions) {
		this.sessions = sessions;
	}
	
	public void add(WebSocketSession session) throws Exception {
		
		System.out.println("새로운 사용자 나타남");
		
		sessions.add(session);
		
		Protocol protocol = new Protocol(Protocol.ASK_JOIN,session.getId(), session.getRemoteAddress().getHostString());
		

		System.out.println(protocol);
		
		this.sendMessage(protocol,session);
		
		System.out.println("사용자들:"+userMap);
	}
	
	
	public void sendMessage(Protocol protocol,WebSocketSession session) throws Exception{
		String msg = mapper.writeValueAsString(protocol);
		
		System.out.println("sendMessage:"+msg);
		
		session.sendMessage(new TextMessage(msg));
	}
	
	private void broadcast(Protocol protocol) throws Exception{
		
		String msg = mapper.writeValueAsString(protocol);
		
		for(WebSocketSession session: sessions) {
			session.sendMessage(new TextMessage(msg));
		}
	}
	
	public void execute(WebSocketSession session, String msg) throws Exception{
		
		System.out.println(msg);
		
		Protocol protocol = mapper.readValue(msg, Protocol.class);
		
		System.out.println(protocol.getCode());
		
		switch(protocol.getCode()) {
		case 3:
			protocol.setId(session.getId());
			this.setUser(protocol, session);
			return;
		case 4:;
		case 5:;
		case 6:;
		case 7:;
		case 8:this.broadcast(protocol);
		
		}
	}
	
	private void setUser(Protocol protocol,WebSocketSession session) throws Exception{
		
		User user = new User(protocol);
		userMap.put(session.getId(), user);
		
		changeUsers(protocol);
	}
	
	private void changeUsers(Protocol protocol) throws Exception{
		Collection<User> userList = userMap.values();
		
		System.out.println(protocol);
		
		String json = mapper.writeValueAsString(userList);
		
		System.out.println(userList);
				
		protocol.setMsg(json);
		
		broadcast(protocol);
	}
	
	public void remove(WebSocketSession session) throws Exception {
		sessions.remove(session);
		
		User user = userMap.get(session.getId());
		
		userMap.remove(session.getId());
		System.out.println("사용자 나감");
		System.out.println(userMap);
		
		Protocol protocol = new Protocol(Protocol.LEAVE);
		
		protocol.setNickname(user.getNickname());
		protocol.setImg(user.getImg());
		protocol.setId(session.getId());
		
		changeUsers(protocol);
		
	}

}
