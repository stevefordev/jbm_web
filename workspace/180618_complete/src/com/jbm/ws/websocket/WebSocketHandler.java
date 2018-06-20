package com.jbm.ws.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jbm.ws.controller.WSController;

public class WebSocketHandler extends TextWebSocketHandler {
	
	private WSController controller;
	
	
	public void setController(WSController controller) {
		this.controller = controller;
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		controller.remove(session);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		System.out.println("설립");
		controller.add(session);
	}
	
	@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		System.out.println("메세지 왔음");
		controller.execute(session, (String)message.getPayload());
	}
	

}
